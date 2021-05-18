FROM amazonlinux:2

ENV SSM_AGENT_URL https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

RUN yum install -y shadow-utils procps-ng ${SSM_AGENT_URL} sudo

RUN useradd -ms /bin/bash ssm-user -s /bin/bash \
    && echo "ssm-user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ssm-agent-users

USER ssm-user
CMD ["amazon-ssm-agent", "start"]
