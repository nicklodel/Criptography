function cipher_lsb(image_path, message)
    % Read the image at the specified path
    image = imread(image_path);

    % Resize the image to its original dimensions using the 'nearest'
    % interpolation method
    image = imresize(image, [size(image,1) size(image,2)], 'nearest');
    
    % Remove any leading or trailing whitespace from the message
    message = strtrim(message);

     % Store the length of the message in the first pixel of the image
    image(1:1:1) = length(message);
    
    % Calculate the total number of bits needed to store the message
    message_length = length(message) * 8;
    
    
    % Convert the message to a sequence of ASCII codes
    ascii_code = uint8(message);
    % Convert the ASCII codes to a binary string
    
    binary_string = transpose(dec2bin(ascii_code,8));
    
    % Reshape the binary string into a single vector
    binary_string = binary_string(:);
    
    % Calculate the length of the binary string
    binary_string_length = length(binary_string);
    
    % Create a vector of zeros with the same length as the binary string
    b = zeros(binary_string_length, 1);
    
    % For each character in the binary string, set the corresponding element
    % in the vector b to 1 if the character is '1' and 0 if it is '0'
    for k = 1:binary_string_length
        if(binary_string(k) == '1')
            b(k) = 1;
        else
            b(k) = 0;
        end
    end
    
    % Create a copy of the image to store the modified pixels
    s = image;
    
    % Calculate the height and width of the image
    height = size(image,1);
    width = size(image,2);
    
    % Initialize a counter variable to keep track of the current bit in the
    % binary string
    k = 1;
    
    % Iterate over the image pixels
    for i = 1 : height
        for j = 2 : width
            % Calculate the LSB of the current pixel
            LSB = mod(double(image(i,j)), 2);
    
            % If all the bits in the binary string have been processed or if
            % the LSB of the current pixel is the same as the current bit in
            % the binary string, then leave the pixel unchanged
            if (k > message_length || LSB == b(k))
                s(i,j) = image(i,j);
    
            % If the LSB is 1, then decrease the pixel value by 1
            elseif(LSB == 1)
                s(i,j) = (image(i,j) - 1);
    
            % If the LSB is 0, then increase the pixel value by 1
            elseif(LSB == 0)
                s(i,j) = (image(i,j) + 1);
            end
    
            % Increment the counter variable
            k = k + 1;
        end
    end
    
    % Set the name of the output image file
    output_image_name = 'msgimage.png';
    
    % Write the modified image to the file
    imwrite(s, output_image_name)
end