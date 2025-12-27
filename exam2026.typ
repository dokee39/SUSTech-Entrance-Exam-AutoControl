#import "template.typ": *

#show: exam.with(year: 2026)

// 1
#part(
  [考虑具有如下动态方程的系统：],
  $ dot(x) &= mat(0, 1; 0, 1) x + vec(0, 1) u \
    y &= mat(1, 0) x
  $,
  sub(8, [判断系统的可控性和可观性，并给出理由。]),
  sub(7, [已知输入 $u(t)$ 为阶跃信号，初始状态 $x(0) = vec(0, 1)$，求输出 $y$。]),
)

// 2
#part(
  [请分别将以下微分方程描述的系统转换为状态空间模型，以 $u$ 为输入，以 $y$ 为输出：],
  sub(9, [$dot.double(y) + 3 dot(y) + y = u$]),
  sub(6, [$dot.triple(y) - 3 dot.double(y) + 3 dot(y) - y = 2 dot(u) + u$]),
)

// 3
#part(
  [考虑如下@sys[系统]，其中，$x_1$ 为二维向量，$x_2$ 为一维标量：],
  [ 
    #math.equation(
      block: true,
      numbering: "(1)",
      supplement: none,
      number-align: bottom,
      $ dot(x)_1 &= f(x_1) + g(x_1) x_2 \
        dot(x)_2 &= u
      $,
    ) <sys>
  ],

  sub(8, [
    如果 $f$ 和 $g$ 满足如下形式：\
    $ f(x_1) &= mat(0, 1; 0, 0) x_1 \
      g(x_1) &= vec(0, 1)
    $\
    请设计任意控制器 $u$ 使得闭环系统渐近稳定。
  ]),

  sub(7, [
    如果存在光滑函数 $phi.alt(x_1)$ 使得存在光滑函数 $V(x_1)$ 满足如下条件：\
    $ (partial V) / (partial x_1) ( f(x_1) + g(x_1) phi.alt(x_1) ) <= - norm(x_1)^2 $\
    并设计控制器$u = phi.alt(x_1) + (partial phi.alt) / (partial x_1) ( f(x_1) + g(x_1) x_2 ) - (partial V) / (partial x_1) g(x_1) - x_2$，
    令 Lyapunov 函数为$W(x_1, x_2) = V(x_1) + 1/2 ( x_2 - phi.alt(x_1) )^2$，请证明 $W$ 满足如下条件：\
    $ (dif W) / (dif t) <= - norm(x_1)^2 - abs(x_2 - phi.alt(x_1))^2 $
  ]),
)

// 4
#part(
  points: 15,
  [如果一个控制系统如@fig1 所示，确定系统参数 $K$ 和 $tau$，使整个闭环系统的阻尼率 $zeta = 0.75$，单位斜坡输入的稳态误差为 $e_"ss" = 0.25$。],
  [
    #figure[
      #ctrl-diagram(
        let In = (-4.5, 0),
        let Sum2 = (-3, 0),
        let Sum1 = (-1.5, 0),
        let G = (0, 0),
        let H = (0, 0.8),
        let Fb_h = 1.4,
        let B1 = (1.5, 0),
        let B2 = (3, 0),
        let Out = (4.5, 0),

        sum-node(Sum2, name: <Sum2>),
        sum-node(Sum1, name: <Sum1>),
        block-node(G, name: <G>)[$ K / (s(s + 2)) $],
        block-node(H, name: <H>)[$ tau s $],

        f.edge(In, <Sum2>, "-}>", label-pos: 0, label-side: left)[$R(s)$],
        f.edge(<Sum2>, <Sum1>, "-}>"),
        f.edge(<Sum1>, <G>, "-}>"),
        f.edge(<G>, Out, "-}>", label-pos: 1, label-side: left)[$C(s)$],

        let p1 = (B1, "|-", <H>),
        f.edge(B1, p1, <H>, "-}>"),
        let p2 = (<H>, "-|", <Sum1>),
        f.edge(<H>, p2, <Sum1>, "-}>"),

        let fb_ref = (0, Fb_h),
        let q1 = (B2, "|-", fb_ref),
        let q2 = (q1, "-|", <Sum2>),
        f.edge(B2, q1, q2, <Sum2>, "-}>"),

        sym-node("+", <Sum2>),
        sym-node("-", <Sum2>, anchor: "south"),
        sym-node("+", <Sum1>),
        sym-node("-", <Sum1>, anchor: "south"),
      )
    ] <fig1>
  ]
)

// 5
#part(
  points: 15,
  [确定@fig2 所示控制系统的传递函数 $(U_c (s)) / (U_r (s))$。],
  [
    #figure[
      #ctrl-diagram(
        let In = (0, 0),
        let Sum1 = (1.5, 0),
        let G1 = (3, 0),
        let Sum2 = (4, 0),
        let G2 = (5, 0),
        let B1 = (6, 0),
        let Sum3 = (7, 0),
        let G3 = (8, 0),
        let B2 = (9, 0),
        let G4 = (10, 0),
        let B3 = (11, 0),
        let Out = (12.5, 0),
        let Fb_h = 1,

        sum-node(Sum1, name: <Sum1>),
        sum-node(Sum2, name: <Sum2>),
        sum-node(Sum3, name: <Sum3>),
        block-node(G1, name: <G1>)[$ 1 / R_1 $],
        block-node(G2, name: <G2>)[$ 1 / (C_1 s) $],
        block-node(G3, name: <G3>)[$ 1 / R_2 $],
        block-node(G4, name: <G4>)[$ 1 / (C_2 s) $],

        f.edge(In, <Sum1>, "-}>", label-pos: 0, label-side: left)[$U_r (s)$],
        f.edge(<Sum1>, <G1>, "-}>"),
        f.edge(<G1>, <Sum2>, "-}>"),
        f.edge(<Sum2>, <G2>, "-}>"),
        f.edge(<G2>, B1, "-"),
        f.edge(B1, <Sum3>, "-}>"),
        f.edge(<Sum3>, <G3>, "-}>"),
        f.edge(<G3>, B2, "-"),
        f.edge(B2, <G4>, "-}>"),
        f.edge(<G4>, B3, "-"),
        f.edge(B3, Out, "-}>", label-pos: 1, label-side: left)[$U_c (s)$],

        let fb_d = (0, Fb_h),
        let a1 = (B1, "|-", fb_d),
        let b1 = (a1, "-|", <Sum1>),
        f.edge(B1, a1, b1, <Sum1>, "-}>"),

        let fb_u = (0, -Fb_h),
        let a2 = (B2, "|-", fb_u),
        let b2 = (a2, "-|", <Sum2>),
        f.edge(B2, a2, b2, <Sum2>, "-}>"),

        let a3 = (B3, "|-", fb_d),
        let b3 = (a3, "-|", <Sum3>),
        f.edge(B3, a3, b3, <Sum3>, "-}>"),

        sym-node("+", <Sum1>),
        sym-node("-", <Sum1>, anchor: "south"),
        sym-node("+", <Sum2>, other-side: true),
        sym-node("-", <Sum2>, anchor: "north"),
        sym-node("+", <Sum3>),
        sym-node("-", <Sum3>, anchor: "south"),
      )
    ] <fig2>
  ]
)

// 6
#part(
  points: 15,
  [一个单位反馈系统的闭环特征方程为 $s^2 (s + 10) + K (s + 1) = 0$，绘制该系统的根轨迹图。],
)

// 7
#part(
  points: 15,
  [假如一个闭环系统如@fig3 所示，确定增益 $K_1$ 和系数 $alpha$，使系统的两个闭环主导极点为 $s_(1, 2) = -3 plus.minus 3 "j"$。],
  [
    #figure[
      #ctrl-diagram(
        let In = (0, 0),
        let Sum2 = (1.5, 0),
        let G1 = (3, 0),
        let Sum1 = (4, 0),
        let G2 = (5, 0),
        let H = (5, 0.8),
        let Fb_h = 1.4,
        let B1 = (6, 0),
        let G3 = (7, 0),
        let B2 = (8, 0),
        let Out = (9.5, 0),

        sum-node(Sum2, name: <Sum2>),
        sum-node(Sum1, name: <Sum1>),
        block-node(G1, name: <G1>)[$ K_1 / (0.05 s + 1) $],
        block-node(G2, name: <G2>)[$ 1 / (s + 1) $],
        block-node(G3, name: <G3>)[$ 1 / s $],
        block-node(H, name: <H>)[$ alpha $],

        f.edge(In, <Sum2>, "-}>", label-pos: 0, label-side: left)[$R(s)$],
        f.edge(<Sum2>, <G1>, "-}>"),
        f.edge(<G1>, <Sum1>, "-}>"),
        f.edge(<Sum1>, <G2>, "-}>"),
        f.edge(<G2>, B1, "-"),
        f.edge(B1, <G3>, "-}>"),
        f.edge(<G3>, B2, "-"),
        f.edge(B2, Out, "-}>", label-pos: 1, label-side: left)[$Y(s)$],

        let p1 = (B1, "|-", <H>),
        f.edge(B1, p1, <H>, "-}>"),
        let p2 = (<H>, "-|", <Sum1>),
        f.edge(<H>, p2, <Sum1>, "-}>"),

        let fb_ref = (0, Fb_h),
        let q1 = (B2, "|-", fb_ref),
        let q2 = (q1, "-|", <Sum2>),
        f.edge(B2, q1, q2, <Sum2>, "-}>"),

        sym-node("+", <Sum2>),
        sym-node("-", <Sum2>, anchor: "south"),
        sym-node("+", <Sum1>),
        sym-node("-", <Sum1>, anchor: "south"),
      )
    ] <fig3>
  ]
)

// 8
#part(
  [考虑如下的线性定常系统：],
  $ dot(x) = A x + B u $,
  [其系统矩阵为：],
  $ A = mat(0, 1; -2, -3), B = vec(0, 1) $,
  [请回答以下问题：],
  sub(6, [设计状态反馈控制器 $u = - K x$，将闭环系统的极点配置在 $-2 plus.minus 2 "j"$。]),
  sub(9, [详细说明采用极点配置方法设计控制器的物理意义和主要步骤。]),
)

// 9
#part(
  [考虑一个二阶非线性系统，其动态特性由以下微分方程描述：],
  $ dot.double(x) + 0.5 dot(x) + 2 x + x^2 = 0 $,
  [令 $x_1 = x, x_2 = dot(x)$，可将系统转化为状态空间方程形式：],
  sub(4, [写出该系统的状态方程，并求出其所有的平衡点（奇点）。]),
  sub(4, [在每一个平衡点附近，对系统进行线性化，并写出线性化后的系统矩阵。]),
  sub(4, [判断每个平衡点的稳定性。]),
  sub(3, [定性地画出该系统的相轨迹图示意图。]),
)

// 10
#part(
  [已知某离散系统的闭环脉冲传递函数为：],
  $ phi.alt(z) = (z + 0.5) / (z^2 - 0.5 z + 0.2) $,
  [请回答以下问题：],
  sub(3, [写出该系统的闭环特征方程。]),
  sub(6, [判断该系统的稳定性。]),
  sub(6, [当输入为单位阶跃序列时，求系统的稳态输出值 $y(infinity)$。]),
)

