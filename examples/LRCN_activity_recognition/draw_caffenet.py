import caffe
import caffe.draw
from caffe.proto import caffe_pb2
from google.protobuf import text_format

input_net_name =  raw_input('Input the prototxt file name of the net you want to draw(without .prototxt):') 
net_file = input_net_name + '.prototxt'
output_image = input_net_name +'.jpg'
rankdir ='TB'

net = caffe_pb2.NetParameter()
text_format.Merge(open(net_file).read(),net)

print ('Drawing net to %s',output_image)
caffe.draw.draw_net_to_file(net,output_image,rankdir)
print ('Done!')
