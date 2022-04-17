FROM --platform=arm64 linuxserver/calibre-web

RUN apt-get update && apt-get install -y wget curl nano calibre
RUN curl "https://raw.githubusercontent.com/shaunakg/alexandria-compose/main/calibre-patch.py" -o "/usr/lib/calibre/calibre/ebooks/pdf/html_writer.py"
RUN chmod +x /usr/lib/calibre/calibre/ebooks/pdf/html_writer.py