<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="thlabbe.20170215102624.2" a="E"><vh>@clean listeViewer.py</vh>
<v t="thlabbe.20170215102909.1"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
<v t="thlabbe.20170215102749.1"><vh>&lt;&lt; imports &gt;&gt;</vh></v>
<v t="thlabbe.20170215102851.1"><vh>&lt;&lt; declarations &gt;&gt;</vh></v>
<v t="thlabbe.20170215103330.1" a="E"><vh>class ListEditor</vh>
<v t="thlabbe.20170215103639.1"><vh>constructor</vh></v>
<v t="thlabbe.20170215164456.1"><vh>get_data_out</vh></v>
<v t="thlabbe.20170215123615.1" a="E"><vh>buttons</vh>
<v t="thlabbe.20170215111730.1"><vh>main_buttons</vh>
<v t="thlabbe.20170215163153.1"><vh>quit_btn</vh></v>
<v t="thlabbe.20170215163334.1"><vh>print_btn</vh></v>
</v>
<v t="thlabbe.20170215112108.1" a="E"><vh>action_buttons</vh>
<v t="thlabbe.20170215165004.1"><vh>moveUp</vh></v>
<v t="thlabbe.20170215165100.1"><vh>increment_grid_row</vh></v>
<v t="thlabbe.20170215165426.1"><vh>addSelected_button</vh></v>
<v t="thlabbe.20170215165100.1"></v>
<v t="thlabbe.20170215165719.1"><vh>addAll_button</vh></v>
<v t="thlabbe.20170215165100.1"></v>
<v t="thlabbe.20170215165741.1"><vh>removeAll_button</vh></v>
<v t="thlabbe.20170215165100.1"></v>
<v t="thlabbe.20170215165744.1"><vh>removeSelected_button</vh></v>
<v t="thlabbe.20170215165100.1"></v>
<v t="thlabbe.20170215170001.1"><vh>moveDown</vh></v>
</v>
</v>
<v t="thlabbe.20170215124506.1"><vh>status bar</vh></v>
<v t="thlabbe.20170215123647.1" a="E"><vh>lists</vh>
<v t="thlabbe.20170215113425.1"><vh>liste_A</vh></v>
<v t="thlabbe.20170215114625.1"><vh>liste_B</vh></v>
<v t="thlabbe.20170215115413.1"><vh>build scrollable listbox</vh></v>
</v>
<v t="thlabbe.20170215123732.1" a="E"><vh>commandes</vh>
<v t="thlabbe.20170215163422.1"><vh>doPrint</vh></v>
<v t="thlabbe.20170215171032.1"><vh>doMoveUp</vh></v>
<v t="thlabbe.20170215154405.1"><vh>moveSelected</vh></v>
<v t="thlabbe.20170215154531.1"><vh>moveAll</vh></v>
<v t="thlabbe.20170215104201.1"><vh>execute_buton_quit</vh></v>
<v t="thlabbe.20170215115947.1"><vh>execute_addSelected</vh></v>
<v t="thlabbe.20170215123747.1"><vh>execute_addAll</vh></v>
<v t="thlabbe.20170215123748.1"><vh>execute_removeSelected</vh></v>
<v t="thlabbe.20170215123845.1"><vh>execute_removeAll</vh></v>
<v t="thlabbe.20170215112530.1"><vh>execute_doNothing</vh></v>
<v t="thlabbe.20170215163915.1"><vh>execute Byebye</vh></v>
</v>
<v t="thlabbe.20170215104436.1"><vh>debug</vh></v>
</v>
<v t="thlabbe.20170215162848.1"><vh>combine_funcs</vh>
<v t="thlabbe.20170215163017.1"><vh>&lt;&lt; docstring &gt;&gt;</vh></v>
</v>
<v t="thlabbe.20170215103012.1"><vh>main</vh></v>
</v>
<v t="thlabbe.20170215105029.1"><vh>@edit config/logging.conf</vh></v>
</vnodes>
<tnodes>
<t tx="thlabbe.20170215102624.2">@language python
@tabwidth -4
@pagewidth 72
@beautify
@wrap

&lt;&lt; docstring &gt;&gt;
&lt;&lt; imports &gt;&gt;
&lt;&lt; declarations &gt;&gt;

@others
</t>
<t tx="thlabbe.20170215102749.1">from tkinter import *
import logging</t>
<t tx="thlabbe.20170215102851.1">logger = logging.getLogger(__name__)</t>
<t tx="thlabbe.20170215102909.1">"""
listeViewer
"""
</t>
<t tx="thlabbe.20170215103012.1">def main():
    data_in = []
    for i in range(0, 5):
        data_in.append(str.format('item {}', i))

    root = Tk()
    app = ListEditor(root, data_in)
    root.mainloop()

if __name__ == '__main__':
    import logging.config
    logging.config.fileConfig('config/logging.conf')
    main()
</t>
<t tx="thlabbe.20170215103330.1">class ListEditor():
    @others
</t>
<t tx="thlabbe.20170215103639.1">def __init__(self, root, data_in):
    self.data_in = data_in
    self.data_out = []

    self.build_main_buttons(root)
    frameH = Frame(root)
    self.liste_A_Frame(frameH, self.data_in)
    self.build_action_buttons(frameH)
    self.liste_B_Frame(frameH, self.data_out)
    frameH.grid(row=1)
    
    frameH2 = Frame(root)
    self.build_status_bar(frameH2)
    frameH2.grid(row=2)</t>
<t tx="thlabbe.20170215104201.1">def execute_buton_quit(self, root):
    root.destroy()
</t>
<t tx="thlabbe.20170215104436.1">def debug(self, data, name='//////////////////////////////'):
    print(str.format('{} :', name))
    for item in data:
        print(item)

def test(self):
    print(str.format('liste A : {} liste B : {}',self.lb_a.curselection(), self.lb_b.curselection()))
    
    </t>
<t tx="thlabbe.20170215105029.1">@language plain
[loggers]
keys=root

[handlers]
keys=hand01,hand02

[formatters]
keys=form01,form02

[logger_root]
level=NOTSET
handlers=hand01

; HANDLERS ######################################################
[handler_hand01]
class=StreamHandler
level=NOTSET
formatter=form02
args=(sys.stdout,)

[handler_hand02]
class=StreamHandler
level=NOTSET
formatter=form01
args=(sys.stdout,)

;  ######################################################
[formatter_form01]
format=F1 %(asctime)s %(levelname)s %(message)s
datefmt=
class=logging.Formatter

[formatter_form02]
format=F2 %(asctime)s %(levelname)s %(filename)s:%(lineno)d - %(message)s
datefmt=
class=logging.Formatter


</t>
<t tx="thlabbe.20170215111730.1">def build_main_buttons(self, root):
    frame = Frame(root)
    @others
    frame.grid(row=0, column=0)
    
</t>
<t tx="thlabbe.20170215112108.1">def build_action_buttons(self, root):
    frame = Frame(root)
    grid_row = 0
    @others
    frame.grid(row=1, column=1)
    
    </t>
<t tx="thlabbe.20170215112530.1">def doNothing(self, msg):
    print(str.format('***{}*** not implemented', msg))
</t>
<t tx="thlabbe.20170215113425.1">def liste_A_Frame(self, root, values):
    frame = Frame(root)
    self.lb_a = self.scrollable_listbox(frame, values)
    frame.grid(row=1, column=0)

</t>
<t tx="thlabbe.20170215114625.1">def liste_B_Frame(self, root, values):
    frame = Frame(root)
    self.lb_b = self.scrollable_listbox(frame, values)
    frame.grid(row=1, column=2)

</t>
<t tx="thlabbe.20170215115413.1">def scrollable_listbox(self, frame, values):
    '''
    build a scrollable listbox with given values into a given Frame
    '''
    choices = Variable(frame, values)
    scrollbar = Scrollbar(frame)
    lb = Listbox(frame, listvariable=choices, yscrollcommand=scrollbar.set, selectmode=EXTENDED)
    lb.grid(row=0, column=0)
    scrollbar.grid(row=0, column=1, sticky=N + S)
    scrollbar.config(command=lb.yview)
    return lb

</t>
<t tx="thlabbe.20170215115947.1">def doAddSelected(self):
    '''
    move from liste_A to liste_B the selected item(s)
    '''
    self.moveSelected(self.lb_a,self.lb_b)

    

    </t>
<t tx="thlabbe.20170215123615.1">
''' boutons '''</t>
<t tx="thlabbe.20170215123647.1">
''' listes '''</t>
<t tx="thlabbe.20170215123732.1">
''' commandes '''</t>
<t tx="thlabbe.20170215123747.1">def doAddAll(self):
    '''
    move from liste_B to liste_A the selected item
    '''
    self.moveAll(self.lb_a,self.lb_b)
</t>
<t tx="thlabbe.20170215123748.1">def doRemoveSelected(self):
    '''
    move from liste_B to liste_A the selected item(s)
    '''
    self.moveSelected(self.lb_b, self.lb_a)</t>
<t tx="thlabbe.20170215123845.1">def doRemoveAll(self):
    '''
    move all items from liste_B to liste_A
    '''
    self.moveAll(self.lb_b,self.lb_a)
</t>
<t tx="thlabbe.20170215124506.1">def build_status_bar(self,root):
    frame = Frame(root)
    self.status_info = Label(frame,text='ready')
    self.status_info.grid(row=0,column=0)
    frame.grid(row=0,column=0)

    </t>
<t tx="thlabbe.20170215154405.1">def moveSelected(self,from_list,to_list):
    for idx in reversed(from_list.curselection()):
        to_list.insert(END, from_list.get(idx))
        from_list.delete(idx)
        
        </t>
<t tx="thlabbe.20170215154531.1">def moveAll(self,from_list,to_list):
    for item in from_list.get(0,END):
        to_list.insert(END, item)
    from_list.delete(0,END)
        
        </t>
<t tx="thlabbe.20170215162848.1">def combine_funcs(*funcs):
    &lt;&lt; docstring &gt;&gt;    
    def combined_func(*args, **kwargs):
        for f in funcs:
            f(*args, **kwargs)
    return combined_func</t>
<t tx="thlabbe.20170215163017.1">'''
to bind multiple handlers in command=... 
'''
</t>
<t tx="thlabbe.20170215163153.1">
quit_button = Button(frame, text='Quit', command=combine_funcs(lambda: self.doByeBye(),lambda: self.execute_buton_quit(root)))
quit_button.grid(row=0, column=0)
</t>
<t tx="thlabbe.20170215163334.1">print_button = Button(frame, text='print', command=lambda: self.doPrint())
print_button.grid(row=0, column=1)</t>
<t tx="thlabbe.20170215163422.1">def doPrint(self):
    print('-----------------------')
    for item in self.lb_b.get(0,END):
        print(item)
    print('-----------------------')
    </t>
<t tx="thlabbe.20170215163915.1">def doByeBye(self):
    print('bye bye')</t>
<t tx="thlabbe.20170215164456.1">def getData_out(self):
    return self.lb_b.get(0,END)</t>
<t tx="thlabbe.20170215165004.1">moveUp = Button(frame,text='Up', command=combine_funcs(lambda:self.test(),lambda:self.doMoveUp(),lambda:self.doNothing('moveUp')))
moveUp.grid(row=grid_row,column=0)
</t>
<t tx="thlabbe.20170215165100.1">grid_row += 1</t>
<t tx="thlabbe.20170215165426.1">addSelected_button = Button(frame, text='&gt;', command=lambda: self.doAddSelected())
addSelected_button.grid(row=grid_row, column=0)
   </t>
<t tx="thlabbe.20170215165719.1">addAll_button = Button(frame, text='&gt;&gt;', command=lambda: self.doAddAll())
addAll_button.grid(row=grid_row, column=0)</t>
<t tx="thlabbe.20170215165741.1">removeAll_button = Button(frame, text='&lt;&lt;', command=lambda: self.doRemoveAll())
removeAll_button.grid(row=grid_row, column=0)
    
   </t>
<t tx="thlabbe.20170215165744.1">removeSelected_button = Button(frame, text='&lt;', command=lambda: self.doRemoveSelected())
removeSelected_button.grid(row=grid_row, column=0)
    
   </t>
<t tx="thlabbe.20170215170001.1">moveDown = Button(frame,text='Down', command=lambda:self.doNothing('moveDown'))
moveDown.grid(row=grid_row,column=0)
</t>
<t tx="thlabbe.20170215171032.1">def doMoveUp(self):
    selA = self.lb_a.curselection()
    selB = self.lb_b.curselection()
    if len(selA) == 0 and selB == 0:
        pass
    if len(selA) &gt; 0:
        self.moveUp(self.lb_a, selA)
    if len(selB) &gt; 0:
        self.moveUp(self.lb_b, selB)
    
def moveUp(self,listbox, selection):
    print(' moveUp not implemented ', listbox , selection)
    pass</t>
</tnodes>
</leo_file>
