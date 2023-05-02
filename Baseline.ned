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


network Baseline
{
    @display("bgb=896,503");
    submodules:
        source: Source {
            @display("p=31,271");
        }
        CheckinQueue1: PassiveQueue {
            @display("p=315,39");
        }
        CheckinServer1: Server {
            @display("p=429,39");
        }
        CheckinServer2: Server {
            @display("p=429,117");
        }
        CheckinQueue5: PassiveQueue {
            @display("p=315,357");
        }
        CheckinServer5: Server {
            @display("p=429,357");
        }
        CheckinServer6: Server {
            @display("p=429,449");
        }
        SecurityQueue1: PassiveQueue {
            @display("p=565,159");
        }
        SecurityServer1: Server {
            @display("p=715,159");
        }
        SecurityServer2: Server {
            @display("p=715,271");
        }
        sink: Sink {
            @display("p=841,271");
        }
        CheckinRouter: Router {
            @display("p=120,271");
        }
        SecurityQueue2: PassiveQueue {
            @display("p=565,271");
        }
        CheckinServer3: Server {
            @display("p=429,198");
        }
        CheckinServer4: Server {
            @display("p=429,271");
        }
        SecurityQueue3: PassiveQueue {
            @display("p=565,396");
        }
        SecurityServer3: Server {
            @display("p=715,396");
        }
        CheckinQueue4: PassiveQueue {
            @display("p=315,271");
        }
        CheckinQueue3: PassiveQueue {
            @display("p=315,198");
        }
        CheckinQueue2: PassiveQueue {
            @display("p=315,117");
        }
        CheckinQueue6: PassiveQueue {
            @display("p=315,449");
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
        CheckinServer1.out --> SecurityQueue1.in++;
        CheckinServer2.out --> SecurityQueue1.in++;
        CheckinServer3.out --> SecurityQueue2.in++;
        CheckinServer4.out --> SecurityQueue2.in++;
        CheckinServer5.out --> SecurityQueue3.in++;
        CheckinServer6.out --> SecurityQueue3.in++;
}
