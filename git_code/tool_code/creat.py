import os
#建立目錄'D:\xxoo'
for i  in range (0,2201):
    os.mkdir('/media/john/SP PHD U3/project/PROJECT/project/data/{}'.format(i))
    os.mkdir('/media/john/SP PHD U3/project/PROJECT/project/data/{}/images'.format(i))
    os.mkdir('/media/john/SP PHD U3/project/PROJECT/project/data/{}/masks_slight'.format(i))
    os.mkdir('/media/john/SP PHD U3/project/PROJECT/project/data/{}/masks_norm'.format(i))
    os.mkdir('/media/john/SP PHD U3/project/PROJECT/project/data/{}/masks_serious'.format(i))