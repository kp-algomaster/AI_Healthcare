function classifyResult = challenge(recordName)
%
% Sample entry for the 2017 PhysioNet/CinC Challenge.
%
% INPUTS:
% recordName: string specifying the record name to process
%
% OUTPUTS:
% classifyResult: integer value where
%                     N = normal rhythm
%                     A = AF
%                     O = other rhythm
%                     ~ = noisy recording (poor signal quality)
%
% To run your entry on the entire training set in a format that is
% compatible with PhysioNet's scoring enviroment, run the script
% generateValidationSet.m
%
% The challenge function requires that you have downloaded the challenge
% data 'training_set' in a subdirectory of the current directory.
%    http://physionet.org/physiobank/database/challenge/2017/
%
% This dataset is used by the generateValidationSet.m script to create
% the annotations on your training set that will be used to verify that
% your entry works properly in the PhysioNet testing environment.
%
%
% Version 1.0
%
%
% Written by: Chengyu Liu and Qiao Li January 20 2017
%             chengyu.liu@emory.edu  qiao.li@emory.edu
%
% Last modified by:
%
%

classifyResult = 'N'; % default output normal rhythm

%% AF determination
[tm,ecg,fs,siginfo]=rdmat(recordName);
[QRS,sign,en_thres] = qrs_detect2(ecg',0.25,0.6,fs);
if length(QRS)<6
else
    RR=diff(QRS')/fs;
    AFEv = comput_AFEv(RR);
    if AFEv>1
        classifyResult = 'A';
    end
end

%% You can add the determination rules for other rhythm and noisy recordings here

