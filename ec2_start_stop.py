import json
import boto3

ec2 = boto3.resource('ec2', region_name='us-east-1')

def lambda_handler(event, context):
    instances = ec2.instances.filter(Filters=[{'Name': 'tag:auto-start-stop','Values':['Yes']}])
    
    for instance in instances:
        instance_id = instance.id
        instance_state = instance.state['Name']
        
        if instance_state == 'stopped':
            ec2.instances.filter(InstanceIds=[instance_id]).start()
            return f"Instance {instance_id} is started."
        elif instance_state == 'running':
            ec2.instances.filter(InstanceIds=[instance_id]).stop()
            return f"Instance {instance_id} is stopped."
        else:
            return f"Instance ID {instance_id} is in an unexpected state: {instance_state}"
    
    return "No instances to process."