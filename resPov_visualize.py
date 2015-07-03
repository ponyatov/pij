import sys
from vtk import *

class vtkPointCloud:
    def __init__(self):
        cone = vtkConeSource()
        cone.Update()
        self.points = vtkPoints()
        self.actor = vtkActor()
        self.polydata = vtkPolyData()
        self.polydata.SetPoints(self.points)
        self.mapper = vtkPolyDataMapper()
        self.mapper.SetInputData(self.polydata)
        self.actor.SetMapper(self.mapper)
    def add(self,x,y,z,value):
        pass

cloud = vtkPointCloud()

F = open('resPot1mm.txt', 'r')
F.readlines(2)  # skip head
for line in F.readlines(4):
    X,Y,Z,P=map(float, line.split())
    cloud.add(X,Y,Z,P)
F.close()

# Visualize
render = vtkRenderer()
win = vtkRenderWindow()
win.AddRenderer(render)
win.SetSize(640, 480)

inter = vtkRenderWindowInteractor()
inter.SetRenderWindow(win)

render.AddActor(cloud.actor)

win.Render()
inter.Start()
