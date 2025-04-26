#import "@preview/physica:0.9.4": *
#import "@preview/cetz:0.3.0"
#set page(
  paper: "a4",
  header: align(left)[IDC402: Nonlinear dynamics,chaos and complex systems],
  numbering: "1",
)
#set par(justify: true)
#set text(font: "New Computer Modern", lang: "en", size: 10pt)
#set math.equation(numbering: "(1)",supplement: [Eq.])
= #align(center)[Broken detailed balance at mesoscopic scales in active biological systems]
#align(center)[Ramanuj Raman MS21271]

== Introduction
Systems in thermodynamic equilibrium are not only characterized by time-independent macroscopic properties, but also satisfy the principle of detailed balance in the
transitions between microscopic configurations. A thermodynamic equilibrium is characterized by the fact that all microscopic states are equally accessible, and the
probability of a transition between two states is equal to the probability of the reverse transition. \
In contrast, most of living systems are characterized by out of equilibrium scenario and characterized by directed fluxes through chemical states which breaks principle of detailed balance at molecular scale. For instance, metabolic and enzymatic processes drive closed-loop fluxes through the system's chemical states.\
Non-equilibrium driving of a system can boost intercellular transport, accuracy of transcription, chemotaxis and accuracy of sensory preception. So to understand the cell function it is important to understand whether the system is in equilibrium or not, which is not a simple task.\
In this paper, we'll explore the *probability flux analysis (PFA)* a non invasive method to understand and quantify this broken detailed balance in real, nosiy, mesoscopic sytem.
== Model 
To understand this approach we'll consider a model 1D bead string model. We'll consider two scenario where we have two beads are attached to heat bath with two beads attached to bath with temperature $T_1$ and $T_2$ such that $T_1 eq.not T_2$ generating a temperature gradient and hence driving it out of equilibrium. One can also analyse the same situation in equilibrium where $T_1 = T_2$.
#figure(image("bead_string_1d.png"),caption: [Bead string model])
The equation of motion of the above system in lagenvin dynamics system
$
  m dv(x_1,t,2) = - k_1 x_1 -k_2(x_1-x_2) - gamma m dv(x_1,t)+ eta_1(t)
$
$
  m dv(x_2,t,2) = - k_3 x_2 -k_2(x_2-x_1) - gamma m dv(x_2,t)+ eta_2(t)
$
Now in the overdamped limit we have
$
 gamma  dv(x_1,t) = - k_1/m x_1 -k_2/m (x_1-x_2)+ eta_1(t)
$<eq:overdamped_x1>
$
 gamma  dv(x_2,t) = - k_3 x_2 -k_2(x_2-x_1) + eta_2(t)
$<eq:overdamped_x2>
== Dynamics of beads with time
We can numerically solve @eq:overdamped_x1 and @eq:overdamped_x2 to get the dynamics of the system using Euler-Maruyama method
#set table(stroke: none)

#table(
  columns: (1fr, 1fr),
  [#figure(image("disp_x1.png",width:100%),caption: [Displacement of bead 1 with time])], [#figure(image("disp_x2.png",width:100%),caption: [Displacement of bead 2 with time])], 
  [#figure(image("hist_x1.png",width:100%),caption: [Histogram of position $(x_1)$])], [#figure(image("hist_x2.png",width:100%),caption: [Histogram of position $(x_2)$])], 
)
#figure(image("hist_cm.png",width:50%),caption: [Histogram of position $(x_(c m))$])
== Probability flux analysis
In equilibrium, systems obey detailed balance—transitions between any two microstates are equally likely in both directions, so there's no net "flow" or flux in phase space. Here is the method to calculate the probability flux in a system.\
+ *Define the system state space*\ Choose relevant degrees of freedom, in our case we'll consider the position ($x_1$) and ($x_2$) of the beads.
+ *Discretize the State Space*\ Divide the continuous phase space into a coarse-grained grid (called CGPS). Each grid box is a "state bin".
+ *Collect Transitions Between States*\ Track how often the system moves from state/bin $a arrow b$ and $b arrow a$ and denote these counts as $N_(a b)$ and $N_(b a)$.
+ *Compute Net Flux*\ Define the net probability flux between bins as:$
  omega_(a b) = (N_(a b) - N_(b a)) / t
$Flux arrows are plotted from bin $a arrow b$ with a length proportional to the net flux $omega_(a b)$.

== Results
#table(
  columns: (1fr, 1fr),
  [#figure(image("same_T.png",width: 100%),caption: [Simulation when $T_1 = T_2$ for $N=1000$ time steps])<fig:same_T>], [#figure(image("different_T.png",width: 100%),caption: [Simulation when $T_1 eq.not T_2$ for $N=1000$ time steps])<fig:diff_T>], 
)


Observing the above results from simulations of a 1D bead string system one can observe closed loop fluxes in @fig:diff_T but the simulations results aren't as good as shown in 
== Bibliography