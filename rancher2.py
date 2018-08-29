import requests
import json
import argparse

parser = argparse.ArgumentParser(description='finds the volume ID for a persistent volume claim')
parser.add_argument('--project', required=True, help='name of the project')
parser.add_argument('--namespace', required=True, help='name of the namespace within project')
parser.add_argument('--claimspace', required=True, help='name of claim space within namespace')
parser.add_argument('--token', required=True, help='api token of rancher 2.0 user')
args = parser.parse_args()


token = args.token
project_name = args.project
project_id = ""
namespace = args.namespace
claim_space = args.claimspace
claim_space_id = namespace + ':' + claim_space
volume_id = ""

headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer {}".format(token)
}

response = requests.get("https://devkube.greathealthworks.com/v3/projects", headers=headers)
projects = json.loads(response.text)
for project in projects["data"]:
     if project_name == project["name"]:
        project_id = project["id"]

response = requests.get("https://devkube.greathealthworks.com/v3/projects/{}/persistentvolumeclaims".format(project_id),
                        headers=headers)
volumes = json.loads(response.text)["data"]
for volume in volumes:
    if claim_space_id == volume['id']:
        volume_id = volume["volumeId"]

print volume_id
