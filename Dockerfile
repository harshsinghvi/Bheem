FROM golang:buster

RUN apt update
RUN apt install --no-install-recommends sudo python python3-pip git screen ruby -y


COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /root/Bheem
RUN mkdir ~/Tools; mkdir ~/Recon; mkdir ~/wordlist;
RUN cp ~/Bheem/arsenal ~/arsenal;
RUN go get -u github.com/m4ll0k/Aron; go get github.com/Ice3man543/SubOver;go get github.com/ffuf/ffuf;go get -u github.com/tomnomnom/assetfinder;go get github.com/tomnomnom/hacks/waybackurls;
RUN cp hacks ~/Tools/hacks


RUN cd nuclei/v2/cmd/nuclei/; go build; mv nuclei ~/go/bin/; cd ~;


COPY  . . 
RUN sh ./install.sh



EXPOSE 80 5000
CMD ["python" ,"./api.py"]
