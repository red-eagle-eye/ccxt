#
# Build:
#    docker build -t redeagleeye/catalyst-final-0-5-18-custom:1.17.113.CUSTOM .
#
# Run:
#    docker run -v /some/folder:/app -v ~/.catalyst:/root/.catalyst --name catalyst-final -it enigmampc/catalyst-final
#
# Exec:
#    docker exec -it catalyst-final catalyst run -f /projects/my_algo.py --start 2015-1-1 --end 2016-1-1 /projects/result.pickle

FROM enigmampc/catalyst-prod:0.5.18.CUSTOM

ADD python /ccxt/python
ADD package.json /ccxt/package.json
RUN pip install -e /ccxt/python