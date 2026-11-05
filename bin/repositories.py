#!/usr/bin/env python

from atlassian.bitbucket import Cloud

workspace = "soiree-tech"
email = "luke@soiree.tech"
token = "ATATT3xFfGF0LVKDFVHHH1cZt5nAEGtiohJb8DDYJ0IUkbiFhJouUjDLEMoEO7T0uOuRUUh2M1niO7SJ3JROmezEUxCQqqjbVdZlpQD1CXq0meYOu_UGfhjwK8rf7dNv0jX8ZcM1FhJX63Qp82cFNJ7niwPQshxaZ5sNMRBo2mKxQN1i-aXIRrw=41CA3C95"

cloud = Cloud(
    username=email,
    password=token,
)
w = cloud.workspaces.get(workspace)
rs = [r.name for r in  w.repositories.each()]
remotes = [f"git@ssh.bitbucket.org:{workspace}/{remote}.git" for remote in rs]

for remote in remotes:
    print(remote)
