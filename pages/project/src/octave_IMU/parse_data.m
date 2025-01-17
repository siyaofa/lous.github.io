function [acc, compass, gyro] = parse_data(uint8_data)
    % raw data present in the order below
    % 6 bytes acc-x y z [1,0] [3,2] [5,4]
    % 6 bytes compass x y z [6,7] [10,11] [8,9]
    % 8 bytes gyro x y z t [16,17] [14,15] [18,19] [12,13]
    data = double(uint8_data);
    %% acc data
    acc(1) = data(2) * 256 + data(1);
    acc(2) = data(4) * 256 + data(3);
    acc(3) = data(6) * 256 + data(5);
    %% compass data
    compass(1) = data(7) * 256 + data(8);
    compass(2) = data(11) * 256 + data(12);
    compass(3) = data(9) * 256 + data(10);
    %% gyro data
    gyro(1) = data(17) * 256 + data(18);
    gyro(2) = data(15) * 256 + data(16);
    gyro(3) = data(19) * 256 + data(20);
    gyro(4) = data(13) * 255 + data(14);
    % convert to the number that matlab can compute
    acc = acc .* (acc < 2^15) - (2^16 + 1 - acc) .* (acc >= 2^15);
    compass = compass .* (compass < 2^15) - (2^16 + 1 - compass) .* (compass >= 2^15);
    gyro = gyro .* (gyro < 2^15) - (2^16 + 1 - gyro) .* (gyro >= 2^15);

endfunction
