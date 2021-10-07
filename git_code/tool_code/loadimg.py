from skimage.io import imread,imsave
import os, glob
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
day = '2012.10.17'
rl = '3R1'
filename = '/media/xuan/SP PHD U3/project/PROJECT/project/GT/slight/'+day+'/'+ rl +'/'
save_path = '/media/xuan/SP PHD U3/project/PROJECT/project/testgt/'
#filename1 = 'C:/Users/tommy/Desktop/AMDc/noextended/Non-AMD/'
file = []
file.append(filename)
#file.append(filename1)
X,y = [], []
for i in file:
    X.append(glob.glob(i + '/'+ '*.bmp'))
X = X[0]
for j in X:    
    y.append((j.split('/')[-1]))
l = len(y)
c = 512
for i in range (0,l):
#    gt = imread(filename+'{}'.format(y[i]))
    ori = imread('/media/xuan/SP PHD U3/project/PROJECT/project/GT/slight/'+day+'/'+ rl +'/'+ y[i])
    imsave(save_path+'slight_'+str(c)+'.bmp', ori )
#    imsave(save_path+str(c) +'/masks_serious/'+str(c)+'.bmp', gt )
    c = c+1