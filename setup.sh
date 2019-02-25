mkdir ~/input
mkdir ~/input/ndsc-beginner
mkdir ~/input/quora-insincere-questions-classification
mkdir ~/working

pip3 install kaggle
# https://stackoverflow.com/questions/48370064/pip-install-kaggle-works-fine-but-kg-command-not-found
sudo ln -s ~/.local/bin/kaggle /usr/bin/kaggle

# please use your keys, I hope I have revoked these keys when you see it in public
# https://github.com/Kaggle/kaggle-api
# find your keys at https://www.kaggle.com/<your username>/account
export KAGGLE_USERNAME=huikang
export KAGGLE_KEY=78bdfbea6d36826c2d47743fe2ecc47b

# download and unzip kaggle datasets
kaggle competitions download -c ndsc-beginner -p input/ndsc-beginner
kaggle competitions download -c quora-insincere-questions-classification -p input/quora-insincere-questions-classification
cd ~/input/ndsc-beginner/ && unzip -o '*.zip'
cd ~/input/quora-insincere-questions-classification/ && unzip -o '*.zip'

# download the competition tar files, unzip and remove them
# beauty images (22GB), fashion images (35.2GB), and mobile images (10.4GB)

wget https://www.dropbox.com/s/bhy4b7bwsvvhtf6/beauty_image.tar.gz
tar -zxf beauty_image.tar.gz
rm beauty_image.tar.gz
mv fashion_image/ input/ndsc-beginner/

wget https://www.dropbox.com/s/3jpwfbeilm22vhs/fashion_image.tar.gz
tar -zxf fashion_image.tar.gz
rm fashion_image.tar.gz
mv beauty_image/ input/ndsc-beginner/

wget https://www.dropbox.com/s/ss2ibxu0k4x9c91/mobile_image.tar.gz
tar -zxf mobile_image.tar.gz
rm mobile_image.tar.gz
mv mobile_image/ input/ndsc-beginner/

pip3 install gensim pymagnitude
cd ~/input/quora-insincere-questions-classification
python3 -m pymagnitude.converter -i GoogleNews-vectors-negative300/GoogleNews-vectors-negative300.bin -o GoogleNews-vectors-negative300.magnitude
python3 -m pymagnitude.converter -i glove.840B.300d/glove.840B.300d.txt -o glove.840B.300d.magnitude
python3 -m pymagnitude.converter -i paragram_300_sl999/paragram_300_sl999.txt -o paragram_300_sl999.magnitude
python3 -m pymagnitude.converter -i wiki-news-300d-1M/wiki-news-300d-1M.vec -o wiki-news-300d-1M.magnitude


# allow all access to all files
chmod 777 -R *

# string matching library
pip3 install python-Levenshtein
pip3 install fuzzywuzzy[speedup]


