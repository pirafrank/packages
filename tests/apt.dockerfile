FROM debian:latest

RUN apt-get update && apt-get install -y curl gpg

RUN curl -fsSL https://pkg.fpira.com/apt/gpg.pub | gpg --dearmor -o /usr/share/keyrings/pkg.fpira.com.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/pkg.fpira.com.gpg] https://pkg.fpira.com/apt stable main" | tee /etc/apt/sources.list.d/pkg.fpira.com.list

RUN apt-get update

COPY ./assets/apt.sh /apt.sh
RUN chmod +x /apt.sh

CMD ["/bin/bash", "/apt.sh", "poof"]
