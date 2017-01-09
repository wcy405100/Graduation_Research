
import os
import sys
import random

cat_dir = 'video_data/'
tlist =[]
for cat in os.listdir(cat_dir):
	if cat == 'eagle':
		label = 1
	else:   label = 0
	for foldn in os.listdir(cat_dir+cat):
		tlist.append(cat+'/'+os.path.splitext(foldn)[0]+' '+str(label))

if len(sys.argv)>1:
	tr = open('tr_lstm_flow.txt','w+')
	ts = open('ts_lstm_flow.txt','w+')
else:
	tr = open('tr_lstm_RGB.txt','w+')
	ts = open('ts_lstm_RGB.txt','w+')

seed = random.randint(0,9)
for indx, ele in enumerate(tlist):
	if indx%10 == seed:
		ts.writelines(ele+'\n')
	else:
		tr.writelines(ele+'\n')
tr.close()
ts.close()
print 'Done!'

