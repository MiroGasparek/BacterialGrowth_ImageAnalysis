%% 22 May 2019 Miroslav Gasparek
% An inference of the growth curves from a bacterial growth movie
% The video is taken from the following paper:
% 
% ?Rosenfeld, N., Young, J. W., Alon, U., Swain, P. S., & Elowitz, M. B. (2005). 
% Gene regulation at the single-cell level. Science (New York, N.Y.), 307(5717), 1962?1965. 
% https://doi.org/10.1126/science.1106914
% 
% The preparation of the video

%% Convert video to the series of images

% Create a folder to store the image sequence
mkdir 'images'

% Create a VideoReader to use for reading frames from the file
bacteria_video = VideoReader('elowitz_2005_movieS1.mov');

% Create the image sequence:
% Loop through the video, read each frame into a width-by-height-by-3 array
% named 'img'. Write out each image to a JPEG file with a name in the form
% of imgN.jpg, where N is the frame number

ii = 1;

while hasFrame(bacteria_video)
    img = readFrame(bacteria_video);
    filename = [sprintf('%03d',ii) '.tif'];
    fullname = fullfile('images', filename);
    imwrite(img, fullname); % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
    ii = ii+1;
end

