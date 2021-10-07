import numpy as np
from skimage.io import imread,imsave,imshow
import glob
from sklearn.utils import shuffle
import keras as ks
import cv2
from keras.optimizers import Adam
from tensorflow.python.keras.callbacks import EarlyStopping, ModelCheckpoint, CSVLogger
from tensorflow.python.keras.models import load_model, Sequential
from tensorflow.python.keras import backend as K
from u0508 import *
from keras.losses import binary_crossentropy
from skimage.transform import resize
from sklearn.model_selection import train_test_split
from skimage import measure, color
from skimage.measure import label, regionprops


path = 'I:/project/PROJECT/project/utest'
weight  = 'F:/mid/saved_models/fovea.h5'
save_path = 'I:/project/PROJECT/project/upre'


im_path = glob.glob(path + '\*.bmp')
name = []

for i in im_path:
    n = i.split('\\')[-1].split('.')[0]
    name.append(n)
    
#train,test = train_test_split(name,test_size=0.1, random_state=3)    

def read_data(im_name,h=544,w=368):
    x = [] 
    s = []
    for i in im_name:
        pic = imread(path + '//' + i + '.bmp').astype(np.float)/255     
        shape_im =pic.shape
        pic = resize(pic,(w,h))
        x.append(pic)
        s.append(shape_im)
    x  = np.stack(x, axis = 0)
    return x,s

def save_max_objects(img):
    labels = measure.label(img)  
    jj = measure.regionprops(labels)  
    if len(jj) == 1:
        out = img        
    else:       
        num = labels.max() 
        del_array = np.array([0] * (num + 1))
        for k in range(num):
            if k == 0:
                initial_area = jj[0].area
                save_index = 1 
            else:
                k_area = jj[k].area
                if initial_area < k_area:
                    initial_area = k_area
                    save_index = k + 1
        del_array[save_index] = 1
        del_mask = del_array[labels]
        out = img * del_mask
    return out

model = Unet()
model.load_weights(weight)
sizeh,sizew = 368,544
output = []
for i in range(0,len(name)):
    x,shape_im = read_data(name[i:i+1])
    result = model.predict(x)[0]
    ans = np.zeros([sizeh,sizew])
    for j in range(0,sizeh):
        for k in range(0,sizew):
#            ans[j,k] = (result[j][k][3] > 0.5).astype(np.uint8)
            ans[j][k] = np.argmax(result[j,k,:],axis=0)
    output.append(ans)
#    out = save_max_objects(ans)
#    if np.sum(ans)>0:
#        out = save_max_objects(ans)
#    else:
#        out = ans
#    out = 1-out
#    fin_ans = resize(out,(shape_im[0][0],shape_im[0][1]))
#    imsave(save_path + '/' + name[i]+'.png',fin_ans)
#    output.append(fin_ans)

