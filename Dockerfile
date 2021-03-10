FROM amazonlinux:2

ENV SSM_AGENT_URL https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

RUN yum install -y shadow-utils ${SSM_AGENT_URL}

RUN useradd -ms /bin/bash ssm-user

RUN yum remove -y shadow-utils

CMD ["amazon-ssm-agent", "start"]
