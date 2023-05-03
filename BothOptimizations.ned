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

network BothOptimizations
{
    @display("bgb=868,504");
    submodules:
        SecurityQueue1: PassiveQueue {
            @display("p=557,144");
        }
        SecurityQueue2: PassiveQueue {
            @display("p=557,256");
        }
        SecurityQueue3: PassiveQueue {
            @display("p=557,382");
        }
        SecurityServer1: Server {
            @display("p=694,144");
        }
        SecurityServer2: Server {
            @display("p=694,256");
        }
        SecurityServer3: Server {
            @display("p=694,382");
        }
        sink: Sink {
            @display("p=820,256");
        }
        CheckinQueue1: PassiveQueue {
            @display("p=213.75,117");
        }
        CheckinQueue2: PassiveQueue {
            @display("p=213.75,356.625");
        }
        CheckinRouter: Router {
            @display("p=120,271");
        }
        CheckinServer1: Server {
            @display("p=318,41");
        }
        CheckinServer2: Server {
            @display("p=318,119");
        }
        CheckinServer3: Server {
            @display("p=318,200");
        }
        CheckinServer4: Server {
            @display("p=318,273");
        }
        CheckinServer5: Server {
            @display("p=318,359");
        }
        CheckinServer6: Server {
            @display("p=318,451");
        }
        source: Source {
            @display("p=31,271");
        }
        SecurityRouter: Router {
            @display("p=447.99002,255.06");
        }
    connections:
        SecurityQueue1.out++ --> SecurityServer1.in++;
        SecurityServer1.out --> sink.in++;
        SecurityQueue3.out++ --> SecurityServer3.in++;
        SecurityQueue2.out++ --> SecurityServer2.in++;
        SecurityServer2.out --> sink.in++;
        SecurityServer3.out --> sink.in++;
        CheckinQueue2.out++ --> CheckinServer4.in++;
        CheckinQueue2.out++ --> CheckinServer5.in++;
        CheckinQueue2.out++ --> CheckinServer6.in++;
        CheckinRouter.out++ --> CheckinQueue2.in++;
        CheckinRouter.out++ --> CheckinQueue1.in++;
        CheckinQueue1.out++ --> CheckinServer1.in++;
        CheckinQueue1.out++ --> CheckinServer2.in++;
        CheckinQueue1.out++ --> CheckinServer3.in++;
        source.out --> CheckinRouter.in++;
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
