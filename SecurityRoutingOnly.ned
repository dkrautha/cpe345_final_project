//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network SecurityRoutingOnly
{
    @display("bgb=896,503");
    submodules:
        source: Source {
            @display("p=38.25,245.25");
        }
        CheckinQueue1: PassiveQueue {
            @display("p=246.375,39.375");
        }
        CheckinServer1: Server {
            @display("p=360,39.375");
        }
        CheckinServer2: Server {
            @display("p=360,118.125");
        }
        CheckinQueue5: PassiveQueue {
            @display("p=246.375,357.75");
        }
        CheckinServer5: Server {
            @display("p=360,357.75");
        }
        CheckinServer6: Server {
            @display("p=360,450");
        }
        SecurityQueue1: PassiveQueue {
            @display("p=585,133.875");
        }
        SecurityServer1: Server {
            @display("p=722.25,133.875");
        }
        SecurityServer2: Server {
            @display("p=722.25,245.25");
        }
        sink: Sink {
            @display("p=848.25,245.25");
        }
        CheckinRouter: Router {
            @display("p=127.125,245.25");
        }
        SecurityQueue2: PassiveQueue {
            @display("p=585,245.25");
        }
        CheckinServer3: Server {
            @display("p=360,199.125");
        }
        CheckinServer4: Server {
            @display("p=360,271.125");
        }
        SecurityQueue3: PassiveQueue {
            @display("p=585,371.25");
        }
        SecurityServer3: Server {
            @display("p=722.25,371.25");
        }
        CheckinQueue4: PassiveQueue {
            @display("p=246.375,271.125");
        }
        CheckinQueue3: PassiveQueue {
            @display("p=246.375,199.125");
        }
        CheckinQueue2: PassiveQueue {
            @display("p=246.375,118.125");
        }
        CheckinQueue6: PassiveQueue {
            @display("p=246.375,450");
        }
        SecurityRouter: Router {
            @display("p=472.5,245.25");
        }
    connections:
        source.out --> CheckinRouter.in++;
        CheckinRouter.out++ --> CheckinQueue5.in++;
        SecurityQueue1.out++ --> SecurityServer1.in++;
        SecurityServer1.out --> sink.in++;
        SecurityServer2.out --> sink.in++;
        SecurityQueue2.out++ --> SecurityServer2.in++;
        SecurityQueue3.out++ --> SecurityServer3.in++;
        SecurityServer3.out --> sink.in++;
        CheckinRouter.out++ --> CheckinQueue4.in++;
        CheckinRouter.out++ --> CheckinQueue3.in++;
        CheckinRouter.out++ --> CheckinQueue2.in++;
        CheckinRouter.out++ --> CheckinQueue1.in++;
        CheckinQueue1.out++ --> CheckinServer1.in++;
        CheckinQueue2.out++ --> CheckinServer2.in++;
        CheckinQueue3.out++ --> CheckinServer3.in++;
        CheckinQueue4.out++ --> CheckinServer4.in++;
        CheckinRouter.out++ --> CheckinQueue6.in++;
        CheckinQueue6.out++ --> CheckinServer6.in++;
        CheckinQueue5.out++ --> CheckinServer5.in++;
        SecurityRouter.out++ --> SecurityQueue1.in++;
        SecurityRouter.out++ --> SecurityQueue2.in++;
        SecurityRouter.out++ --> SecurityQueue3.in++;
        CheckinServer1.out --> SecurityRouter.in++;
        CheckinServer2.out --> SecurityRouter.in++;
        CheckinServer3.out --> SecurityRouter.in++;
        CheckinServer4.out --> SecurityRouter.in++;
        CheckinServer5.out --> SecurityRouter.in++;
        CheckinServer6.out --> SecurityRouter.in++;
}
