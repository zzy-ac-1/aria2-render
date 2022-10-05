FROM debian:stable-slim


# 付费版需要下载许可证，删除下方的#
#ADD key.bin /root/cloudreve/key.bin
ADD run.sh /root/aria2-sh/run.sh
ADD aria2.conf /root/aria2/aria2.conf
ADD trackers-list-aria2.sh /root/aria2/trackers-list-aria2.sh


RUN apt-get update \
    && apt-get install wget curl aria2 -y



RUN touch /root/aria2/aria2.session /root/aria2/aria2.log
RUN chmod +x /root/aria2/trackers-list-aria2.sh \
    && chmod +x /root/aria2-sh/run.sh
RUN mkdir -p /root/Download


CMD /root/aria2-sh/run.sh
