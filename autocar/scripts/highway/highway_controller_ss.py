#!/usr/bin/env python

# Planner for autonomous vehicle Intersection navigation

# Author:
# Min CHEN

# cs6244: Robot Motion Planning

import  os  
import  sys  
import  tty, termios  
import roslib; roslib.load_manifest('autocar')  
import rospy 
import pygame 
from pygame.locals import * 
from std_msgs.msg import String  
from autocar.msg import *
from geometry_msgs.msg import Twist
from nav_msgs.msg import *
from math import *
import tf
import numpy as np
import json


vxIdx, vyIdx = 0, 1 # simulation.npy 's indices


class SpeedController:
    def __init__(self):
        self.init()
        self.start_game = False

    def init(self):
        
        self.path2config = rospy.get_param('~path2config', None)
        self.hz = rospy.get_param('~hz', 10)
        self.rate = rospy.Rate(self.hz)

        self.itr = 0

        self.loadConfig()
        self.initPubs()


    def gameStarts(self, msg):
        if msg.state == 1 or msg.state == 2:
            self.start_game = True



    def initPubs(self):
        self.robot_pubs = {}

        # msgs contains the control messages (vx,vy) for all cars (incl. autoCar) per iteration
        self.numItrs ,self.numCars, self.dims = self.msgs.shape
        
        carIdx = 0

        for i in range(self.numCars):
            self.robot_pubs[carIdx] = rospy.Publisher('robot_' + str(carIdx) + '/cmd_vel', Twist, queue_size=1)
            carIdx += 1
    # def initPubs(self):
    #     self.robot_pubs = {}
    #     carIdx = 1
    #     for i in range(self.num_lanes):
    #         num_car_lane = self.num_cars_per_lane[i]
    #         for j in range(num_car_lane):
    #             self.robot_pubs[carIdx] = {}
    #             self.robot_pubs[carIdx]['laneid'] = i
    #             self.robot_pubs[carIdx]['pub'] = rospy.Publisher('robot_' + str(carIdx) + '/cmd_vel', Twist, queue_size=1)
    #             carIdx += 1


    def loadConfig(self):
        with open(self.path2config, 'r') as f:
            self.d = json.load(f)
       
        self.world_name = self.d['world_name'] # e.g. "dataTest"

        directory = self.path2config.split("/")[:-1] # python2 doesn't take kwargs... -_-''
        self.path2sim = directory + ["future_positions/{}_sim.npy".format(self.world_name)]
        self.path2sim = "/".join(self.path2sim)

        print(self.path2sim)

        self.msgs = np.load(self.path2sim)
        

    # def update_vel(self, i):
    #     mean_vel = self.mean_speed_per_lane[i]
    #     stdrr_vel = self.stdrr_speed_per_lane[i]
    #     return np.random.normal(mean_vel, stdrr_vel)


    def run(self):
        while not rospy.is_shutdown():
            # publish the speed for each robot
            if self.start_game and self.itr < self.numItrs:
                for i in self.robot_pubs:
                    velX = self.msgs[self.itr,i,vxIdx]
                    velY = self.msgs[self.itr,i,vyIdx]
                    self.send_control(self.robot_pubs[i], velX, velY)
            
            self.itr +=1

            self.rate.sleep()
            

    def send_control(self, robot_pub, velX, velY):
        msg = Twist()
        msg.linear.x = velX
        msg.linear.y = velY
        robot_pub.publish(msg)


if __name__=='__main__':
    rospy.init_node('agent_controller')

    controller = SpeedController()
    rospy.Subscriber('/robot_0/highway_game_start', RecordState, controller.gameStarts, queue_size=1)

    controller.run()
