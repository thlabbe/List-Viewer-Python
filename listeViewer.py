
"""
listeViewer
"""
from tkinter import *
import logging
logger = logging.getLogger(__name__)

class ListEditor():
    def __init__(self, root, data_in):
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
        frameH2.grid(row=2)
    def getData_out(self):
        return self.lb_b.get(0,END)

    ''' boutons '''
    def build_main_buttons(self, root):
        frame = Frame(root)

        quit_button = Button(frame, text='Quit', command=combine_funcs(lambda: self.doByeBye(),lambda: self.execute_buton_quit(root)))
        quit_button.grid(row=0, column=0)
        print_button = Button(frame, text='print', command=lambda: self.doPrint())
        print_button.grid(row=0, column=1)
        frame.grid(row=0, column=0)
        
    def build_action_buttons(self, root):
        frame = Frame(root)
        grid_row = 0
        moveUp = Button(frame,text='Up', command=combine_funcs(lambda:self.test(),lambda:self.doMoveUp(),lambda:self.doNothing('moveUp')))
        moveUp.grid(row=grid_row,column=0)
        grid_row += 1
        addSelected_button = Button(frame, text='>', command=lambda: self.doAddSelected())
        addSelected_button.grid(row=grid_row, column=0)
           
        grid_row += 1
        addAll_button = Button(frame, text='>>', command=lambda: self.doAddAll())
        addAll_button.grid(row=grid_row, column=0)
        grid_row += 1
        removeAll_button = Button(frame, text='<<', command=lambda: self.doRemoveAll())
        removeAll_button.grid(row=grid_row, column=0)
            
           
        grid_row += 1
        removeSelected_button = Button(frame, text='<', command=lambda: self.doRemoveSelected())
        removeSelected_button.grid(row=grid_row, column=0)
            
           
        grid_row += 1
        moveDown = Button(frame,text='Down', command=lambda:self.doNothing('moveDown'))
        moveDown.grid(row=grid_row,column=0)
        frame.grid(row=1, column=1)
        
        
    def build_status_bar(self,root):
        frame = Frame(root)
        self.status_info = Label(frame,text='ready')
        self.status_info.grid(row=0,column=0)
        frame.grid(row=0,column=0)

        

    ''' listes '''
    def liste_A_Frame(self, root, values):
        frame = Frame(root)
        self.lb_a = self.scrollable_listbox(frame, values)
        frame.grid(row=1, column=0)

    def liste_B_Frame(self, root, values):
        frame = Frame(root)
        self.lb_b = self.scrollable_listbox(frame, values)
        frame.grid(row=1, column=2)

    def scrollable_listbox(self, frame, values):
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


    ''' commandes '''
    def doPrint(self):
        print('-----------------------')
        for item in self.lb_b.get(0,END):
            print(item)
        print('-----------------------')
        
    def doMoveUp(self):
        selA = self.lb_a.curselection()
        selB = self.lb_b.curselection()
        if len(selA) == 0 and selB == 0:
            pass
        if len(selA) > 0:
            self.moveUp(self.lb_a, selA)
        if len(selB) > 0:
            self.moveUp(self.lb_b, selB)
        
    def moveUp(self,listbox, selection):
        print(' moveUp not implemented ', listbox , selection)
        pass
    def moveSelected(self,from_list,to_list):
        for idx in reversed(from_list.curselection()):
            to_list.insert(END, from_list.get(idx))
            from_list.delete(idx)
            
            
    def moveAll(self,from_list,to_list):
        for item in from_list.get(0,END):
            to_list.insert(END, item)
        from_list.delete(0,END)
            
            
    def execute_buton_quit(self, root):
        root.destroy()
    def doAddSelected(self):
        '''
        move from liste_A to liste_B the selected item(s)
        '''
        self.moveSelected(self.lb_a,self.lb_b)

        

        
    def doAddAll(self):
        '''
        move from liste_B to liste_A the selected item
        '''
        self.moveAll(self.lb_a,self.lb_b)
    def doRemoveSelected(self):
        '''
        move from liste_B to liste_A the selected item(s)
        '''
        self.moveSelected(self.lb_b, self.lb_a)
    def doRemoveAll(self):
        '''
        move all items from liste_B to liste_A
        '''
        self.moveAll(self.lb_b,self.lb_a)
    def doNothing(self, msg):
        print(str.format('***{}*** not implemented', msg))
    def doByeBye(self):
        print('bye bye')
    def debug(self, data, name='//////////////////////////////'):
        print(str.format('{} :', name))
        for item in data:
            print(item)

    def test(self):
        print(str.format('liste A : {} liste B : {}',self.lb_a.curselection(), self.lb_b.curselection()))
        
        
def combine_funcs(*funcs):
    '''
    to bind multiple handlers in command=... 
    '''
    def combined_func(*args, **kwargs):
        for f in funcs:
            f(*args, **kwargs)
    return combined_func
def main():
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
