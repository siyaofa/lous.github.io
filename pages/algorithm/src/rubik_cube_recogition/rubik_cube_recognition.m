clear; close all; clc;

file_path = '../../pic/rubik_cube_facelet/';
filenames = {'U_cut', 'F_cut', 'D_cut', 'R_cut', 'B_cut', 'L_cut'};
ext = '.jpg';
save_path = 'pic/';

saturation_weight=0.7;

for i = 1:6
    filename = filenames{i};
    [img, hue, saturation, value] = read_face([file_path filename ext]);
    imwrite(hue, [save_path filename '_hue.jpg']);
    imwrite(saturation, [save_path filename '_saturation.jpg']);
    imwrite(value, [save_path filename '_value.jpg']);
    figure(1)
    subplot(5, 6, i); imshow(img);
    subplot(5, 6, 6 + i); imshow(hue);
    subplot(5, 6, 12 + i); imshow(saturation);
    subplot(5, 6, 18 + i); imshow(value);
    subplot(5, 6, 24 + i); imshow((1-saturation_weight)*value+saturation_weight*(1-saturation));

    %{
    figure
    scatter(sin(hue(:)) .* saturation(:), cos(hue(:)) .* saturation(:), 'filled');
    %}

end

%{
figure
title('Raw')
imshow(img)

figure
title('Hue')
imshow(hue)

figure
title('Saturation')
imshow(saturation)

figure
title('Value')
imshow(value)

figure
%scatter3(sin(hue(:)).*saturation(:),cos(hue(:)).*saturation(:),value(:),'filled');
scatter(sin(hue(:)) .* saturation(:),
cos(hue(:)) .* saturation(:), 'filled');
%}
