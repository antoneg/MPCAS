function [layers_encode, layers_decode] = SeperateEncoderDecoder(net,decInputSize)
 layers_encode= nnet.cnn.layer.SequenceInputLayer(0);
 layers_decode= nnet.cnn.layer.SequenceInputLayer(0);
 
  for i = 1:5
    layers_encode(i) = net.Layers(i);
  end
  layers_encode(6) = regressionLayer;
  
layers_decode(1) =  sequenceInputLayer(decInputSize);
 for i = 1:3
   layers_decode(i+1) = net.Layers(i+5);
 end
end
 
 

 
 