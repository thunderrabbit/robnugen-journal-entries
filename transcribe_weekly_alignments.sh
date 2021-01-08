
# done once to set everything up:

# sudo apt install ffmpeg

# Youtube docs start here https://developers.google.com/youtube/v3/guides/uploading_a_video

# From here https://github.com/googleapis/google-api-python-client
#     echo this might not be needed   sudo apt install python3-pip
#     sudo apt install python3-virtualenv
#     virtualenv transcription                       # https://linuxconfig.org/ubuntu-20-04-python-version-switch-manager
#     source  transcription/bin/activate
#     transcription/bin/pip install google-api-python-client

# From here https://developers.google.com/youtube/registering_an_application
# Go here https://console.developers.google.com/apis/credentials
#     Create Credentials
#     Application type: Desktop app
#     Name: Transcription helper on Lemur 2021 Jan 08
#     The client ID and secret can always be accessed from Credentials in APIs & Services
#     
#     Client ID and Secret copied to ~/transcription/client_secrets.json


ffmpeg -r 1 -loop 1 -y -i Firefox_wallpaper.png -i 2j7waiffs.mp3 -acodec mp3 -r 1 -shortest final.flv


# python upload_video.py --file="final.flv"                       --title="Receive insight from your future self"                       --description="https://robnugen.com/weekly-alignments/"                       --keywords="meditation,weekly-alignments"                       --category="22"                       --privacyStatus="private"

### above did not work so now trying

# sudo apt install -y python3-venv

# python3 -m venv trancula

# still did not work so blah, kill it all


		       
