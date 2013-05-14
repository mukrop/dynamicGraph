% DynamicGraph, texts module
%
% This module groups all user texts used in DynamicGraph.
% 
% date: 2013-05-08
% responsible for exported functions:
%       Martin Ukrop (outputMessage/2, messages/2)
%
:- module( messsaging, [outputMessage/2, messages/2] ).

/* outputMessage( +Type, +ListOfLines )
write a message to user cli with appropriate prefix
@param +Type                type of message, determines the prefix (info, error, question)
@param +ListOfLines         message formated as a list of atoms
*/
outputMessage( Type, ListOfLines) :-
        telling( OldOutputStream ),
        told,
        tell( user ),
        messagePrefix( Type, Prefix ),
        output( ListOfLines, Prefix ),
        told,
        tell( OldOutputStream ).

/* output( +ListOfLines, +Prefix )
write message to currently open output stream with each line prefixed by Prefix
@param +ListOfLines         message formated as a list of atoms
@param +Prefix              atom, prefix for each message line
*/
output( [], _ ).
output( [Message|Rest], Prefix ) :-
        write( Prefix ),
        write( Message ),
        nl,
        output( Rest, Prefix ).

/* messagePrefix( +Type, -Prefix )
get a prefix for cli messages
@param +Type                type of prefix (info, error, question)
@param -Prefix              prefix as an atom
*/
messagePrefix( info, '# ' ).
messagePrefix( error, '! ' ).
messagePrefix( question, '? ' ).

/* messages( +MessageIdentifier, -Message )
get a user message
@param +MessageIdentifier   atom, uniquely identifies the message
@param -Message             message formated as a list of atoms
*/
messages( intro, % displayed at the start of dynamicGraph 
          ['=================== DynamicGraph ====================',
           '=========== time-dependent graph analyser ===========',
           'Authors: Andrej Krejcir, Martin Ukrop, Vladimir Still',
           '','Write \'help.\' to display help summary.']
        ).
messages( help, % user help summary
          ['=== List of commands',
           'All commands are prolog predicates and must end with a dot.',
           'Shorter command equivalents are written in parentheses.',
           '',
           '== Graph manipulating commands',
           'graphLoad/1           (gl/1)  load graph from specified file',
           'graphGenerate/1       (gg/1)  generate new graph (settings from file)',
           'graphGenerate/0       (gg/0)  generate new graph (interactive)',
           'graph/0               (g/0)   display info about currently loaded graph',
           '',
           '== Time commands',
           'timeBegin/1           (tb/1)  set beginning of time interval',
           'timeBegin/0           (tb/0)  set first edge occurence as beginning',
           'timeEnd/1             (te/1)  set end of time interval',
           'timeEnd/0             (te/0)  set last edge occurence as end',
           'timeInterval/2        (ti/2)  set beginning/end of time interval',
           'timeInterval/0        (ti/0)  set time from first to last edge occurence',
           'timeMoment/1          (tm/1)  set both beginning/end of time interval',
           'time/0                (t/0)   display currently set time',
           '',
           '== Graphviz output commands',
           'graphviz/1            (gv/1)  enable Graphviz outputs to specified folder',
           'graphvizOff/0         (gvo/0) disable Graphviz outputs',
           '',
           '== Graph statistics commands',
           'statsNodes/0          (sn/0)  display statistics for nodes',
           'statsEdges/0          (se/0)  display statistics for edges',
           'statsComponents/0     (sc/0)  display stats for components at the beginning',
           'statsProgress/0       (sp/0)  display times when graph is changing',
           'statsAnalyseNode/1    (san/1) analyse given node',
           'statsMaxComponent/0   (smc/0) find maximal component',
           '',
           '== Other',
           'help/0                (h/0)   display the list of commands',
           'quit/0                (q/0)   quit DynamicGraph session']
        ).
messages( outro, % displayed when exiting dynamicGraph 
          ['Exiting DynamicGraph.','Bye.']
        ).
messages( invalidCommand, % invalid command read from user
          ['These is no such command: ']
        ).
messages( notImplemented, % functions not yet implemented in dynamicGraph
          ['This function is not yet impleneted.','Stay tuned for updates :-}.']
        ).
messages( timeBeginChange, % beginning of the time interval was changed
          ['Time interval beginning set: ']
        ).
messages( timeEndChange, % end of the time interval was changed
          ['Time interval end set: ']
        ).
messages( timeInterval, % printing time interval
          ['Current time interval: '] 
        ).
messages( invalidTimestamp, % timestamp provided is invalid
          ['Invalid timestamp.']
        ).
messages( numberOfNodes, % used for printing node statistics
          ['Number of nodes in graph: ']
        ).
messages( nodeName, % used for printing node statistics
          ['Name: ']
        ).
messages( nodeDegree, % used for printing node statistics
          ['Degree: ']
        ).
messages( nodeMax, % used for printing node statistics
          ['Node with maximum degree is: ']
        ).
messages( nodeMin, % used for printing node statistics
          ['Node with minimum degree is: ']
        ).
messages( graphLoadSuccess, % graph was successfully loaded
          ['Successfully loaded: ']
        ).
messages( graphLoadError, % graph was not successfully loaded, no graph loaded
          ['Could not load graph.','No graph is loaded.']
        ).
messages( graphInfo,
          ['Graph loaded: ',' -> ',', from ',' to ']
        ).
messages( noGraph,
          ['No graph is loaded.','Load graph using \'graphLoad/1\' command.']
        ).
messages( dupliciteGraphName,
          ['Graph name is defined multiple times.','Old graph name: ','Colliding name: ']
        ).
messages( invalidGraphTerm,
          ['Invalid term in graph file: ']
        ).
messages( fileNotOpen,
          ['Could not open file ']
        ).
messages( nonAtomicGraphName,
          ['The graph name is not atomic.']
        ).