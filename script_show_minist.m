%% register caffe environment for windows matlab
%% you may comment line 4 to 6 if you are using linux platform
addpath(fullfile(fileparts(pwd)))
cd +caffe/private;
caffe.reset_all;
cd ../..;

%% configure && active caffe
clear input feature;
caffe.reset_all;
caffe.init_log('log/');
%% configure
param.bs = 128;
load mnist_data;
s = caffe.get_solver('model/solver_test.prototxt', 0);
i=1;
for i = 1 : 3
    switch i
        case 1
            model_name = 'coco_loss';
        case 2
            model_name = 'softmax_loss';
        case 3
            model_name = 'center+softmax_loss';
    end
    s.use_caffemodel(fullfile('model', model_name, '10epoches.caffemodel'));
    s.set_phase('test');
    feature{i} = zeros(length(label_te), 3);
    for iter = 1 : ceil(length(label_te)/param.bs)
        this_id = mod((iter-1)*param.bs:(iter*param.bs-1), length(label_te))+1;
        input{1}{1} = reshape(single(convert_img2caffe(img_te(:,:,this_id)))-127.5, [28 28 1 param.bs])/255;
        s.reshape_as_input(input);
        s.set_input_data(input);
        s.forward_prefilled();
        t = s.nets{1}.blobs('ip1').get_data();
        feature{i}(this_id,:) =squeeze(t)';
    end
end
color = hsv(10);
close all;
for j = 1 : 3
    figure(j)
    switch j
        case 1
            model_name = 'coco\_loss';
        case 2
            model_name = 'softmax\_loss';
        case 3
            model_name = 'center+softmax_loss';
    end
    for i = 0 : 9
        id = find(label_te==i);
        scatter3(feature{j}(id(1:5:end),1), feature{j}(id(1:5:end),2),feature{j}(id(1:5:end),3), 4, 'MarkerEdgeColor', color(i+1,:));
        hold on
    end
    legend('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    title(model_name);
end