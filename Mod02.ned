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

network Mod02
{
    @display("bgb=925.248,456.304");
    submodules:
        CheckinQueue01: PassiveQueue {
            @display("p=127,75");
        }
        CheckinQueue02: PassiveQueue {
            @display("p=127,380");
        }
        CheckinRouter: Router {
            @display("p=127,219");
        }
        CheckinServer01: Server {
            @display("p=251,75");
        }
        CheckinServer02: Server {
            @display("p=251,153");
        }
        CheckinServer03: Server {
            @display("p=251,288");
        }
        CheckinServer04: Server {
            @display("p=251,380");
        }
        SecurityQueue01: PassiveQueue {
            @display("p=580.176,73.312");
        }
        SecurityQueue03: PassiveQueue {
            @display("p=580.176,379.2");
        }
        SecurityServer01: Server {
            @display("p=740.704,152.944");
        }
        SecurityServer02: Server {
            @display("p=740.704,286.928");
        }
        sink: Sink {
            @display("p=865.83997,218.672");
        }
        source: Source {
            @display("p=43,219");
        }
        SecurityQueue02: PassiveQueue {
            @display("p=580.176,218.672");
        }
        SecurityRouter01: Router {
            @display("p=403.216,152.944");
        }
        SecurityRouter02: Router {
            @display("p=403.216,286.928");
        }
    connections:
        SecurityServer01.out --> sink.in++;
        SecurityQueue01.out++ --> SecurityServer01.in++;
        SecurityServer02.out --> sink.in++;
        CheckinRouter.out++ --> CheckinQueue01.in++;
        CheckinRouter.out++ --> CheckinQueue02.in++;
        source.out --> CheckinRouter.in++;
        CheckinQueue02.out++ --> CheckinServer03.in++;
        CheckinQueue02.out++ --> CheckinServer04.in++;
        SecurityQueue03.out++ --> SecurityServer02.in++;
        CheckinQueue01.out++ --> CheckinServer01.in++;
        CheckinQueue01.out++ --> CheckinServer02.in++;
        CheckinServer01.out --> SecurityQueue01.in++;
        CheckinServer02.out --> SecurityRouter01.in++;
        SecurityRouter01.out++ --> SecurityQueue01.in++;
        SecurityRouter01.out++ --> SecurityQueue02.in++;
        CheckinServer03.out --> SecurityRouter02.in++;
        SecurityRouter02.out++ --> SecurityQueue02.in++;
        SecurityRouter02.out++ --> SecurityQueue03.in++;
        CheckinServer04.out --> SecurityQueue03.in++;
        SecurityQueue02.out++ --> SecurityServer01.in++;
        SecurityQueue02.out++ --> SecurityServer02.in++;
}
