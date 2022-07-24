function InfinityRecording()
q=2;
f1=2500;
%% Record your voice for q seconds.
counter=0
myRecording =[];
continueRecording=1;
while continueRecording==1
    recObj = audiorecorder;
    disp('Start speaking.')
    recordblocking(recObj, q);
    disp('End of Recording.');
    counter=counter+1
    % Store data in double-precision array.
    myRecording =[myRecording getaudiodata(recObj)];
    
    ask = input("Ready? Enter '0' to finish, 1 to continue: ")
    if ask==0
        continueRecording=0;
    end
end

    % Time axis
    qa=recObj.TotalSamples;
    t=(0:q/qa:q-q/qa)';

    save('audio.mat','myRecording','t','q','qa','f1')
    
end

