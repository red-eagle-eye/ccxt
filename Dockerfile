#
# Build:
#    docker build -t enigmampc/catalyst-final .
#
# Run:
#    docker run -v /some/folder:/app -v ~/.catalyst:/root/.catalyst --name catalyst-final -it enigmampc/catalyst-final
#
# Exec:
#    docker exec -it catalyst-final catalyst run -f /projects/my_algo.py --start 2015-1-1 --end 2016-1-1 /projects/result.pickle

FROM enigmampc/catalyst-prod

ADD python /ccxt/python
ADD package.json /ccxt/package.json
RUN pip install -e /ccxt/python