function decipher_lsb(image_path)
    % Read the image at the specified path
    s = imread(image_path);
    
    % Calculate the height and width of the image
    height = size(s,1);
    width = size(s,2);
    
    % Calculate the number of bits in the message based on the value stored
    % in the first pixel of the image
    m = double(s(1:1:1)) * 8;
    
    % Initialize a counter variable to keep track of the current bit in the
    % binary string
    k = 1;
    % Iterate over the image pixels
    for i = 1 : height
        for j = 2 : width
            % If the current bit in the binary string has not been processed,
            % then calculate the LSB of the current pixel and store it in the
            % vector b
            if (k <= m)
                b(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end
    
    % Store the vector b in a variable named binaryVector
    binaryVector = b;
    
    % Create a vector of binary weights
    binValues = [ 128 64 32 16 8 4 2 1 ];
    
    % Reshape the binaryVector into a matrix with 8 columns
    binaryVector = binaryVector(:);

    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end
    binMatrix = reshape(binaryVector,8,[]);
    
    % Convert the binary matrix to a character string
    textString = char(binValues*binMatrix);
    
    % Display the recovered message
    disp(textString);
end