Sample entry (sample2017.zip) for the PhysioNet/CinC Challenge 2017

This File: README.txt - this file is part of the sample entry for the PhysioNet/CinC Challenge 2017.
Last Modified: 1/31/2017
URL: https://www.physionet.org/challenge/2017/

To participate in the PhysioNet/CinC Challenge 2017 challenge, you will need to create software that is able to read the test data and output the final classification result without user interaction in our test environment. This package (sample2017.zip) provides one sample entry (written in MATLAB) to help you get started with the Challenge (https://www.physionet.org/challenge/2017/). 

What's in the package?
======================
The sample2017.zip contains the following components:

* README.txt - this file

* "validation" subdirectory:  containing
   -- 300 training records (*.hea, *.mat) 
   -- REFERENCE.csv  - reference annotations
   -- RECORDS        - list of record names in the validation directory

* MATLAB sample entry code
   -- generateValidationSet.m - main program to call to run the sample entry  
   -- challenge.m             - classify a record into one of the rhythm types (normal, AF, other, noise)
   -- score2017Challenge.m    - score your algorithm for classification accuracy
   -- BPcount.m, comp_dRR.m, comput_AFEv.m, metrics.m, qrs_detect2.m, rdmat.m - utility functions

* BASH scripts:
   -- setup.sh - a bash script runs once before any other code from the entry; use this to compile your code as needed.
   -- next.sh  - a bash script runs once per training or test record; it should analyze the record using your code, saving the results as a text file for each record.
   -- prepare-entry.sh - an example bash script that calls "next.sh" for each record in the "validation" subdirectory to generate "answers.txt"
    
* Other files:
   -- answers.txt - a text file containing the results of running your program on each record in the validation set (part of training set, see below for details). These results are used for validation only, not for ranking entries.
   -- AUTHORS.txt - a plain text file listing the members of your team who contributed to your code, and their affiliations.
   -- LICENSE.txt - a text file containing the license for your software (the default is the GPL). All entries are assumed to be open source and will eventually be released on PhysioNet (for closed source entries please see below).
   -- dependencies.txt - This file lists additional Debian packages that must be installed prior to running your entry's 'setup.sh' and 'next.sh' scripts.


How to run this sample entry?
==============================

To test the sample entry, run the script "generateValidationSet.m" in MATLAB.  The script will run the sample algorithm on all records in the "validation" subdirectory, generate "answers.txt", compare "answers.txt" with the reference annotations as provided in the "REFERENCE.csv" file in the "validation"subdirectory, and generate the F1-measure scores. It will also package  your entry (excluding any subdirectories) to generate "entry.zip".  Note that in order to run this script, you should have downloaded and extracted
the validation set into the directory containing the MATLAB script. Running "generateValidationSet.m" over the 300 records in the validation subdirectory should yield the following scores:


Running score2017Challenge.m to get scores on your entry on the validation data in training set....
F1 measure for Normal rhythm:  0.7500
F1 measure for AF rhythm:  0.5698
F1 measure for Other rhythm:  0.0000
F1 measure for Noisy recordings:  0.0000
Final F1 measure:  0.3299
Scoring complete.


How to prepare your entry?
=========================

In addition to MATLAB, you may use any programming language (or combination of languages) supported using open source compilers or interpreters on GNU/Linux, including C, C++, Fortran, Haskell, Java, Octave, Perl, Python, and R. Your entry should have the exact layout of the sample entry contained in this sample2017.zip package; specifically, they must contain:

  -- setup.sh, a bash script runs once before any other code from the entry; use this to compile your code as needed.
  -- next.sh, a bash script runs once per training or test record; it should analyze the record using your code, saving the results as a text file for each record.
  -- answers.txt, a text file containing the results of running your program on each record in the validation set (part of training set, see below for details). These results are used for validation only, not for ranking entries.
  -- AUTHORS.txt, a plain text file listing the members of your team who contributed to your code, and their affiliations.
  -- LICENSE.txt, a text file containing the license for your software (the default is the GPL). All entries are assumed to be open source and will eventually be released on PhysioNet (for closed source entries please see below).
  -- dependencies.txt - This file lists additional Debian packages that must be installed prior to running your entry's 'setup.sh' and 'next.sh' scripts.

We verify that your code is working as you intended, by running it on a small subset (validation set, 300 recordings included in sample2017.zip) of the training set, then comparing the answers.txt file that you submit with your entry with answers produced by your code running in our test environment using the same records. 

We will run your code by first calling the "setup.sh" script to compile the program, and then the "next.sh" script on each record to generate "answers.txt". See "prepare-entry.sh" to see an example script that implements these steps.  Also see the comments in the sample entry’s "setup.sh" and "next.sh" to learn how to customize these scripts for your entry.  Using a small portion of the training set means you will know whether your code passed or failed to run within a small time. If your code passes this validation test, it is then evaluated and scored using the hidden test set. The score in the hidden test set determines the ranking of the entries and the final outcome of the Challenge. 

Please see https://www.physionet.org/challenge/2017/ for the full details.

