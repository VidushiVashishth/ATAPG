[y, fs] = audioread('audio_test\test.wav'); %save wav files in folder names 'audio_test' in the same place as the .m files 
frameSize = 240;
overlap = 128;
frameMat = enframe(y, frameSize, overlap);
frameNum = size(frameMat, 2);
volume1 = zeros(frameNum,1);
for i = 1:frameNum
    frame = frameMat(:,i);
    %frame = frame-median(frame);
    volume1(i) = sum(abs(frame));
end

frameTime = ((0:frameNum-1)*(frameSize-overlap)+0.5*frameSize)/fs;
plot(frameTime, volume1, '.-');


