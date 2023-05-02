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

network Mod01
{
    @display("bgb=850,628");
    submodules:
        CheckinQueue01: PassiveQueue {
            @display("p=259,75");
        }
        CheckinQueue02: PassiveQueue {
            @display("p=259,153");
        }
        CheckinRouter: Router {
            @display("p=127,219");
        }
        CheckinServer01: Server {
            @display("p=433,75");
        }
        CheckinServer02: Server {
            @display("p=433,153");
        }
        CheckinServer03: Server {
            @display("p=433,288");
        }
        CheckinServer04: Server {
            @display("p=433,380");
        }
        SecurityQueue01: PassiveQueue {
            @display("p=577,153");
        }
        SecurityQueue02: PassiveQueue {
            @display("p=577,288");
        }
        SecurityServer01: Server {
            @display("p=709,153");
        }
        SecurityServer02: Server {
            @display("p=709,288");
        }
        sink: Sink {
            @display("p=817,219");
        }
        source: Source {
            @display("p=43,219");
        }
        CheckinQueue03: PassiveQueue {
            @display("p=259,288");
        }
        CheckinQueue04: PassiveQueue {
            @display("p=259,380");
        }
    connections:
        CheckinServer02.out --> SecurityQueue01.in++;
        SecurityServer01.out --> sink.in++;
        SecurityQueue02.out++ --> SecurityServer02.in++;
        source.out --> CheckinRouter.in++;
        CheckinServer01.out --> SecurityQueue01.in++;
        CheckinServer03.out --> SecurityQueue02.in++;
        SecurityServer02.out --> sink.in++;
        CheckinServer04.out --> SecurityQueue02.in++;
        CheckinQueue01.out++ --> CheckinServer01.in++;
        SecurityQueue01.out++ --> SecurityServer01.in++;
        CheckinRouter.out++ --> CheckinQueue01.in++;
        CheckinRouter.out++ --> CheckinQueue02.in++;
        CheckinRouter.out++ --> CheckinQueue03.in++;
        CheckinQueue03.out++ --> CheckinServer03.in++;
        CheckinRouter.out++ --> CheckinQueue04.in++;
        CheckinQueue04.out++ --> CheckinServer04.in++;
        CheckinQueue02.out++ --> CheckinServer02.in++;
}
