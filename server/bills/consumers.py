import json
from random import randint
from time import sleep

from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer


class WSConsumer(WebsocketConsumer):
    def connect(self):
        self.accept()
        self.room_id = self.scope['url_route']['kwargs']['id']
        # self.room_name = 'bill-room'

        async_to_sync(self.channel_layer.group_add)(self.room_id, self.channel_name)
        print(self.channel_name + ' is connected ')
        # for i in range (1000):
            # self.send(json.dumps({'message': randint(1, 1000), 'self': json.dumps(self.__dict__)}))


            # async_to_sync(self.channel_layer.group_send)(
            # "chat",
            # {
            # 'message': randint(1, 1000),
            # 'channel_name': self.channel_name
            # },
            # )
            # sleep(1)

        # self.send(self.scope)
        # print(self.scope['user'])



    def disconnect(self, close_code):
        # pass

        async_to_sync(self.channel_layer.group_discard)(self.room_id, self.channel_name)
        print(self.channel_name + ' is diconnected ')

    def receive(self, text_data):
        parsed_data = text_data
        # text_data_json = json.loads(text_data)
        # message = text_data_json['message']
        print(parsed_data)
        

        async_to_sync(self.channel_layer.group_send)(
            self.room_id,
            { 
              "type": "chat_message",
              "data" : parsed_data 
            }
        )


        print(self.channel_name + ' says ' + parsed_data)
        # self.send(text_data=json.dumps())

    def chat_message(self, event):
        print(2)
        self.send(text_data=event["data"])
        
