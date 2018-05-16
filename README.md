# JinKeLa_word_filler
Translates a Pinyin sentence to the file names of JinKeLa voice source

# Usage
Download "jkley.zip" and unzip it to "UTAU\voice\jkley".

Open UTAU, click on the name above the piano keyboard, and select the "voice bank" to be "jkley".

Open MATLAB and change your current folder to this "jkley" (you can just open "jkl.m" and attempt to run it, Matlab will ask you if you want to change the folder). The MATLAB program needs to be used with this "jkley" voice.

Type "jkl" followed by the sentence in Pinyin. The sentence needs to be quoted with apostrophe, and there is a space between each word.

The output will be a series of names. You can copy it and paste into the "lyric" blank of UTAU, then select a few notes and click the buttom just on the right of the blank ("substitute lyrics").

# Speaker selection
The program accepts another optional parameter, which defines the preferred speaker (1=Fei, 2=Ri, 3=Mei).

Is the parameter is not given, the program will search for the speaker that spoke the most words in the sentence.

If a word is not spoken by the preferred speaker in the database, the program would randomly assign an available speaker for this word.

# Example
>> jkl 'xiao mai mu chan yi qian ba' 2

ans =

    'xiaorC mairC murC chanrC yirC qianrC barC'
    
# Thanks
UTAU

Maker(s) of "jklex" voice source
