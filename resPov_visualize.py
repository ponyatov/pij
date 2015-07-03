import sys
from vtk import *

class vtkPointCloud:
    def __init__(self):
        cone = vtkConeSource()
        cone.Update()
        self.actor = vtkActor()
        self.polydata = vtkPolyData()
        self.mapper = vtkPolyDataMapper()
        self.mapper.SetInputData(cone.GetOutput())
        self.actor.SetMapper(self.mapper)

cloud = vtkPointCloud()

F = open('resPot1mm.txt', 'r')
F.readlines(2)  # skip head
for line in F.readlines(4):
    X, Y, Z, P = map(float, line.split())
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
