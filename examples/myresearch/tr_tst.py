# this file will randomly select 10% of total images in falcon and eagle as testing data and the remaining as trainning data.

import sys
import random

if len(sys.argv)>1:
	with open('flow_eagle.txt','r') as eagle:
		tmp =[lines for lines in eagle]
	with open('flow_falcon.txt','r') as falcon:
		for lines in falcon:
			tmp.append(lines)
	random.shuffle(tmp)

	tr_output = open('train_flow.txt','w+')
	ts_output = open('test_flow.txt','w+')
else:
	with open('eagle.txt','r') as eagle:
		tmp =[lines for lines in eagle]
	with open('falcon.txt','r') as falcon:
		for lines in falcon:
			tmp.append(lines)
	random.shuffle(tmp)

	tr_output = open('train_RGB.txt','w+')
	ts_output = open('test_RGB.txt','w+')

seed =  random.randint(0,9)

for indx,lines in enumerate(tmp):
	if (indx%10 == seed):
		ts_output.writelines(lines)
	else:
		tr_output.writelines(lines)

tr_output.close()
ts_output.close()


