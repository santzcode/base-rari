function H4(l, s) {
  for (var a = 0; a < s.length; a++) {
    const c = s[a];
    if (typeof c != "string" && !Array.isArray(c)) {
      for (const d in c)
        if (d !== "default" && !(d in l)) {
          const m = Object.getOwnPropertyDescriptor(c, d);
          m &&
            Object.defineProperty(
              l,
              d,
              m.get ? m : { enumerable: !0, get: () => c[d] }
            );
        }
    }
  }
  return Object.freeze(
    Object.defineProperty(l, Symbol.toStringTag, { value: "Module" })
  );
}
(function () {
  const s = document.createElement("link").relList;
  if (s && s.supports && s.supports("modulepreload")) return;
  for (const d of document.querySelectorAll('link[rel="modulepreload"]')) c(d);
  new MutationObserver((d) => {
    for (const m of d)
      if (m.type === "childList")
        for (const h of m.addedNodes)
          h.tagName === "LINK" && h.rel === "modulepreload" && c(h);
  }).observe(document, { childList: !0, subtree: !0 });
  function a(d) {
    const m = {};
    return (
      d.integrity && (m.integrity = d.integrity),
      d.referrerPolicy && (m.referrerPolicy = d.referrerPolicy),
      d.crossOrigin === "use-credentials"
        ? (m.credentials = "include")
        : d.crossOrigin === "anonymous"
        ? (m.credentials = "omit")
        : (m.credentials = "same-origin"),
      m
    );
  }
  function c(d) {
    if (d.ep) return;
    d.ep = !0;
    const m = a(d);
    fetch(d.href, m);
  }
})();
function El(l) {
  return l && l.__esModule && Object.prototype.hasOwnProperty.call(l, "default")
    ? l.default
    : l;
}
var Li = { exports: {} },
  Yr = {},
  Si = { exports: {} },
  le = {};
var e0;
function Z4() {
  if (e0) return le;
  e0 = 1;
  var l = Symbol.for("react.element"),
    s = Symbol.for("react.portal"),
    a = Symbol.for("react.fragment"),
    c = Symbol.for("react.strict_mode"),
    d = Symbol.for("react.profiler"),
    m = Symbol.for("react.provider"),
    h = Symbol.for("react.context"),
    p = Symbol.for("react.forward_ref"),
    y = Symbol.for("react.suspense"),
    w = Symbol.for("react.memo"),
    E = Symbol.for("react.lazy"),
    g = Symbol.iterator;
  function b(L) {
    return L === null || typeof L != "object"
      ? null
      : ((L = (g && L[g]) || L["@@iterator"]),
        typeof L == "function" ? L : null);
  }
  var R = {
      isMounted: function () {
        return !1;
      },
      enqueueForceUpdate: function () {},
      enqueueReplaceState: function () {},
      enqueueSetState: function () {},
    },
    P = Object.assign,
    S = {};
  function _(L, T, ne) {
    (this.props = L),
      (this.context = T),
      (this.refs = S),
      (this.updater = ne || R);
  }
  (_.prototype.isReactComponent = {}),
    (_.prototype.setState = function (L, T) {
      if (typeof L != "object" && typeof L != "function" && L != null)
        throw Error(
          "setState(...): takes an object of state variables to update or a function which returns an object of state variables."
        );
      this.updater.enqueueSetState(this, L, T, "setState");
    }),
    (_.prototype.forceUpdate = function (L) {
      this.updater.enqueueForceUpdate(this, L, "forceUpdate");
    });
  function M() {}
  M.prototype = _.prototype;
  function H(L, T, ne) {
    (this.props = L),
      (this.context = T),
      (this.refs = S),
      (this.updater = ne || R);
  }
  var V = (H.prototype = new M());
  (V.constructor = H), P(V, _.prototype), (V.isPureReactComponent = !0);
  var F = Array.isArray,
    ee = Object.prototype.hasOwnProperty,
    re = { current: null },
    Y = { key: !0, ref: !0, __self: !0, __source: !0 };
  function fe(L, T, ne) {
    var se,
      ae = {},
      ue = null,
      he = null;
    if (T != null)
      for (se in (T.ref !== void 0 && (he = T.ref),
      T.key !== void 0 && (ue = "" + T.key),
      T))
        ee.call(T, se) && !Y.hasOwnProperty(se) && (ae[se] = T[se]);
    var me = arguments.length - 2;
    if (me === 1) ae.children = ne;
    else if (1 < me) {
      for (var we = Array(me), it = 0; it < me; it++)
        we[it] = arguments[it + 2];
      ae.children = we;
    }
    if (L && L.defaultProps)
      for (se in ((me = L.defaultProps), me))
        ae[se] === void 0 && (ae[se] = me[se]);
    return {
      $$typeof: l,
      type: L,
      key: ue,
      ref: he,
      props: ae,
      _owner: re.current,
    };
  }
  function Ie(L, T) {
    return {
      $$typeof: l,
      type: L.type,
      key: T,
      ref: L.ref,
      props: L.props,
      _owner: L._owner,
    };
  }
  function be(L) {
    return typeof L == "object" && L !== null && L.$$typeof === l;
  }
  function xe(L) {
    var T = { "=": "=0", ":": "=2" };
    return (
      "$" +
      L.replace(/[=:]/g, function (ne) {
        return T[ne];
      })
    );
  }
  var _e = /\/+/g;
  function Se(L, T) {
    return typeof L == "object" && L !== null && L.key != null
      ? xe("" + L.key)
      : T.toString(36);
  }
  function Ue(L, T, ne, se, ae) {
    var ue = typeof L;
    (ue === "undefined" || ue === "boolean") && (L = null);
    var he = !1;
    if (L === null) he = !0;
    else
      switch (ue) {
        case "string":
        case "number":
          he = !0;
          break;
        case "object":
          switch (L.$$typeof) {
            case l:
            case s:
              he = !0;
          }
      }
    if (he)
      return (
        (he = L),
        (ae = ae(he)),
        (L = se === "" ? "." + Se(he, 0) : se),
        F(ae)
          ? ((ne = ""),
            L != null && (ne = L.replace(_e, "$&/") + "/"),
            Ue(ae, T, ne, "", function (it) {
              return it;
            }))
          : ae != null &&
            (be(ae) &&
              (ae = Ie(
                ae,
                ne +
                  (!ae.key || (he && he.key === ae.key)
                    ? ""
                    : ("" + ae.key).replace(_e, "$&/") + "/") +
                  L
              )),
            T.push(ae)),
        1
      );
    if (((he = 0), (se = se === "" ? "." : se + ":"), F(L)))
      for (var me = 0; me < L.length; me++) {
        ue = L[me];
        var we = se + Se(ue, me);
        he += Ue(ue, T, ne, we, ae);
      }
    else if (((we = b(L)), typeof we == "function"))
      for (L = we.call(L), me = 0; !(ue = L.next()).done; )
        (ue = ue.value),
          (we = se + Se(ue, me++)),
          (he += Ue(ue, T, ne, we, ae));
    else if (ue === "object")
      throw (
        ((T = String(L)),
        Error(
          "Objects are not valid as a React child (found: " +
            (T === "[object Object]"
              ? "object with keys {" + Object.keys(L).join(", ") + "}"
              : T) +
            "). If you meant to render a collection of children, use an array instead."
        ))
      );
    return he;
  }
  function He(L, T, ne) {
    if (L == null) return L;
    var se = [],
      ae = 0;
    return (
      Ue(L, se, "", "", function (ue) {
        return T.call(ne, ue, ae++);
      }),
      se
    );
  }
  function je(L) {
    if (L._status === -1) {
      var T = L._result;
      (T = T()),
        T.then(
          function (ne) {
            (L._status === 0 || L._status === -1) &&
              ((L._status = 1), (L._result = ne));
          },
          function (ne) {
            (L._status === 0 || L._status === -1) &&
              ((L._status = 2), (L._result = ne));
          }
        ),
        L._status === -1 && ((L._status = 0), (L._result = T));
    }
    if (L._status === 1) return L._result.default;
    throw L._result;
  }
  var Q = { current: null },
    z = { transition: null },
    X = {
      ReactCurrentDispatcher: Q,
      ReactCurrentBatchConfig: z,
      ReactCurrentOwner: re,
    };
  function W() {
    throw Error("act(...) is not supported in production builds of React.");
  }
  return (
    (le.Children = {
      map: He,
      forEach: function (L, T, ne) {
        He(
          L,
          function () {
            T.apply(this, arguments);
          },
          ne
        );
      },
      count: function (L) {
        var T = 0;
        return (
          He(L, function () {
            T++;
          }),
          T
        );
      },
      toArray: function (L) {
        return (
          He(L, function (T) {
            return T;
          }) || []
        );
      },
      only: function (L) {
        if (!be(L))
          throw Error(
            "React.Children.only expected to receive a single React element child."
          );
        return L;
      },
    }),
    (le.Component = _),
    (le.Fragment = a),
    (le.Profiler = d),
    (le.PureComponent = H),
    (le.StrictMode = c),
    (le.Suspense = y),
    (le.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = X),
    (le.act = W),
    (le.cloneElement = function (L, T, ne) {
      if (L == null)
        throw Error(
          "React.cloneElement(...): The argument must be a React element, but you passed " +
            L +
            "."
        );
      var se = P({}, L.props),
        ae = L.key,
        ue = L.ref,
        he = L._owner;
      if (T != null) {
        if (
          (T.ref !== void 0 && ((ue = T.ref), (he = re.current)),
          T.key !== void 0 && (ae = "" + T.key),
          L.type && L.type.defaultProps)
        )
          var me = L.type.defaultProps;
        for (we in T)
          ee.call(T, we) &&
            !Y.hasOwnProperty(we) &&
            (se[we] = T[we] === void 0 && me !== void 0 ? me[we] : T[we]);
      }
      var we = arguments.length - 2;
      if (we === 1) se.children = ne;
      else if (1 < we) {
        me = Array(we);
        for (var it = 0; it < we; it++) me[it] = arguments[it + 2];
        se.children = me;
      }
      return {
        $$typeof: l,
        type: L.type,
        key: ae,
        ref: ue,
        props: se,
        _owner: he,
      };
    }),
    (le.createContext = function (L) {
      return (
        (L = {
          $$typeof: h,
          _currentValue: L,
          _currentValue2: L,
          _threadCount: 0,
          Provider: null,
          Consumer: null,
          _defaultValue: null,
          _globalName: null,
        }),
        (L.Provider = { $$typeof: m, _context: L }),
        (L.Consumer = L)
      );
    }),
    (le.createElement = fe),
    (le.createFactory = function (L) {
      var T = fe.bind(null, L);
      return (T.type = L), T;
    }),
    (le.createRef = function () {
      return { current: null };
    }),
    (le.forwardRef = function (L) {
      return { $$typeof: p, render: L };
    }),
    (le.isValidElement = be),
    (le.lazy = function (L) {
      return { $$typeof: E, _payload: { _status: -1, _result: L }, _init: je };
    }),
    (le.memo = function (L, T) {
      return { $$typeof: w, type: L, compare: T === void 0 ? null : T };
    }),
    (le.startTransition = function (L) {
      var T = z.transition;
      z.transition = {};
      try {
        L();
      } finally {
        z.transition = T;
      }
    }),
    (le.unstable_act = W),
    (le.useCallback = function (L, T) {
      return Q.current.useCallback(L, T);
    }),
    (le.useContext = function (L) {
      return Q.current.useContext(L);
    }),
    (le.useDebugValue = function () {}),
    (le.useDeferredValue = function (L) {
      return Q.current.useDeferredValue(L);
    }),
    (le.useEffect = function (L, T) {
      return Q.current.useEffect(L, T);
    }),
    (le.useId = function () {
      return Q.current.useId();
    }),
    (le.useImperativeHandle = function (L, T, ne) {
      return Q.current.useImperativeHandle(L, T, ne);
    }),
    (le.useInsertionEffect = function (L, T) {
      return Q.current.useInsertionEffect(L, T);
    }),
    (le.useLayoutEffect = function (L, T) {
      return Q.current.useLayoutEffect(L, T);
    }),
    (le.useMemo = function (L, T) {
      return Q.current.useMemo(L, T);
    }),
    (le.useReducer = function (L, T, ne) {
      return Q.current.useReducer(L, T, ne);
    }),
    (le.useRef = function (L) {
      return Q.current.useRef(L);
    }),
    (le.useState = function (L) {
      return Q.current.useState(L);
    }),
    (le.useSyncExternalStore = function (L, T, ne) {
      return Q.current.useSyncExternalStore(L, T, ne);
    }),
    (le.useTransition = function () {
      return Q.current.useTransition();
    }),
    (le.version = "18.3.1"),
    le
  );
}
var t0;
function tn() {
  return t0 || ((t0 = 1), (Si.exports = Z4())), Si.exports;
}
/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var r0;
function W4() {
  if (r0) return Yr;
  r0 = 1;
  var l = tn(),
    s = Symbol.for("react.element"),
    a = Symbol.for("react.fragment"),
    c = Object.prototype.hasOwnProperty,
    d = l.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
    m = { key: !0, ref: !0, __self: !0, __source: !0 };
  function h(p, y, w) {
    var E,
      g = {},
      b = null,
      R = null;
    w !== void 0 && (b = "" + w),
      y.key !== void 0 && (b = "" + y.key),
      y.ref !== void 0 && (R = y.ref);
    for (E in y) c.call(y, E) && !m.hasOwnProperty(E) && (g[E] = y[E]);
    if (p && p.defaultProps)
      for (E in ((y = p.defaultProps), y)) g[E] === void 0 && (g[E] = y[E]);
    return {
      $$typeof: s,
      type: p,
      key: b,
      ref: R,
      props: g,
      _owner: d.current,
    };
  }
  return (Yr.Fragment = a), (Yr.jsx = h), (Yr.jsxs = h), Yr;
}
var n0;
function $4() {
  return n0 || ((n0 = 1), (Li.exports = W4())), Li.exports;
}
var i = $4(),
  C = tn();
const _t = El(C),
  B0 = H4({ __proto__: null, default: _t }, [C]);
var ml = {},
  Ni = { exports: {} },
  rt = {},
  bi = { exports: {} },
  ki = {};
/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var l0;
function G4() {
  return (
    l0 ||
      ((l0 = 1),
      (function (l) {
        function s(z, X) {
          var W = z.length;
          z.push(X);
          e: for (; 0 < W; ) {
            var L = (W - 1) >>> 1,
              T = z[L];
            if (0 < d(T, X)) (z[L] = X), (z[W] = T), (W = L);
            else break e;
          }
        }
        function a(z) {
          return z.length === 0 ? null : z[0];
        }
        function c(z) {
          if (z.length === 0) return null;
          var X = z[0],
            W = z.pop();
          if (W !== X) {
            z[0] = W;
            e: for (var L = 0, T = z.length, ne = T >>> 1; L < ne; ) {
              var se = 2 * (L + 1) - 1,
                ae = z[se],
                ue = se + 1,
                he = z[ue];
              if (0 > d(ae, W))
                ue < T && 0 > d(he, ae)
                  ? ((z[L] = he), (z[ue] = W), (L = ue))
                  : ((z[L] = ae), (z[se] = W), (L = se));
              else if (ue < T && 0 > d(he, W))
                (z[L] = he), (z[ue] = W), (L = ue);
              else break e;
            }
          }
          return X;
        }
        function d(z, X) {
          var W = z.sortIndex - X.sortIndex;
          return W !== 0 ? W : z.id - X.id;
        }
        if (
          typeof performance == "object" &&
          typeof performance.now == "function"
        ) {
          var m = performance;
          l.unstable_now = function () {
            return m.now();
          };
        } else {
          var h = Date,
            p = h.now();
          l.unstable_now = function () {
            return h.now() - p;
          };
        }
        var y = [],
          w = [],
          E = 1,
          g = null,
          b = 3,
          R = !1,
          P = !1,
          S = !1,
          _ = typeof setTimeout == "function" ? setTimeout : null,
          M = typeof clearTimeout == "function" ? clearTimeout : null,
          H = typeof setImmediate < "u" ? setImmediate : null;
        typeof navigator < "u" &&
          navigator.scheduling !== void 0 &&
          navigator.scheduling.isInputPending !== void 0 &&
          navigator.scheduling.isInputPending.bind(navigator.scheduling);
        function V(z) {
          for (var X = a(w); X !== null; ) {
            if (X.callback === null) c(w);
            else if (X.startTime <= z)
              c(w), (X.sortIndex = X.expirationTime), s(y, X);
            else break;
            X = a(w);
          }
        }
        function F(z) {
          if (((S = !1), V(z), !P))
            if (a(y) !== null) (P = !0), je(ee);
            else {
              var X = a(w);
              X !== null && Q(F, X.startTime - z);
            }
        }
        function ee(z, X) {
          (P = !1), S && ((S = !1), M(fe), (fe = -1)), (R = !0);
          var W = b;
          try {
            for (
              V(X), g = a(y);
              g !== null && (!(g.expirationTime > X) || (z && !xe()));

            ) {
              var L = g.callback;
              if (typeof L == "function") {
                (g.callback = null), (b = g.priorityLevel);
                var T = L(g.expirationTime <= X);
                (X = l.unstable_now()),
                  typeof T == "function"
                    ? (g.callback = T)
                    : g === a(y) && c(y),
                  V(X);
              } else c(y);
              g = a(y);
            }
            if (g !== null) var ne = !0;
            else {
              var se = a(w);
              se !== null && Q(F, se.startTime - X), (ne = !1);
            }
            return ne;
          } finally {
            (g = null), (b = W), (R = !1);
          }
        }
        var re = !1,
          Y = null,
          fe = -1,
          Ie = 5,
          be = -1;
        function xe() {
          return !(l.unstable_now() - be < Ie);
        }
        function _e() {
          if (Y !== null) {
            var z = l.unstable_now();
            be = z;
            var X = !0;
            try {
              X = Y(!0, z);
            } finally {
              X ? Se() : ((re = !1), (Y = null));
            }
          } else re = !1;
        }
        var Se;
        if (typeof H == "function")
          Se = function () {
            H(_e);
          };
        else if (typeof MessageChannel < "u") {
          var Ue = new MessageChannel(),
            He = Ue.port2;
          (Ue.port1.onmessage = _e),
            (Se = function () {
              He.postMessage(null);
            });
        } else
          Se = function () {
            _(_e, 0);
          };
        function je(z) {
          (Y = z), re || ((re = !0), Se());
        }
        function Q(z, X) {
          fe = _(function () {
            z(l.unstable_now());
          }, X);
        }
        (l.unstable_IdlePriority = 5),
          (l.unstable_ImmediatePriority = 1),
          (l.unstable_LowPriority = 4),
          (l.unstable_NormalPriority = 3),
          (l.unstable_Profiling = null),
          (l.unstable_UserBlockingPriority = 2),
          (l.unstable_cancelCallback = function (z) {
            z.callback = null;
          }),
          (l.unstable_continueExecution = function () {
            P || R || ((P = !0), je(ee));
          }),
          (l.unstable_forceFrameRate = function (z) {
            0 > z || 125 < z
              ? console.error(
                  "forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"
                )
              : (Ie = 0 < z ? Math.floor(1e3 / z) : 5);
          }),
          (l.unstable_getCurrentPriorityLevel = function () {
            return b;
          }),
          (l.unstable_getFirstCallbackNode = function () {
            return a(y);
          }),
          (l.unstable_next = function (z) {
            switch (b) {
              case 1:
              case 2:
              case 3:
                var X = 3;
                break;
              default:
                X = b;
            }
            var W = b;
            b = X;
            try {
              return z();
            } finally {
              b = W;
            }
          }),
          (l.unstable_pauseExecution = function () {}),
          (l.unstable_requestPaint = function () {}),
          (l.unstable_runWithPriority = function (z, X) {
            switch (z) {
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
                break;
              default:
                z = 3;
            }
            var W = b;
            b = z;
            try {
              return X();
            } finally {
              b = W;
            }
          }),
          (l.unstable_scheduleCallback = function (z, X, W) {
            var L = l.unstable_now();
            switch (
              (typeof W == "object" && W !== null
                ? ((W = W.delay),
                  (W = typeof W == "number" && 0 < W ? L + W : L))
                : (W = L),
              z)
            ) {
              case 1:
                var T = -1;
                break;
              case 2:
                T = 250;
                break;
              case 5:
                T = 1073741823;
                break;
              case 4:
                T = 1e4;
                break;
              default:
                T = 5e3;
            }
            return (
              (T = W + T),
              (z = {
                id: E++,
                callback: X,
                priorityLevel: z,
                startTime: W,
                expirationTime: T,
                sortIndex: -1,
              }),
              W > L
                ? ((z.sortIndex = W),
                  s(w, z),
                  a(y) === null &&
                    z === a(w) &&
                    (S ? (M(fe), (fe = -1)) : (S = !0), Q(F, W - L)))
                : ((z.sortIndex = T), s(y, z), P || R || ((P = !0), je(ee))),
              z
            );
          }),
          (l.unstable_shouldYield = xe),
          (l.unstable_wrapCallback = function (z) {
            var X = b;
            return function () {
              var W = b;
              b = X;
              try {
                return z.apply(this, arguments);
              } finally {
                b = W;
              }
            };
          });
      })(ki)),
    ki
  );
}
var i0;
function K4() {
  return i0 || ((i0 = 1), (bi.exports = G4())), bi.exports;
}
/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var s0;
function Q4() {
  if (s0) return rt;
  s0 = 1;
  var l = tn(),
    s = K4();
  function a(e) {
    for (
      var t = "https://reactjs.org/docs/error-decoder.html?invariant=" + e,
        r = 1;
      r < arguments.length;
      r++
    )
      t += "&args[]=" + encodeURIComponent(arguments[r]);
    return (
      "Minified React error #" +
      e +
      "; visit " +
      t +
      " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    );
  }
  var c = new Set(),
    d = {};
  function m(e, t) {
    h(e, t), h(e + "Capture", t);
  }
  function h(e, t) {
    for (d[e] = t, e = 0; e < t.length; e++) c.add(t[e]);
  }
  var p = !(
      typeof window > "u" ||
      typeof window.document > "u" ||
      typeof window.document.createElement > "u"
    ),
    y = Object.prototype.hasOwnProperty,
    w =
      /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
    E = {},
    g = {};
  function b(e) {
    return y.call(g, e)
      ? !0
      : y.call(E, e)
      ? !1
      : w.test(e)
      ? (g[e] = !0)
      : ((E[e] = !0), !1);
  }
  function R(e, t, r, n) {
    if (r !== null && r.type === 0) return !1;
    switch (typeof t) {
      case "function":
      case "symbol":
        return !0;
      case "boolean":
        return n
          ? !1
          : r !== null
          ? !r.acceptsBooleans
          : ((e = e.toLowerCase().slice(0, 5)), e !== "data-" && e !== "aria-");
      default:
        return !1;
    }
  }
  function P(e, t, r, n) {
    if (t === null || typeof t > "u" || R(e, t, r, n)) return !0;
    if (n) return !1;
    if (r !== null)
      switch (r.type) {
        case 3:
          return !t;
        case 4:
          return t === !1;
        case 5:
          return isNaN(t);
        case 6:
          return isNaN(t) || 1 > t;
      }
    return !1;
  }
  function S(e, t, r, n, o, u, f) {
    (this.acceptsBooleans = t === 2 || t === 3 || t === 4),
      (this.attributeName = n),
      (this.attributeNamespace = o),
      (this.mustUseProperty = r),
      (this.propertyName = e),
      (this.type = t),
      (this.sanitizeURL = u),
      (this.removeEmptyString = f);
  }
  var _ = {};
  "children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style"
    .split(" ")
    .forEach(function (e) {
      _[e] = new S(e, 0, !1, e, null, !1, !1);
    }),
    [
      ["acceptCharset", "accept-charset"],
      ["className", "class"],
      ["htmlFor", "for"],
      ["httpEquiv", "http-equiv"],
    ].forEach(function (e) {
      var t = e[0];
      _[t] = new S(t, 1, !1, e[1], null, !1, !1);
    }),
    ["contentEditable", "draggable", "spellCheck", "value"].forEach(function (
      e
    ) {
      _[e] = new S(e, 2, !1, e.toLowerCase(), null, !1, !1);
    }),
    [
      "autoReverse",
      "externalResourcesRequired",
      "focusable",
      "preserveAlpha",
    ].forEach(function (e) {
      _[e] = new S(e, 2, !1, e, null, !1, !1);
    }),
    "allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope"
      .split(" ")
      .forEach(function (e) {
        _[e] = new S(e, 3, !1, e.toLowerCase(), null, !1, !1);
      }),
    ["checked", "multiple", "muted", "selected"].forEach(function (e) {
      _[e] = new S(e, 3, !0, e, null, !1, !1);
    }),
    ["capture", "download"].forEach(function (e) {
      _[e] = new S(e, 4, !1, e, null, !1, !1);
    }),
    ["cols", "rows", "size", "span"].forEach(function (e) {
      _[e] = new S(e, 6, !1, e, null, !1, !1);
    }),
    ["rowSpan", "start"].forEach(function (e) {
      _[e] = new S(e, 5, !1, e.toLowerCase(), null, !1, !1);
    });
  var M = /[\-:]([a-z])/g;
  function H(e) {
    return e[1].toUpperCase();
  }
  "accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height"
    .split(" ")
    .forEach(function (e) {
      var t = e.replace(M, H);
      _[t] = new S(t, 1, !1, e, null, !1, !1);
    }),
    "xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type"
      .split(" ")
      .forEach(function (e) {
        var t = e.replace(M, H);
        _[t] = new S(t, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1);
      }),
    ["xml:base", "xml:lang", "xml:space"].forEach(function (e) {
      var t = e.replace(M, H);
      _[t] = new S(t, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1);
    }),
    ["tabIndex", "crossOrigin"].forEach(function (e) {
      _[e] = new S(e, 1, !1, e.toLowerCase(), null, !1, !1);
    }),
    (_.xlinkHref = new S(
      "xlinkHref",
      1,
      !1,
      "xlink:href",
      "http://www.w3.org/1999/xlink",
      !0,
      !1
    )),
    ["src", "href", "action", "formAction"].forEach(function (e) {
      _[e] = new S(e, 1, !1, e.toLowerCase(), null, !0, !0);
    });
  function V(e, t, r, n) {
    var o = _.hasOwnProperty(t) ? _[t] : null;
    (o !== null
      ? o.type !== 0
      : n ||
        !(2 < t.length) ||
        (t[0] !== "o" && t[0] !== "O") ||
        (t[1] !== "n" && t[1] !== "N")) &&
      (P(t, r, o, n) && (r = null),
      n || o === null
        ? b(t) &&
          (r === null ? e.removeAttribute(t) : e.setAttribute(t, "" + r))
        : o.mustUseProperty
        ? (e[o.propertyName] = r === null ? (o.type === 3 ? !1 : "") : r)
        : ((t = o.attributeName),
          (n = o.attributeNamespace),
          r === null
            ? e.removeAttribute(t)
            : ((o = o.type),
              (r = o === 3 || (o === 4 && r === !0) ? "" : "" + r),
              n ? e.setAttributeNS(n, t, r) : e.setAttribute(t, r))));
  }
  var F = l.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
    ee = Symbol.for("react.element"),
    re = Symbol.for("react.portal"),
    Y = Symbol.for("react.fragment"),
    fe = Symbol.for("react.strict_mode"),
    Ie = Symbol.for("react.profiler"),
    be = Symbol.for("react.provider"),
    xe = Symbol.for("react.context"),
    _e = Symbol.for("react.forward_ref"),
    Se = Symbol.for("react.suspense"),
    Ue = Symbol.for("react.suspense_list"),
    He = Symbol.for("react.memo"),
    je = Symbol.for("react.lazy"),
    Q = Symbol.for("react.offscreen"),
    z = Symbol.iterator;
  function X(e) {
    return e === null || typeof e != "object"
      ? null
      : ((e = (z && e[z]) || e["@@iterator"]),
        typeof e == "function" ? e : null);
  }
  var W = Object.assign,
    L;
  function T(e) {
    if (L === void 0)
      try {
        throw Error();
      } catch (r) {
        var t = r.stack.trim().match(/\n( *(at )?)/);
        L = (t && t[1]) || "";
      }
    return (
      `
` +
      L +
      e
    );
  }
  var ne = !1;
  function se(e, t) {
    if (!e || ne) return "";
    ne = !0;
    var r = Error.prepareStackTrace;
    Error.prepareStackTrace = void 0;
    try {
      if (t)
        if (
          ((t = function () {
            throw Error();
          }),
          Object.defineProperty(t.prototype, "props", {
            set: function () {
              throw Error();
            },
          }),
          typeof Reflect == "object" && Reflect.construct)
        ) {
          try {
            Reflect.construct(t, []);
          } catch (D) {
            var n = D;
          }
          Reflect.construct(e, [], t);
        } else {
          try {
            t.call();
          } catch (D) {
            n = D;
          }
          e.call(t.prototype);
        }
      else {
        try {
          throw Error();
        } catch (D) {
          n = D;
        }
        e();
      }
    } catch (D) {
      if (D && n && typeof D.stack == "string") {
        for (
          var o = D.stack.split(`
`),
            u = n.stack.split(`
`),
            f = o.length - 1,
            x = u.length - 1;
          1 <= f && 0 <= x && o[f] !== u[x];

        )
          x--;
        for (; 1 <= f && 0 <= x; f--, x--)
          if (o[f] !== u[x]) {
            if (f !== 1 || x !== 1)
              do
                if ((f--, x--, 0 > x || o[f] !== u[x])) {
                  var v =
                    `
` + o[f].replace(" at new ", " at ");
                  return (
                    e.displayName &&
                      v.includes("<anonymous>") &&
                      (v = v.replace("<anonymous>", e.displayName)),
                    v
                  );
                }
              while (1 <= f && 0 <= x);
            break;
          }
      }
    } finally {
      (ne = !1), (Error.prepareStackTrace = r);
    }
    return (e = e ? e.displayName || e.name : "") ? T(e) : "";
  }
  function ae(e) {
    switch (e.tag) {
      case 5:
        return T(e.type);
      case 16:
        return T("Lazy");
      case 13:
        return T("Suspense");
      case 19:
        return T("SuspenseList");
      case 0:
      case 2:
      case 15:
        return (e = se(e.type, !1)), e;
      case 11:
        return (e = se(e.type.render, !1)), e;
      case 1:
        return (e = se(e.type, !0)), e;
      default:
        return "";
    }
  }
  function ue(e) {
    if (e == null) return null;
    if (typeof e == "function") return e.displayName || e.name || null;
    if (typeof e == "string") return e;
    switch (e) {
      case Y:
        return "Fragment";
      case re:
        return "Portal";
      case Ie:
        return "Profiler";
      case fe:
        return "StrictMode";
      case Se:
        return "Suspense";
      case Ue:
        return "SuspenseList";
    }
    if (typeof e == "object")
      switch (e.$$typeof) {
        case xe:
          return (e.displayName || "Context") + ".Consumer";
        case be:
          return (e._context.displayName || "Context") + ".Provider";
        case _e:
          var t = e.render;
          return (
            (e = e.displayName),
            e ||
              ((e = t.displayName || t.name || ""),
              (e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")),
            e
          );
        case He:
          return (
            (t = e.displayName || null), t !== null ? t : ue(e.type) || "Memo"
          );
        case je:
          (t = e._payload), (e = e._init);
          try {
            return ue(e(t));
          } catch {}
      }
    return null;
  }
  function he(e) {
    var t = e.type;
    switch (e.tag) {
      case 24:
        return "Cache";
      case 9:
        return (t.displayName || "Context") + ".Consumer";
      case 10:
        return (t._context.displayName || "Context") + ".Provider";
      case 18:
        return "DehydratedFragment";
      case 11:
        return (
          (e = t.render),
          (e = e.displayName || e.name || ""),
          t.displayName || (e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")
        );
      case 7:
        return "Fragment";
      case 5:
        return t;
      case 4:
        return "Portal";
      case 3:
        return "Root";
      case 6:
        return "Text";
      case 16:
        return ue(t);
      case 8:
        return t === fe ? "StrictMode" : "Mode";
      case 22:
        return "Offscreen";
      case 12:
        return "Profiler";
      case 21:
        return "Scope";
      case 13:
        return "Suspense";
      case 19:
        return "SuspenseList";
      case 25:
        return "TracingMarker";
      case 1:
      case 0:
      case 17:
      case 2:
      case 14:
      case 15:
        if (typeof t == "function") return t.displayName || t.name || null;
        if (typeof t == "string") return t;
    }
    return null;
  }
  function me(e) {
    switch (typeof e) {
      case "boolean":
      case "number":
      case "string":
      case "undefined":
        return e;
      case "object":
        return e;
      default:
        return "";
    }
  }
  function we(e) {
    var t = e.type;
    return (
      (e = e.nodeName) &&
      e.toLowerCase() === "input" &&
      (t === "checkbox" || t === "radio")
    );
  }
  function it(e) {
    var t = we(e) ? "checked" : "value",
      r = Object.getOwnPropertyDescriptor(e.constructor.prototype, t),
      n = "" + e[t];
    if (
      !e.hasOwnProperty(t) &&
      typeof r < "u" &&
      typeof r.get == "function" &&
      typeof r.set == "function"
    ) {
      var o = r.get,
        u = r.set;
      return (
        Object.defineProperty(e, t, {
          configurable: !0,
          get: function () {
            return o.call(this);
          },
          set: function (f) {
            (n = "" + f), u.call(this, f);
          },
        }),
        Object.defineProperty(e, t, { enumerable: r.enumerable }),
        {
          getValue: function () {
            return n;
          },
          setValue: function (f) {
            n = "" + f;
          },
          stopTracking: function () {
            (e._valueTracker = null), delete e[t];
          },
        }
      );
    }
  }
  function rn(e) {
    e._valueTracker || (e._valueTracker = it(e));
  }
  function i3(e) {
    if (!e) return !1;
    var t = e._valueTracker;
    if (!t) return !0;
    var r = t.getValue(),
      n = "";
    return (
      e && (n = we(e) ? (e.checked ? "true" : "false") : e.value),
      (e = n),
      e !== r ? (t.setValue(e), !0) : !1
    );
  }
  function nn(e) {
    if (
      ((e = e || (typeof document < "u" ? document : void 0)), typeof e > "u")
    )
      return null;
    try {
      return e.activeElement || e.body;
    } catch {
      return e.body;
    }
  }
  function Rl(e, t) {
    var r = t.checked;
    return W({}, t, {
      defaultChecked: void 0,
      defaultValue: void 0,
      value: void 0,
      checked: r ?? e._wrapperState.initialChecked,
    });
  }
  function s3(e, t) {
    var r = t.defaultValue == null ? "" : t.defaultValue,
      n = t.checked != null ? t.checked : t.defaultChecked;
    (r = me(t.value != null ? t.value : r)),
      (e._wrapperState = {
        initialChecked: n,
        initialValue: r,
        controlled:
          t.type === "checkbox" || t.type === "radio"
            ? t.checked != null
            : t.value != null,
      });
  }
  function o3(e, t) {
    (t = t.checked), t != null && V(e, "checked", t, !1);
  }
  function Ml(e, t) {
    o3(e, t);
    var r = me(t.value),
      n = t.type;
    if (r != null)
      n === "number"
        ? ((r === 0 && e.value === "") || e.value != r) && (e.value = "" + r)
        : e.value !== "" + r && (e.value = "" + r);
    else if (n === "submit" || n === "reset") {
      e.removeAttribute("value");
      return;
    }
    t.hasOwnProperty("value")
      ? Pl(e, t.type, r)
      : t.hasOwnProperty("defaultValue") && Pl(e, t.type, me(t.defaultValue)),
      t.checked == null &&
        t.defaultChecked != null &&
        (e.defaultChecked = !!t.defaultChecked);
  }
  function a3(e, t, r) {
    if (t.hasOwnProperty("value") || t.hasOwnProperty("defaultValue")) {
      var n = t.type;
      if (
        !(
          (n !== "submit" && n !== "reset") ||
          (t.value !== void 0 && t.value !== null)
        )
      )
        return;
      (t = "" + e._wrapperState.initialValue),
        r || t === e.value || (e.value = t),
        (e.defaultValue = t);
    }
    (r = e.name),
      r !== "" && (e.name = ""),
      (e.defaultChecked = !!e._wrapperState.initialChecked),
      r !== "" && (e.name = r);
  }
  function Pl(e, t, r) {
    (t !== "number" || nn(e.ownerDocument) !== e) &&
      (r == null
        ? (e.defaultValue = "" + e._wrapperState.initialValue)
        : e.defaultValue !== "" + r && (e.defaultValue = "" + r));
  }
  var dr = Array.isArray;
  function P1(e, t, r, n) {
    if (((e = e.options), t)) {
      t = {};
      for (var o = 0; o < r.length; o++) t["$" + r[o]] = !0;
      for (r = 0; r < e.length; r++)
        (o = t.hasOwnProperty("$" + e[r].value)),
          e[r].selected !== o && (e[r].selected = o),
          o && n && (e[r].defaultSelected = !0);
    } else {
      for (r = "" + me(r), t = null, o = 0; o < e.length; o++) {
        if (e[o].value === r) {
          (e[o].selected = !0), n && (e[o].defaultSelected = !0);
          return;
        }
        t !== null || e[o].disabled || (t = e[o]);
      }
      t !== null && (t.selected = !0);
    }
  }
  function Ol(e, t) {
    if (t.dangerouslySetInnerHTML != null) throw Error(a(91));
    return W({}, t, {
      value: void 0,
      defaultValue: void 0,
      children: "" + e._wrapperState.initialValue,
    });
  }
  function u3(e, t) {
    var r = t.value;
    if (r == null) {
      if (((r = t.children), (t = t.defaultValue), r != null)) {
        if (t != null) throw Error(a(92));
        if (dr(r)) {
          if (1 < r.length) throw Error(a(93));
          r = r[0];
        }
        t = r;
      }
      t == null && (t = ""), (r = t);
    }
    e._wrapperState = { initialValue: me(r) };
  }
  function c3(e, t) {
    var r = me(t.value),
      n = me(t.defaultValue);
    r != null &&
      ((r = "" + r),
      r !== e.value && (e.value = r),
      t.defaultValue == null && e.defaultValue !== r && (e.defaultValue = r)),
      n != null && (e.defaultValue = "" + n);
  }
  function d3(e) {
    var t = e.textContent;
    t === e._wrapperState.initialValue &&
      t !== "" &&
      t !== null &&
      (e.value = t);
  }
  function f3(e) {
    switch (e) {
      case "svg":
        return "http://www.w3.org/2000/svg";
      case "math":
        return "http://www.w3.org/1998/Math/MathML";
      default:
        return "http://www.w3.org/1999/xhtml";
    }
  }
  function Tl(e, t) {
    return e == null || e === "http://www.w3.org/1999/xhtml"
      ? f3(t)
      : e === "http://www.w3.org/2000/svg" && t === "foreignObject"
      ? "http://www.w3.org/1999/xhtml"
      : e;
  }
  var ln,
    m3 = (function (e) {
      return typeof MSApp < "u" && MSApp.execUnsafeLocalFunction
        ? function (t, r, n, o) {
            MSApp.execUnsafeLocalFunction(function () {
              return e(t, r, n, o);
            });
          }
        : e;
    })(function (e, t) {
      if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e)
        e.innerHTML = t;
      else {
        for (
          ln = ln || document.createElement("div"),
            ln.innerHTML = "<svg>" + t.valueOf().toString() + "</svg>",
            t = ln.firstChild;
          e.firstChild;

        )
          e.removeChild(e.firstChild);
        for (; t.firstChild; ) e.appendChild(t.firstChild);
      }
    });
  function fr(e, t) {
    if (t) {
      var r = e.firstChild;
      if (r && r === e.lastChild && r.nodeType === 3) {
        r.nodeValue = t;
        return;
      }
    }
    e.textContent = t;
  }
  var mr = {
      animationIterationCount: !0,
      aspectRatio: !0,
      borderImageOutset: !0,
      borderImageSlice: !0,
      borderImageWidth: !0,
      boxFlex: !0,
      boxFlexGroup: !0,
      boxOrdinalGroup: !0,
      columnCount: !0,
      columns: !0,
      flex: !0,
      flexGrow: !0,
      flexPositive: !0,
      flexShrink: !0,
      flexNegative: !0,
      flexOrder: !0,
      gridArea: !0,
      gridRow: !0,
      gridRowEnd: !0,
      gridRowSpan: !0,
      gridRowStart: !0,
      gridColumn: !0,
      gridColumnEnd: !0,
      gridColumnSpan: !0,
      gridColumnStart: !0,
      fontWeight: !0,
      lineClamp: !0,
      lineHeight: !0,
      opacity: !0,
      order: !0,
      orphans: !0,
      tabSize: !0,
      widows: !0,
      zIndex: !0,
      zoom: !0,
      fillOpacity: !0,
      floodOpacity: !0,
      stopOpacity: !0,
      strokeDasharray: !0,
      strokeDashoffset: !0,
      strokeMiterlimit: !0,
      strokeOpacity: !0,
      strokeWidth: !0,
    },
    Ga = ["Webkit", "ms", "Moz", "O"];
  Object.keys(mr).forEach(function (e) {
    Ga.forEach(function (t) {
      (t = t + e.charAt(0).toUpperCase() + e.substring(1)), (mr[t] = mr[e]);
    });
  });
  function p3(e, t, r) {
    return t == null || typeof t == "boolean" || t === ""
      ? ""
      : r || typeof t != "number" || t === 0 || (mr.hasOwnProperty(e) && mr[e])
      ? ("" + t).trim()
      : t + "px";
  }
  function h3(e, t) {
    e = e.style;
    for (var r in t)
      if (t.hasOwnProperty(r)) {
        var n = r.indexOf("--") === 0,
          o = p3(r, t[r], n);
        r === "float" && (r = "cssFloat"), n ? e.setProperty(r, o) : (e[r] = o);
      }
  }
  var Ka = W(
    { menuitem: !0 },
    {
      area: !0,
      base: !0,
      br: !0,
      col: !0,
      embed: !0,
      hr: !0,
      img: !0,
      input: !0,
      keygen: !0,
      link: !0,
      meta: !0,
      param: !0,
      source: !0,
      track: !0,
      wbr: !0,
    }
  );
  function Il(e, t) {
    if (t) {
      if (Ka[e] && (t.children != null || t.dangerouslySetInnerHTML != null))
        throw Error(a(137, e));
      if (t.dangerouslySetInnerHTML != null) {
        if (t.children != null) throw Error(a(60));
        if (
          typeof t.dangerouslySetInnerHTML != "object" ||
          !("__html" in t.dangerouslySetInnerHTML)
        )
          throw Error(a(61));
      }
      if (t.style != null && typeof t.style != "object") throw Error(a(62));
    }
  }
  function Al(e, t) {
    if (e.indexOf("-") === -1) return typeof t.is == "string";
    switch (e) {
      case "annotation-xml":
      case "color-profile":
      case "font-face":
      case "font-face-src":
      case "font-face-uri":
      case "font-face-format":
      case "font-face-name":
      case "missing-glyph":
        return !1;
      default:
        return !0;
    }
  }
  var Bl = null;
  function zl(e) {
    return (
      (e = e.target || e.srcElement || window),
      e.correspondingUseElement && (e = e.correspondingUseElement),
      e.nodeType === 3 ? e.parentNode : e
    );
  }
  var Fl = null,
    O1 = null,
    T1 = null;
  function C3(e) {
    if ((e = Tr(e))) {
      if (typeof Fl != "function") throw Error(a(280));
      var t = e.stateNode;
      t && ((t = kn(t)), Fl(e.stateNode, e.type, t));
    }
  }
  function x3(e) {
    O1 ? (T1 ? T1.push(e) : (T1 = [e])) : (O1 = e);
  }
  function g3() {
    if (O1) {
      var e = O1,
        t = T1;
      if (((T1 = O1 = null), C3(e), t)) for (e = 0; e < t.length; e++) C3(t[e]);
    }
  }
  function v3(e, t) {
    return e(t);
  }
  function w3() {}
  var Vl = !1;
  function y3(e, t, r) {
    if (Vl) return e(t, r);
    Vl = !0;
    try {
      return v3(e, t, r);
    } finally {
      (Vl = !1), (O1 !== null || T1 !== null) && (w3(), g3());
    }
  }
  function pr(e, t) {
    var r = e.stateNode;
    if (r === null) return null;
    var n = kn(r);
    if (n === null) return null;
    r = n[t];
    e: switch (t) {
      case "onClick":
      case "onClickCapture":
      case "onDoubleClick":
      case "onDoubleClickCapture":
      case "onMouseDown":
      case "onMouseDownCapture":
      case "onMouseMove":
      case "onMouseMoveCapture":
      case "onMouseUp":
      case "onMouseUpCapture":
      case "onMouseEnter":
        (n = !n.disabled) ||
          ((e = e.type),
          (n = !(
            e === "button" ||
            e === "input" ||
            e === "select" ||
            e === "textarea"
          ))),
          (e = !n);
        break e;
      default:
        e = !1;
    }
    if (e) return null;
    if (r && typeof r != "function") throw Error(a(231, t, typeof r));
    return r;
  }
  var Ul = !1;
  if (p)
    try {
      var hr = {};
      Object.defineProperty(hr, "passive", {
        get: function () {
          Ul = !0;
        },
      }),
        window.addEventListener("test", hr, hr),
        window.removeEventListener("test", hr, hr);
    } catch {
      Ul = !1;
    }
  function Qa(e, t, r, n, o, u, f, x, v) {
    var D = Array.prototype.slice.call(arguments, 3);
    try {
      t.apply(r, D);
    } catch (I) {
      this.onError(I);
    }
  }
  var Cr = !1,
    sn = null,
    on = !1,
    Hl = null,
    Ya = {
      onError: function (e) {
        (Cr = !0), (sn = e);
      },
    };
  function Xa(e, t, r, n, o, u, f, x, v) {
    (Cr = !1), (sn = null), Qa.apply(Ya, arguments);
  }
  function Ja(e, t, r, n, o, u, f, x, v) {
    if ((Xa.apply(this, arguments), Cr)) {
      if (Cr) {
        var D = sn;
        (Cr = !1), (sn = null);
      } else throw Error(a(198));
      on || ((on = !0), (Hl = D));
    }
  }
  function h1(e) {
    var t = e,
      r = e;
    if (e.alternate) for (; t.return; ) t = t.return;
    else {
      e = t;
      do (t = e), (t.flags & 4098) !== 0 && (r = t.return), (e = t.return);
      while (e);
    }
    return t.tag === 3 ? r : null;
  }
  function j3(e) {
    if (e.tag === 13) {
      var t = e.memoizedState;
      if (
        (t === null && ((e = e.alternate), e !== null && (t = e.memoizedState)),
        t !== null)
      )
        return t.dehydrated;
    }
    return null;
  }
  function E3(e) {
    if (h1(e) !== e) throw Error(a(188));
  }
  function qa(e) {
    var t = e.alternate;
    if (!t) {
      if (((t = h1(e)), t === null)) throw Error(a(188));
      return t !== e ? null : e;
    }
    for (var r = e, n = t; ; ) {
      var o = r.return;
      if (o === null) break;
      var u = o.alternate;
      if (u === null) {
        if (((n = o.return), n !== null)) {
          r = n;
          continue;
        }
        break;
      }
      if (o.child === u.child) {
        for (u = o.child; u; ) {
          if (u === r) return E3(o), e;
          if (u === n) return E3(o), t;
          u = u.sibling;
        }
        throw Error(a(188));
      }
      if (r.return !== n.return) (r = o), (n = u);
      else {
        for (var f = !1, x = o.child; x; ) {
          if (x === r) {
            (f = !0), (r = o), (n = u);
            break;
          }
          if (x === n) {
            (f = !0), (n = o), (r = u);
            break;
          }
          x = x.sibling;
        }
        if (!f) {
          for (x = u.child; x; ) {
            if (x === r) {
              (f = !0), (r = u), (n = o);
              break;
            }
            if (x === n) {
              (f = !0), (n = u), (r = o);
              break;
            }
            x = x.sibling;
          }
          if (!f) throw Error(a(189));
        }
      }
      if (r.alternate !== n) throw Error(a(190));
    }
    if (r.tag !== 3) throw Error(a(188));
    return r.stateNode.current === r ? e : t;
  }
  function L3(e) {
    return (e = qa(e)), e !== null ? S3(e) : null;
  }
  function S3(e) {
    if (e.tag === 5 || e.tag === 6) return e;
    for (e = e.child; e !== null; ) {
      var t = S3(e);
      if (t !== null) return t;
      e = e.sibling;
    }
    return null;
  }
  var N3 = s.unstable_scheduleCallback,
    b3 = s.unstable_cancelCallback,
    e5 = s.unstable_shouldYield,
    t5 = s.unstable_requestPaint,
    ke = s.unstable_now,
    r5 = s.unstable_getCurrentPriorityLevel,
    Zl = s.unstable_ImmediatePriority,
    k3 = s.unstable_UserBlockingPriority,
    an = s.unstable_NormalPriority,
    n5 = s.unstable_LowPriority,
    D3 = s.unstable_IdlePriority,
    un = null,
    St = null;
  function l5(e) {
    if (St && typeof St.onCommitFiberRoot == "function")
      try {
        St.onCommitFiberRoot(un, e, void 0, (e.current.flags & 128) === 128);
      } catch {}
  }
  var xt = Math.clz32 ? Math.clz32 : o5,
    i5 = Math.log,
    s5 = Math.LN2;
  function o5(e) {
    return (e >>>= 0), e === 0 ? 32 : (31 - ((i5(e) / s5) | 0)) | 0;
  }
  var cn = 64,
    dn = 4194304;
  function xr(e) {
    switch (e & -e) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 4:
        return 4;
      case 8:
        return 8;
      case 16:
        return 16;
      case 32:
        return 32;
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
        return e & 4194240;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
        return e & 130023424;
      case 134217728:
        return 134217728;
      case 268435456:
        return 268435456;
      case 536870912:
        return 536870912;
      case 1073741824:
        return 1073741824;
      default:
        return e;
    }
  }
  function fn(e, t) {
    var r = e.pendingLanes;
    if (r === 0) return 0;
    var n = 0,
      o = e.suspendedLanes,
      u = e.pingedLanes,
      f = r & 268435455;
    if (f !== 0) {
      var x = f & ~o;
      x !== 0 ? (n = xr(x)) : ((u &= f), u !== 0 && (n = xr(u)));
    } else (f = r & ~o), f !== 0 ? (n = xr(f)) : u !== 0 && (n = xr(u));
    if (n === 0) return 0;
    if (
      t !== 0 &&
      t !== n &&
      (t & o) === 0 &&
      ((o = n & -n), (u = t & -t), o >= u || (o === 16 && (u & 4194240) !== 0))
    )
      return t;
    if (((n & 4) !== 0 && (n |= r & 16), (t = e.entangledLanes), t !== 0))
      for (e = e.entanglements, t &= n; 0 < t; )
        (r = 31 - xt(t)), (o = 1 << r), (n |= e[r]), (t &= ~o);
    return n;
  }
  function a5(e, t) {
    switch (e) {
      case 1:
      case 2:
      case 4:
        return t + 250;
      case 8:
      case 16:
      case 32:
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
        return t + 5e3;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
        return -1;
      case 134217728:
      case 268435456:
      case 536870912:
      case 1073741824:
        return -1;
      default:
        return -1;
    }
  }
  function u5(e, t) {
    for (
      var r = e.suspendedLanes,
        n = e.pingedLanes,
        o = e.expirationTimes,
        u = e.pendingLanes;
      0 < u;

    ) {
      var f = 31 - xt(u),
        x = 1 << f,
        v = o[f];
      v === -1
        ? ((x & r) === 0 || (x & n) !== 0) && (o[f] = a5(x, t))
        : v <= t && (e.expiredLanes |= x),
        (u &= ~x);
    }
  }
  function Wl(e) {
    return (
      (e = e.pendingLanes & -1073741825),
      e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
    );
  }
  function _3() {
    var e = cn;
    return (cn <<= 1), (cn & 4194240) === 0 && (cn = 64), e;
  }
  function $l(e) {
    for (var t = [], r = 0; 31 > r; r++) t.push(e);
    return t;
  }
  function gr(e, t, r) {
    (e.pendingLanes |= t),
      t !== 536870912 && ((e.suspendedLanes = 0), (e.pingedLanes = 0)),
      (e = e.eventTimes),
      (t = 31 - xt(t)),
      (e[t] = r);
  }
  function c5(e, t) {
    var r = e.pendingLanes & ~t;
    (e.pendingLanes = t),
      (e.suspendedLanes = 0),
      (e.pingedLanes = 0),
      (e.expiredLanes &= t),
      (e.mutableReadLanes &= t),
      (e.entangledLanes &= t),
      (t = e.entanglements);
    var n = e.eventTimes;
    for (e = e.expirationTimes; 0 < r; ) {
      var o = 31 - xt(r),
        u = 1 << o;
      (t[o] = 0), (n[o] = -1), (e[o] = -1), (r &= ~u);
    }
  }
  function Gl(e, t) {
    var r = (e.entangledLanes |= t);
    for (e = e.entanglements; r; ) {
      var n = 31 - xt(r),
        o = 1 << n;
      (o & t) | (e[n] & t) && (e[n] |= t), (r &= ~o);
    }
  }
  var pe = 0;
  function R3(e) {
    return (
      (e &= -e),
      1 < e ? (4 < e ? ((e & 268435455) !== 0 ? 16 : 536870912) : 4) : 1
    );
  }
  var M3,
    Kl,
    P3,
    O3,
    T3,
    Ql = !1,
    mn = [],
    Ft = null,
    Vt = null,
    Ut = null,
    vr = new Map(),
    wr = new Map(),
    Ht = [],
    d5 =
      "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(
        " "
      );
  function I3(e, t) {
    switch (e) {
      case "focusin":
      case "focusout":
        Ft = null;
        break;
      case "dragenter":
      case "dragleave":
        Vt = null;
        break;
      case "mouseover":
      case "mouseout":
        Ut = null;
        break;
      case "pointerover":
      case "pointerout":
        vr.delete(t.pointerId);
        break;
      case "gotpointercapture":
      case "lostpointercapture":
        wr.delete(t.pointerId);
    }
  }
  function yr(e, t, r, n, o, u) {
    return e === null || e.nativeEvent !== u
      ? ((e = {
          blockedOn: t,
          domEventName: r,
          eventSystemFlags: n,
          nativeEvent: u,
          targetContainers: [o],
        }),
        t !== null && ((t = Tr(t)), t !== null && Kl(t)),
        e)
      : ((e.eventSystemFlags |= n),
        (t = e.targetContainers),
        o !== null && t.indexOf(o) === -1 && t.push(o),
        e);
  }
  function f5(e, t, r, n, o) {
    switch (t) {
      case "focusin":
        return (Ft = yr(Ft, e, t, r, n, o)), !0;
      case "dragenter":
        return (Vt = yr(Vt, e, t, r, n, o)), !0;
      case "mouseover":
        return (Ut = yr(Ut, e, t, r, n, o)), !0;
      case "pointerover":
        var u = o.pointerId;
        return vr.set(u, yr(vr.get(u) || null, e, t, r, n, o)), !0;
      case "gotpointercapture":
        return (
          (u = o.pointerId), wr.set(u, yr(wr.get(u) || null, e, t, r, n, o)), !0
        );
    }
    return !1;
  }
  function A3(e) {
    var t = C1(e.target);
    if (t !== null) {
      var r = h1(t);
      if (r !== null) {
        if (((t = r.tag), t === 13)) {
          if (((t = j3(r)), t !== null)) {
            (e.blockedOn = t),
              T3(e.priority, function () {
                P3(r);
              });
            return;
          }
        } else if (t === 3 && r.stateNode.current.memoizedState.isDehydrated) {
          e.blockedOn = r.tag === 3 ? r.stateNode.containerInfo : null;
          return;
        }
      }
    }
    e.blockedOn = null;
  }
  function pn(e) {
    if (e.blockedOn !== null) return !1;
    for (var t = e.targetContainers; 0 < t.length; ) {
      var r = Xl(e.domEventName, e.eventSystemFlags, t[0], e.nativeEvent);
      if (r === null) {
        r = e.nativeEvent;
        var n = new r.constructor(r.type, r);
        (Bl = n), r.target.dispatchEvent(n), (Bl = null);
      } else return (t = Tr(r)), t !== null && Kl(t), (e.blockedOn = r), !1;
      t.shift();
    }
    return !0;
  }
  function B3(e, t, r) {
    pn(e) && r.delete(t);
  }
  function m5() {
    (Ql = !1),
      Ft !== null && pn(Ft) && (Ft = null),
      Vt !== null && pn(Vt) && (Vt = null),
      Ut !== null && pn(Ut) && (Ut = null),
      vr.forEach(B3),
      wr.forEach(B3);
  }
  function jr(e, t) {
    e.blockedOn === t &&
      ((e.blockedOn = null),
      Ql ||
        ((Ql = !0),
        s.unstable_scheduleCallback(s.unstable_NormalPriority, m5)));
  }
  function Er(e) {
    function t(o) {
      return jr(o, e);
    }
    if (0 < mn.length) {
      jr(mn[0], e);
      for (var r = 1; r < mn.length; r++) {
        var n = mn[r];
        n.blockedOn === e && (n.blockedOn = null);
      }
    }
    for (
      Ft !== null && jr(Ft, e),
        Vt !== null && jr(Vt, e),
        Ut !== null && jr(Ut, e),
        vr.forEach(t),
        wr.forEach(t),
        r = 0;
      r < Ht.length;
      r++
    )
      (n = Ht[r]), n.blockedOn === e && (n.blockedOn = null);
    for (; 0 < Ht.length && ((r = Ht[0]), r.blockedOn === null); )
      A3(r), r.blockedOn === null && Ht.shift();
  }
  var I1 = F.ReactCurrentBatchConfig,
    hn = !0;
  function p5(e, t, r, n) {
    var o = pe,
      u = I1.transition;
    I1.transition = null;
    try {
      (pe = 1), Yl(e, t, r, n);
    } finally {
      (pe = o), (I1.transition = u);
    }
  }
  function h5(e, t, r, n) {
    var o = pe,
      u = I1.transition;
    I1.transition = null;
    try {
      (pe = 4), Yl(e, t, r, n);
    } finally {
      (pe = o), (I1.transition = u);
    }
  }
  function Yl(e, t, r, n) {
    if (hn) {
      var o = Xl(e, t, r, n);
      if (o === null) p2(e, t, n, Cn, r), I3(e, n);
      else if (f5(o, e, t, r, n)) n.stopPropagation();
      else if ((I3(e, n), t & 4 && -1 < d5.indexOf(e))) {
        for (; o !== null; ) {
          var u = Tr(o);
          if (
            (u !== null && M3(u),
            (u = Xl(e, t, r, n)),
            u === null && p2(e, t, n, Cn, r),
            u === o)
          )
            break;
          o = u;
        }
        o !== null && n.stopPropagation();
      } else p2(e, t, n, null, r);
    }
  }
  var Cn = null;
  function Xl(e, t, r, n) {
    if (((Cn = null), (e = zl(n)), (e = C1(e)), e !== null))
      if (((t = h1(e)), t === null)) e = null;
      else if (((r = t.tag), r === 13)) {
        if (((e = j3(t)), e !== null)) return e;
        e = null;
      } else if (r === 3) {
        if (t.stateNode.current.memoizedState.isDehydrated)
          return t.tag === 3 ? t.stateNode.containerInfo : null;
        e = null;
      } else t !== e && (e = null);
    return (Cn = e), null;
  }
  function z3(e) {
    switch (e) {
      case "cancel":
      case "click":
      case "close":
      case "contextmenu":
      case "copy":
      case "cut":
      case "auxclick":
      case "dblclick":
      case "dragend":
      case "dragstart":
      case "drop":
      case "focusin":
      case "focusout":
      case "input":
      case "invalid":
      case "keydown":
      case "keypress":
      case "keyup":
      case "mousedown":
      case "mouseup":
      case "paste":
      case "pause":
      case "play":
      case "pointercancel":
      case "pointerdown":
      case "pointerup":
      case "ratechange":
      case "reset":
      case "resize":
      case "seeked":
      case "submit":
      case "touchcancel":
      case "touchend":
      case "touchstart":
      case "volumechange":
      case "change":
      case "selectionchange":
      case "textInput":
      case "compositionstart":
      case "compositionend":
      case "compositionupdate":
      case "beforeblur":
      case "afterblur":
      case "beforeinput":
      case "blur":
      case "fullscreenchange":
      case "focus":
      case "hashchange":
      case "popstate":
      case "select":
      case "selectstart":
        return 1;
      case "drag":
      case "dragenter":
      case "dragexit":
      case "dragleave":
      case "dragover":
      case "mousemove":
      case "mouseout":
      case "mouseover":
      case "pointermove":
      case "pointerout":
      case "pointerover":
      case "scroll":
      case "toggle":
      case "touchmove":
      case "wheel":
      case "mouseenter":
      case "mouseleave":
      case "pointerenter":
      case "pointerleave":
        return 4;
      case "message":
        switch (r5()) {
          case Zl:
            return 1;
          case k3:
            return 4;
          case an:
          case n5:
            return 16;
          case D3:
            return 536870912;
          default:
            return 16;
        }
      default:
        return 16;
    }
  }
  var Zt = null,
    Jl = null,
    xn = null;
  function F3() {
    if (xn) return xn;
    var e,
      t = Jl,
      r = t.length,
      n,
      o = "value" in Zt ? Zt.value : Zt.textContent,
      u = o.length;
    for (e = 0; e < r && t[e] === o[e]; e++);
    var f = r - e;
    for (n = 1; n <= f && t[r - n] === o[u - n]; n++);
    return (xn = o.slice(e, 1 < n ? 1 - n : void 0));
  }
  function gn(e) {
    var t = e.keyCode;
    return (
      "charCode" in e
        ? ((e = e.charCode), e === 0 && t === 13 && (e = 13))
        : (e = t),
      e === 10 && (e = 13),
      32 <= e || e === 13 ? e : 0
    );
  }
  function vn() {
    return !0;
  }
  function V3() {
    return !1;
  }
  function st(e) {
    function t(r, n, o, u, f) {
      (this._reactName = r),
        (this._targetInst = o),
        (this.type = n),
        (this.nativeEvent = u),
        (this.target = f),
        (this.currentTarget = null);
      for (var x in e)
        e.hasOwnProperty(x) && ((r = e[x]), (this[x] = r ? r(u) : u[x]));
      return (
        (this.isDefaultPrevented = (
          u.defaultPrevented != null ? u.defaultPrevented : u.returnValue === !1
        )
          ? vn
          : V3),
        (this.isPropagationStopped = V3),
        this
      );
    }
    return (
      W(t.prototype, {
        preventDefault: function () {
          this.defaultPrevented = !0;
          var r = this.nativeEvent;
          r &&
            (r.preventDefault
              ? r.preventDefault()
              : typeof r.returnValue != "unknown" && (r.returnValue = !1),
            (this.isDefaultPrevented = vn));
        },
        stopPropagation: function () {
          var r = this.nativeEvent;
          r &&
            (r.stopPropagation
              ? r.stopPropagation()
              : typeof r.cancelBubble != "unknown" && (r.cancelBubble = !0),
            (this.isPropagationStopped = vn));
        },
        persist: function () {},
        isPersistent: vn,
      }),
      t
    );
  }
  var A1 = {
      eventPhase: 0,
      bubbles: 0,
      cancelable: 0,
      timeStamp: function (e) {
        return e.timeStamp || Date.now();
      },
      defaultPrevented: 0,
      isTrusted: 0,
    },
    ql = st(A1),
    Lr = W({}, A1, { view: 0, detail: 0 }),
    C5 = st(Lr),
    e2,
    t2,
    Sr,
    wn = W({}, Lr, {
      screenX: 0,
      screenY: 0,
      clientX: 0,
      clientY: 0,
      pageX: 0,
      pageY: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      getModifierState: n2,
      button: 0,
      buttons: 0,
      relatedTarget: function (e) {
        return e.relatedTarget === void 0
          ? e.fromElement === e.srcElement
            ? e.toElement
            : e.fromElement
          : e.relatedTarget;
      },
      movementX: function (e) {
        return "movementX" in e
          ? e.movementX
          : (e !== Sr &&
              (Sr && e.type === "mousemove"
                ? ((e2 = e.screenX - Sr.screenX), (t2 = e.screenY - Sr.screenY))
                : (t2 = e2 = 0),
              (Sr = e)),
            e2);
      },
      movementY: function (e) {
        return "movementY" in e ? e.movementY : t2;
      },
    }),
    U3 = st(wn),
    x5 = W({}, wn, { dataTransfer: 0 }),
    g5 = st(x5),
    v5 = W({}, Lr, { relatedTarget: 0 }),
    r2 = st(v5),
    w5 = W({}, A1, { animationName: 0, elapsedTime: 0, pseudoElement: 0 }),
    y5 = st(w5),
    j5 = W({}, A1, {
      clipboardData: function (e) {
        return "clipboardData" in e ? e.clipboardData : window.clipboardData;
      },
    }),
    E5 = st(j5),
    L5 = W({}, A1, { data: 0 }),
    H3 = st(L5),
    S5 = {
      Esc: "Escape",
      Spacebar: " ",
      Left: "ArrowLeft",
      Up: "ArrowUp",
      Right: "ArrowRight",
      Down: "ArrowDown",
      Del: "Delete",
      Win: "OS",
      Menu: "ContextMenu",
      Apps: "ContextMenu",
      Scroll: "ScrollLock",
      MozPrintableKey: "Unidentified",
    },
    N5 = {
      8: "Backspace",
      9: "Tab",
      12: "Clear",
      13: "Enter",
      16: "Shift",
      17: "Control",
      18: "Alt",
      19: "Pause",
      20: "CapsLock",
      27: "Escape",
      32: " ",
      33: "PageUp",
      34: "PageDown",
      35: "End",
      36: "Home",
      37: "ArrowLeft",
      38: "ArrowUp",
      39: "ArrowRight",
      40: "ArrowDown",
      45: "Insert",
      46: "Delete",
      112: "F1",
      113: "F2",
      114: "F3",
      115: "F4",
      116: "F5",
      117: "F6",
      118: "F7",
      119: "F8",
      120: "F9",
      121: "F10",
      122: "F11",
      123: "F12",
      144: "NumLock",
      145: "ScrollLock",
      224: "Meta",
    },
    b5 = {
      Alt: "altKey",
      Control: "ctrlKey",
      Meta: "metaKey",
      Shift: "shiftKey",
    };
  function k5(e) {
    var t = this.nativeEvent;
    return t.getModifierState
      ? t.getModifierState(e)
      : (e = b5[e])
      ? !!t[e]
      : !1;
  }
  function n2() {
    return k5;
  }
  var D5 = W({}, Lr, {
      key: function (e) {
        if (e.key) {
          var t = S5[e.key] || e.key;
          if (t !== "Unidentified") return t;
        }
        return e.type === "keypress"
          ? ((e = gn(e)), e === 13 ? "Enter" : String.fromCharCode(e))
          : e.type === "keydown" || e.type === "keyup"
          ? N5[e.keyCode] || "Unidentified"
          : "";
      },
      code: 0,
      location: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      repeat: 0,
      locale: 0,
      getModifierState: n2,
      charCode: function (e) {
        return e.type === "keypress" ? gn(e) : 0;
      },
      keyCode: function (e) {
        return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0;
      },
      which: function (e) {
        return e.type === "keypress"
          ? gn(e)
          : e.type === "keydown" || e.type === "keyup"
          ? e.keyCode
          : 0;
      },
    }),
    _5 = st(D5),
    R5 = W({}, wn, {
      pointerId: 0,
      width: 0,
      height: 0,
      pressure: 0,
      tangentialPressure: 0,
      tiltX: 0,
      tiltY: 0,
      twist: 0,
      pointerType: 0,
      isPrimary: 0,
    }),
    Z3 = st(R5),
    M5 = W({}, Lr, {
      touches: 0,
      targetTouches: 0,
      changedTouches: 0,
      altKey: 0,
      metaKey: 0,
      ctrlKey: 0,
      shiftKey: 0,
      getModifierState: n2,
    }),
    P5 = st(M5),
    O5 = W({}, A1, { propertyName: 0, elapsedTime: 0, pseudoElement: 0 }),
    T5 = st(O5),
    I5 = W({}, wn, {
      deltaX: function (e) {
        return "deltaX" in e
          ? e.deltaX
          : "wheelDeltaX" in e
          ? -e.wheelDeltaX
          : 0;
      },
      deltaY: function (e) {
        return "deltaY" in e
          ? e.deltaY
          : "wheelDeltaY" in e
          ? -e.wheelDeltaY
          : "wheelDelta" in e
          ? -e.wheelDelta
          : 0;
      },
      deltaZ: 0,
      deltaMode: 0,
    }),
    A5 = st(I5),
    B5 = [9, 13, 27, 32],
    l2 = p && "CompositionEvent" in window,
    Nr = null;
  p && "documentMode" in document && (Nr = document.documentMode);
  var z5 = p && "TextEvent" in window && !Nr,
    W3 = p && (!l2 || (Nr && 8 < Nr && 11 >= Nr)),
    $3 = " ",
    G3 = !1;
  function K3(e, t) {
    switch (e) {
      case "keyup":
        return B5.indexOf(t.keyCode) !== -1;
      case "keydown":
        return t.keyCode !== 229;
      case "keypress":
      case "mousedown":
      case "focusout":
        return !0;
      default:
        return !1;
    }
  }
  function Q3(e) {
    return (e = e.detail), typeof e == "object" && "data" in e ? e.data : null;
  }
  var B1 = !1;
  function F5(e, t) {
    switch (e) {
      case "compositionend":
        return Q3(t);
      case "keypress":
        return t.which !== 32 ? null : ((G3 = !0), $3);
      case "textInput":
        return (e = t.data), e === $3 && G3 ? null : e;
      default:
        return null;
    }
  }
  function V5(e, t) {
    if (B1)
      return e === "compositionend" || (!l2 && K3(e, t))
        ? ((e = F3()), (xn = Jl = Zt = null), (B1 = !1), e)
        : null;
    switch (e) {
      case "paste":
        return null;
      case "keypress":
        if (!(t.ctrlKey || t.altKey || t.metaKey) || (t.ctrlKey && t.altKey)) {
          if (t.char && 1 < t.char.length) return t.char;
          if (t.which) return String.fromCharCode(t.which);
        }
        return null;
      case "compositionend":
        return W3 && t.locale !== "ko" ? null : t.data;
      default:
        return null;
    }
  }
  var U5 = {
    color: !0,
    date: !0,
    datetime: !0,
    "datetime-local": !0,
    email: !0,
    month: !0,
    number: !0,
    password: !0,
    range: !0,
    search: !0,
    tel: !0,
    text: !0,
    time: !0,
    url: !0,
    week: !0,
  };
  function Y3(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t === "input" ? !!U5[e.type] : t === "textarea";
  }
  function X3(e, t, r, n) {
    x3(n),
      (t = Sn(t, "onChange")),
      0 < t.length &&
        ((r = new ql("onChange", "change", null, r, n)),
        e.push({ event: r, listeners: t }));
  }
  var br = null,
    kr = null;
  function H5(e) {
    hs(e, 0);
  }
  function yn(e) {
    var t = H1(e);
    if (i3(t)) return e;
  }
  function Z5(e, t) {
    if (e === "change") return t;
  }
  var J3 = !1;
  if (p) {
    var i2;
    if (p) {
      var s2 = "oninput" in document;
      if (!s2) {
        var q3 = document.createElement("div");
        q3.setAttribute("oninput", "return;"),
          (s2 = typeof q3.oninput == "function");
      }
      i2 = s2;
    } else i2 = !1;
    J3 = i2 && (!document.documentMode || 9 < document.documentMode);
  }
  function es() {
    br && (br.detachEvent("onpropertychange", ts), (kr = br = null));
  }
  function ts(e) {
    if (e.propertyName === "value" && yn(kr)) {
      var t = [];
      X3(t, kr, e, zl(e)), y3(H5, t);
    }
  }
  function W5(e, t, r) {
    e === "focusin"
      ? (es(), (br = t), (kr = r), br.attachEvent("onpropertychange", ts))
      : e === "focusout" && es();
  }
  function $5(e) {
    if (e === "selectionchange" || e === "keyup" || e === "keydown")
      return yn(kr);
  }
  function G5(e, t) {
    if (e === "click") return yn(t);
  }
  function K5(e, t) {
    if (e === "input" || e === "change") return yn(t);
  }
  function Q5(e, t) {
    return (e === t && (e !== 0 || 1 / e === 1 / t)) || (e !== e && t !== t);
  }
  var gt = typeof Object.is == "function" ? Object.is : Q5;
  function Dr(e, t) {
    if (gt(e, t)) return !0;
    if (
      typeof e != "object" ||
      e === null ||
      typeof t != "object" ||
      t === null
    )
      return !1;
    var r = Object.keys(e),
      n = Object.keys(t);
    if (r.length !== n.length) return !1;
    for (n = 0; n < r.length; n++) {
      var o = r[n];
      if (!y.call(t, o) || !gt(e[o], t[o])) return !1;
    }
    return !0;
  }
  function rs(e) {
    for (; e && e.firstChild; ) e = e.firstChild;
    return e;
  }
  function ns(e, t) {
    var r = rs(e);
    e = 0;
    for (var n; r; ) {
      if (r.nodeType === 3) {
        if (((n = e + r.textContent.length), e <= t && n >= t))
          return { node: r, offset: t - e };
        e = n;
      }
      e: {
        for (; r; ) {
          if (r.nextSibling) {
            r = r.nextSibling;
            break e;
          }
          r = r.parentNode;
        }
        r = void 0;
      }
      r = rs(r);
    }
  }
  function ls(e, t) {
    return e && t
      ? e === t
        ? !0
        : e && e.nodeType === 3
        ? !1
        : t && t.nodeType === 3
        ? ls(e, t.parentNode)
        : "contains" in e
        ? e.contains(t)
        : e.compareDocumentPosition
        ? !!(e.compareDocumentPosition(t) & 16)
        : !1
      : !1;
  }
  function is() {
    for (var e = window, t = nn(); t instanceof e.HTMLIFrameElement; ) {
      try {
        var r = typeof t.contentWindow.location.href == "string";
      } catch {
        r = !1;
      }
      if (r) e = t.contentWindow;
      else break;
      t = nn(e.document);
    }
    return t;
  }
  function o2(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return (
      t &&
      ((t === "input" &&
        (e.type === "text" ||
          e.type === "search" ||
          e.type === "tel" ||
          e.type === "url" ||
          e.type === "password")) ||
        t === "textarea" ||
        e.contentEditable === "true")
    );
  }
  function Y5(e) {
    var t = is(),
      r = e.focusedElem,
      n = e.selectionRange;
    if (
      t !== r &&
      r &&
      r.ownerDocument &&
      ls(r.ownerDocument.documentElement, r)
    ) {
      if (n !== null && o2(r)) {
        if (
          ((t = n.start),
          (e = n.end),
          e === void 0 && (e = t),
          "selectionStart" in r)
        )
          (r.selectionStart = t),
            (r.selectionEnd = Math.min(e, r.value.length));
        else if (
          ((e = ((t = r.ownerDocument || document) && t.defaultView) || window),
          e.getSelection)
        ) {
          e = e.getSelection();
          var o = r.textContent.length,
            u = Math.min(n.start, o);
          (n = n.end === void 0 ? u : Math.min(n.end, o)),
            !e.extend && u > n && ((o = n), (n = u), (u = o)),
            (o = ns(r, u));
          var f = ns(r, n);
          o &&
            f &&
            (e.rangeCount !== 1 ||
              e.anchorNode !== o.node ||
              e.anchorOffset !== o.offset ||
              e.focusNode !== f.node ||
              e.focusOffset !== f.offset) &&
            ((t = t.createRange()),
            t.setStart(o.node, o.offset),
            e.removeAllRanges(),
            u > n
              ? (e.addRange(t), e.extend(f.node, f.offset))
              : (t.setEnd(f.node, f.offset), e.addRange(t)));
        }
      }
      for (t = [], e = r; (e = e.parentNode); )
        e.nodeType === 1 &&
          t.push({ element: e, left: e.scrollLeft, top: e.scrollTop });
      for (typeof r.focus == "function" && r.focus(), r = 0; r < t.length; r++)
        (e = t[r]),
          (e.element.scrollLeft = e.left),
          (e.element.scrollTop = e.top);
    }
  }
  var X5 = p && "documentMode" in document && 11 >= document.documentMode,
    z1 = null,
    a2 = null,
    _r = null,
    u2 = !1;
  function ss(e, t, r) {
    var n =
      r.window === r ? r.document : r.nodeType === 9 ? r : r.ownerDocument;
    u2 ||
      z1 == null ||
      z1 !== nn(n) ||
      ((n = z1),
      "selectionStart" in n && o2(n)
        ? (n = { start: n.selectionStart, end: n.selectionEnd })
        : ((n = (
            (n.ownerDocument && n.ownerDocument.defaultView) ||
            window
          ).getSelection()),
          (n = {
            anchorNode: n.anchorNode,
            anchorOffset: n.anchorOffset,
            focusNode: n.focusNode,
            focusOffset: n.focusOffset,
          })),
      (_r && Dr(_r, n)) ||
        ((_r = n),
        (n = Sn(a2, "onSelect")),
        0 < n.length &&
          ((t = new ql("onSelect", "select", null, t, r)),
          e.push({ event: t, listeners: n }),
          (t.target = z1))));
  }
  function jn(e, t) {
    var r = {};
    return (
      (r[e.toLowerCase()] = t.toLowerCase()),
      (r["Webkit" + e] = "webkit" + t),
      (r["Moz" + e] = "moz" + t),
      r
    );
  }
  var F1 = {
      animationend: jn("Animation", "AnimationEnd"),
      animationiteration: jn("Animation", "AnimationIteration"),
      animationstart: jn("Animation", "AnimationStart"),
      transitionend: jn("Transition", "TransitionEnd"),
    },
    c2 = {},
    os = {};
  p &&
    ((os = document.createElement("div").style),
    "AnimationEvent" in window ||
      (delete F1.animationend.animation,
      delete F1.animationiteration.animation,
      delete F1.animationstart.animation),
    "TransitionEvent" in window || delete F1.transitionend.transition);
  function En(e) {
    if (c2[e]) return c2[e];
    if (!F1[e]) return e;
    var t = F1[e],
      r;
    for (r in t) if (t.hasOwnProperty(r) && r in os) return (c2[e] = t[r]);
    return e;
  }
  var as = En("animationend"),
    us = En("animationiteration"),
    cs = En("animationstart"),
    ds = En("transitionend"),
    fs = new Map(),
    ms =
      "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(
        " "
      );
  function Wt(e, t) {
    fs.set(e, t), m(t, [e]);
  }
  for (var d2 = 0; d2 < ms.length; d2++) {
    var f2 = ms[d2],
      J5 = f2.toLowerCase(),
      q5 = f2[0].toUpperCase() + f2.slice(1);
    Wt(J5, "on" + q5);
  }
  Wt(as, "onAnimationEnd"),
    Wt(us, "onAnimationIteration"),
    Wt(cs, "onAnimationStart"),
    Wt("dblclick", "onDoubleClick"),
    Wt("focusin", "onFocus"),
    Wt("focusout", "onBlur"),
    Wt(ds, "onTransitionEnd"),
    h("onMouseEnter", ["mouseout", "mouseover"]),
    h("onMouseLeave", ["mouseout", "mouseover"]),
    h("onPointerEnter", ["pointerout", "pointerover"]),
    h("onPointerLeave", ["pointerout", "pointerover"]),
    m(
      "onChange",
      "change click focusin focusout input keydown keyup selectionchange".split(
        " "
      )
    ),
    m(
      "onSelect",
      "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(
        " "
      )
    ),
    m("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]),
    m(
      "onCompositionEnd",
      "compositionend focusout keydown keypress keyup mousedown".split(" ")
    ),
    m(
      "onCompositionStart",
      "compositionstart focusout keydown keypress keyup mousedown".split(" ")
    ),
    m(
      "onCompositionUpdate",
      "compositionupdate focusout keydown keypress keyup mousedown".split(" ")
    );
  var Rr =
      "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(
        " "
      ),
    e4 = new Set(
      "cancel close invalid load scroll toggle".split(" ").concat(Rr)
    );
  function ps(e, t, r) {
    var n = e.type || "unknown-event";
    (e.currentTarget = r), Ja(n, t, void 0, e), (e.currentTarget = null);
  }
  function hs(e, t) {
    t = (t & 4) !== 0;
    for (var r = 0; r < e.length; r++) {
      var n = e[r],
        o = n.event;
      n = n.listeners;
      e: {
        var u = void 0;
        if (t)
          for (var f = n.length - 1; 0 <= f; f--) {
            var x = n[f],
              v = x.instance,
              D = x.currentTarget;
            if (((x = x.listener), v !== u && o.isPropagationStopped()))
              break e;
            ps(o, x, D), (u = v);
          }
        else
          for (f = 0; f < n.length; f++) {
            if (
              ((x = n[f]),
              (v = x.instance),
              (D = x.currentTarget),
              (x = x.listener),
              v !== u && o.isPropagationStopped())
            )
              break e;
            ps(o, x, D), (u = v);
          }
      }
    }
    if (on) throw ((e = Hl), (on = !1), (Hl = null), e);
  }
  function ge(e, t) {
    var r = t[w2];
    r === void 0 && (r = t[w2] = new Set());
    var n = e + "__bubble";
    r.has(n) || (Cs(t, e, 2, !1), r.add(n));
  }
  function m2(e, t, r) {
    var n = 0;
    t && (n |= 4), Cs(r, e, n, t);
  }
  var Ln = "_reactListening" + Math.random().toString(36).slice(2);
  function Mr(e) {
    if (!e[Ln]) {
      (e[Ln] = !0),
        c.forEach(function (r) {
          r !== "selectionchange" && (e4.has(r) || m2(r, !1, e), m2(r, !0, e));
        });
      var t = e.nodeType === 9 ? e : e.ownerDocument;
      t === null || t[Ln] || ((t[Ln] = !0), m2("selectionchange", !1, t));
    }
  }
  function Cs(e, t, r, n) {
    switch (z3(t)) {
      case 1:
        var o = p5;
        break;
      case 4:
        o = h5;
        break;
      default:
        o = Yl;
    }
    (r = o.bind(null, t, r, e)),
      (o = void 0),
      !Ul ||
        (t !== "touchstart" && t !== "touchmove" && t !== "wheel") ||
        (o = !0),
      n
        ? o !== void 0
          ? e.addEventListener(t, r, { capture: !0, passive: o })
          : e.addEventListener(t, r, !0)
        : o !== void 0
        ? e.addEventListener(t, r, { passive: o })
        : e.addEventListener(t, r, !1);
  }
  function p2(e, t, r, n, o) {
    var u = n;
    if ((t & 1) === 0 && (t & 2) === 0 && n !== null)
      e: for (;;) {
        if (n === null) return;
        var f = n.tag;
        if (f === 3 || f === 4) {
          var x = n.stateNode.containerInfo;
          if (x === o || (x.nodeType === 8 && x.parentNode === o)) break;
          if (f === 4)
            for (f = n.return; f !== null; ) {
              var v = f.tag;
              if (
                (v === 3 || v === 4) &&
                ((v = f.stateNode.containerInfo),
                v === o || (v.nodeType === 8 && v.parentNode === o))
              )
                return;
              f = f.return;
            }
          for (; x !== null; ) {
            if (((f = C1(x)), f === null)) return;
            if (((v = f.tag), v === 5 || v === 6)) {
              n = u = f;
              continue e;
            }
            x = x.parentNode;
          }
        }
        n = n.return;
      }
    y3(function () {
      var D = u,
        I = zl(r),
        A = [];
      e: {
        var O = fs.get(e);
        if (O !== void 0) {
          var U = ql,
            $ = e;
          switch (e) {
            case "keypress":
              if (gn(r) === 0) break e;
            case "keydown":
            case "keyup":
              U = _5;
              break;
            case "focusin":
              ($ = "focus"), (U = r2);
              break;
            case "focusout":
              ($ = "blur"), (U = r2);
              break;
            case "beforeblur":
            case "afterblur":
              U = r2;
              break;
            case "click":
              if (r.button === 2) break e;
            case "auxclick":
            case "dblclick":
            case "mousedown":
            case "mousemove":
            case "mouseup":
            case "mouseout":
            case "mouseover":
            case "contextmenu":
              U = U3;
              break;
            case "drag":
            case "dragend":
            case "dragenter":
            case "dragexit":
            case "dragleave":
            case "dragover":
            case "dragstart":
            case "drop":
              U = g5;
              break;
            case "touchcancel":
            case "touchend":
            case "touchmove":
            case "touchstart":
              U = P5;
              break;
            case as:
            case us:
            case cs:
              U = y5;
              break;
            case ds:
              U = T5;
              break;
            case "scroll":
              U = C5;
              break;
            case "wheel":
              U = A5;
              break;
            case "copy":
            case "cut":
            case "paste":
              U = E5;
              break;
            case "gotpointercapture":
            case "lostpointercapture":
            case "pointercancel":
            case "pointerdown":
            case "pointermove":
            case "pointerout":
            case "pointerover":
            case "pointerup":
              U = Z3;
          }
          var G = (t & 4) !== 0,
            De = !G && e === "scroll",
            N = G ? (O !== null ? O + "Capture" : null) : O;
          G = [];
          for (var j = D, k; j !== null; ) {
            k = j;
            var B = k.stateNode;
            if (
              (k.tag === 5 &&
                B !== null &&
                ((k = B),
                N !== null &&
                  ((B = pr(j, N)), B != null && G.push(Pr(j, B, k)))),
              De)
            )
              break;
            j = j.return;
          }
          0 < G.length &&
            ((O = new U(O, $, null, r, I)), A.push({ event: O, listeners: G }));
        }
      }
      if ((t & 7) === 0) {
        e: {
          if (
            ((O = e === "mouseover" || e === "pointerover"),
            (U = e === "mouseout" || e === "pointerout"),
            O &&
              r !== Bl &&
              ($ = r.relatedTarget || r.fromElement) &&
              (C1($) || $[Mt]))
          )
            break e;
          if (
            (U || O) &&
            ((O =
              I.window === I
                ? I
                : (O = I.ownerDocument)
                ? O.defaultView || O.parentWindow
                : window),
            U
              ? (($ = r.relatedTarget || r.toElement),
                (U = D),
                ($ = $ ? C1($) : null),
                $ !== null &&
                  ((De = h1($)), $ !== De || ($.tag !== 5 && $.tag !== 6)) &&
                  ($ = null))
              : ((U = null), ($ = D)),
            U !== $)
          ) {
            if (
              ((G = U3),
              (B = "onMouseLeave"),
              (N = "onMouseEnter"),
              (j = "mouse"),
              (e === "pointerout" || e === "pointerover") &&
                ((G = Z3),
                (B = "onPointerLeave"),
                (N = "onPointerEnter"),
                (j = "pointer")),
              (De = U == null ? O : H1(U)),
              (k = $ == null ? O : H1($)),
              (O = new G(B, j + "leave", U, r, I)),
              (O.target = De),
              (O.relatedTarget = k),
              (B = null),
              C1(I) === D &&
                ((G = new G(N, j + "enter", $, r, I)),
                (G.target = k),
                (G.relatedTarget = De),
                (B = G)),
              (De = B),
              U && $)
            )
              t: {
                for (G = U, N = $, j = 0, k = G; k; k = V1(k)) j++;
                for (k = 0, B = N; B; B = V1(B)) k++;
                for (; 0 < j - k; ) (G = V1(G)), j--;
                for (; 0 < k - j; ) (N = V1(N)), k--;
                for (; j--; ) {
                  if (G === N || (N !== null && G === N.alternate)) break t;
                  (G = V1(G)), (N = V1(N));
                }
                G = null;
              }
            else G = null;
            U !== null && xs(A, O, U, G, !1),
              $ !== null && De !== null && xs(A, De, $, G, !0);
          }
        }
        e: {
          if (
            ((O = D ? H1(D) : window),
            (U = O.nodeName && O.nodeName.toLowerCase()),
            U === "select" || (U === "input" && O.type === "file"))
          )
            var K = Z5;
          else if (Y3(O))
            if (J3) K = K5;
            else {
              K = $5;
              var J = W5;
            }
          else
            (U = O.nodeName) &&
              U.toLowerCase() === "input" &&
              (O.type === "checkbox" || O.type === "radio") &&
              (K = G5);
          if (K && (K = K(e, D))) {
            X3(A, K, r, I);
            break e;
          }
          J && J(e, O, D),
            e === "focusout" &&
              (J = O._wrapperState) &&
              J.controlled &&
              O.type === "number" &&
              Pl(O, "number", O.value);
        }
        switch (((J = D ? H1(D) : window), e)) {
          case "focusin":
            (Y3(J) || J.contentEditable === "true") &&
              ((z1 = J), (a2 = D), (_r = null));
            break;
          case "focusout":
            _r = a2 = z1 = null;
            break;
          case "mousedown":
            u2 = !0;
            break;
          case "contextmenu":
          case "mouseup":
          case "dragend":
            (u2 = !1), ss(A, r, I);
            break;
          case "selectionchange":
            if (X5) break;
          case "keydown":
          case "keyup":
            ss(A, r, I);
        }
        var q;
        if (l2)
          e: {
            switch (e) {
              case "compositionstart":
                var te = "onCompositionStart";
                break e;
              case "compositionend":
                te = "onCompositionEnd";
                break e;
              case "compositionupdate":
                te = "onCompositionUpdate";
                break e;
            }
            te = void 0;
          }
        else
          B1
            ? K3(e, r) && (te = "onCompositionEnd")
            : e === "keydown" &&
              r.keyCode === 229 &&
              (te = "onCompositionStart");
        te &&
          (W3 &&
            r.locale !== "ko" &&
            (B1 || te !== "onCompositionStart"
              ? te === "onCompositionEnd" && B1 && (q = F3())
              : ((Zt = I),
                (Jl = "value" in Zt ? Zt.value : Zt.textContent),
                (B1 = !0))),
          (J = Sn(D, te)),
          0 < J.length &&
            ((te = new H3(te, e, null, r, I)),
            A.push({ event: te, listeners: J }),
            q ? (te.data = q) : ((q = Q3(r)), q !== null && (te.data = q)))),
          (q = z5 ? F5(e, r) : V5(e, r)) &&
            ((D = Sn(D, "onBeforeInput")),
            0 < D.length &&
              ((I = new H3("onBeforeInput", "beforeinput", null, r, I)),
              A.push({ event: I, listeners: D }),
              (I.data = q)));
      }
      hs(A, t);
    });
  }
  function Pr(e, t, r) {
    return { instance: e, listener: t, currentTarget: r };
  }
  function Sn(e, t) {
    for (var r = t + "Capture", n = []; e !== null; ) {
      var o = e,
        u = o.stateNode;
      o.tag === 5 &&
        u !== null &&
        ((o = u),
        (u = pr(e, r)),
        u != null && n.unshift(Pr(e, u, o)),
        (u = pr(e, t)),
        u != null && n.push(Pr(e, u, o))),
        (e = e.return);
    }
    return n;
  }
  function V1(e) {
    if (e === null) return null;
    do e = e.return;
    while (e && e.tag !== 5);
    return e || null;
  }
  function xs(e, t, r, n, o) {
    for (var u = t._reactName, f = []; r !== null && r !== n; ) {
      var x = r,
        v = x.alternate,
        D = x.stateNode;
      if (v !== null && v === n) break;
      x.tag === 5 &&
        D !== null &&
        ((x = D),
        o
          ? ((v = pr(r, u)), v != null && f.unshift(Pr(r, v, x)))
          : o || ((v = pr(r, u)), v != null && f.push(Pr(r, v, x)))),
        (r = r.return);
    }
    f.length !== 0 && e.push({ event: t, listeners: f });
  }
  var t4 = /\r\n?/g,
    r4 = /\u0000|\uFFFD/g;
  function gs(e) {
    return (typeof e == "string" ? e : "" + e)
      .replace(
        t4,
        `
`
      )
      .replace(r4, "");
  }
  function Nn(e, t, r) {
    if (((t = gs(t)), gs(e) !== t && r)) throw Error(a(425));
  }
  function bn() {}
  var h2 = null,
    C2 = null;
  function x2(e, t) {
    return (
      e === "textarea" ||
      e === "noscript" ||
      typeof t.children == "string" ||
      typeof t.children == "number" ||
      (typeof t.dangerouslySetInnerHTML == "object" &&
        t.dangerouslySetInnerHTML !== null &&
        t.dangerouslySetInnerHTML.__html != null)
    );
  }
  var g2 = typeof setTimeout == "function" ? setTimeout : void 0,
    n4 = typeof clearTimeout == "function" ? clearTimeout : void 0,
    vs = typeof Promise == "function" ? Promise : void 0,
    l4 =
      typeof queueMicrotask == "function"
        ? queueMicrotask
        : typeof vs < "u"
        ? function (e) {
            return vs.resolve(null).then(e).catch(i4);
          }
        : g2;
  function i4(e) {
    setTimeout(function () {
      throw e;
    });
  }
  function v2(e, t) {
    var r = t,
      n = 0;
    do {
      var o = r.nextSibling;
      if ((e.removeChild(r), o && o.nodeType === 8))
        if (((r = o.data), r === "/$")) {
          if (n === 0) {
            e.removeChild(o), Er(t);
            return;
          }
          n--;
        } else (r !== "$" && r !== "$?" && r !== "$!") || n++;
      r = o;
    } while (r);
    Er(t);
  }
  function $t(e) {
    for (; e != null; e = e.nextSibling) {
      var t = e.nodeType;
      if (t === 1 || t === 3) break;
      if (t === 8) {
        if (((t = e.data), t === "$" || t === "$!" || t === "$?")) break;
        if (t === "/$") return null;
      }
    }
    return e;
  }
  function ws(e) {
    e = e.previousSibling;
    for (var t = 0; e; ) {
      if (e.nodeType === 8) {
        var r = e.data;
        if (r === "$" || r === "$!" || r === "$?") {
          if (t === 0) return e;
          t--;
        } else r === "/$" && t++;
      }
      e = e.previousSibling;
    }
    return null;
  }
  var U1 = Math.random().toString(36).slice(2),
    Nt = "__reactFiber$" + U1,
    Or = "__reactProps$" + U1,
    Mt = "__reactContainer$" + U1,
    w2 = "__reactEvents$" + U1,
    s4 = "__reactListeners$" + U1,
    o4 = "__reactHandles$" + U1;
  function C1(e) {
    var t = e[Nt];
    if (t) return t;
    for (var r = e.parentNode; r; ) {
      if ((t = r[Mt] || r[Nt])) {
        if (
          ((r = t.alternate),
          t.child !== null || (r !== null && r.child !== null))
        )
          for (e = ws(e); e !== null; ) {
            if ((r = e[Nt])) return r;
            e = ws(e);
          }
        return t;
      }
      (e = r), (r = e.parentNode);
    }
    return null;
  }
  function Tr(e) {
    return (
      (e = e[Nt] || e[Mt]),
      !e || (e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3)
        ? null
        : e
    );
  }
  function H1(e) {
    if (e.tag === 5 || e.tag === 6) return e.stateNode;
    throw Error(a(33));
  }
  function kn(e) {
    return e[Or] || null;
  }
  var y2 = [],
    Z1 = -1;
  function Gt(e) {
    return { current: e };
  }
  function ve(e) {
    0 > Z1 || ((e.current = y2[Z1]), (y2[Z1] = null), Z1--);
  }
  function Ce(e, t) {
    Z1++, (y2[Z1] = e.current), (e.current = t);
  }
  var Kt = {},
    Ze = Gt(Kt),
    Xe = Gt(!1),
    x1 = Kt;
  function W1(e, t) {
    var r = e.type.contextTypes;
    if (!r) return Kt;
    var n = e.stateNode;
    if (n && n.__reactInternalMemoizedUnmaskedChildContext === t)
      return n.__reactInternalMemoizedMaskedChildContext;
    var o = {},
      u;
    for (u in r) o[u] = t[u];
    return (
      n &&
        ((e = e.stateNode),
        (e.__reactInternalMemoizedUnmaskedChildContext = t),
        (e.__reactInternalMemoizedMaskedChildContext = o)),
      o
    );
  }
  function Je(e) {
    return (e = e.childContextTypes), e != null;
  }
  function Dn() {
    ve(Xe), ve(Ze);
  }
  function ys(e, t, r) {
    if (Ze.current !== Kt) throw Error(a(168));
    Ce(Ze, t), Ce(Xe, r);
  }
  function js(e, t, r) {
    var n = e.stateNode;
    if (((t = t.childContextTypes), typeof n.getChildContext != "function"))
      return r;
    n = n.getChildContext();
    for (var o in n) if (!(o in t)) throw Error(a(108, he(e) || "Unknown", o));
    return W({}, r, n);
  }
  function _n(e) {
    return (
      (e =
        ((e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext) ||
        Kt),
      (x1 = Ze.current),
      Ce(Ze, e),
      Ce(Xe, Xe.current),
      !0
    );
  }
  function Es(e, t, r) {
    var n = e.stateNode;
    if (!n) throw Error(a(169));
    r
      ? ((e = js(e, t, x1)),
        (n.__reactInternalMemoizedMergedChildContext = e),
        ve(Xe),
        ve(Ze),
        Ce(Ze, e))
      : ve(Xe),
      Ce(Xe, r);
  }
  var Pt = null,
    Rn = !1,
    j2 = !1;
  function Ls(e) {
    Pt === null ? (Pt = [e]) : Pt.push(e);
  }
  function a4(e) {
    (Rn = !0), Ls(e);
  }
  function Qt() {
    if (!j2 && Pt !== null) {
      j2 = !0;
      var e = 0,
        t = pe;
      try {
        var r = Pt;
        for (pe = 1; e < r.length; e++) {
          var n = r[e];
          do n = n(!0);
          while (n !== null);
        }
        (Pt = null), (Rn = !1);
      } catch (o) {
        throw (Pt !== null && (Pt = Pt.slice(e + 1)), N3(Zl, Qt), o);
      } finally {
        (pe = t), (j2 = !1);
      }
    }
    return null;
  }
  var $1 = [],
    G1 = 0,
    Mn = null,
    Pn = 0,
    dt = [],
    ft = 0,
    g1 = null,
    Ot = 1,
    Tt = "";
  function v1(e, t) {
    ($1[G1++] = Pn), ($1[G1++] = Mn), (Mn = e), (Pn = t);
  }
  function Ss(e, t, r) {
    (dt[ft++] = Ot), (dt[ft++] = Tt), (dt[ft++] = g1), (g1 = e);
    var n = Ot;
    e = Tt;
    var o = 32 - xt(n) - 1;
    (n &= ~(1 << o)), (r += 1);
    var u = 32 - xt(t) + o;
    if (30 < u) {
      var f = o - (o % 5);
      (u = (n & ((1 << f) - 1)).toString(32)),
        (n >>= f),
        (o -= f),
        (Ot = (1 << (32 - xt(t) + o)) | (r << o) | n),
        (Tt = u + e);
    } else (Ot = (1 << u) | (r << o) | n), (Tt = e);
  }
  function E2(e) {
    e.return !== null && (v1(e, 1), Ss(e, 1, 0));
  }
  function L2(e) {
    for (; e === Mn; )
      (Mn = $1[--G1]), ($1[G1] = null), (Pn = $1[--G1]), ($1[G1] = null);
    for (; e === g1; )
      (g1 = dt[--ft]),
        (dt[ft] = null),
        (Tt = dt[--ft]),
        (dt[ft] = null),
        (Ot = dt[--ft]),
        (dt[ft] = null);
  }
  var ot = null,
    at = null,
    ye = !1,
    vt = null;
  function Ns(e, t) {
    var r = Ct(5, null, null, 0);
    (r.elementType = "DELETED"),
      (r.stateNode = t),
      (r.return = e),
      (t = e.deletions),
      t === null ? ((e.deletions = [r]), (e.flags |= 16)) : t.push(r);
  }
  function bs(e, t) {
    switch (e.tag) {
      case 5:
        var r = e.type;
        return (
          (t =
            t.nodeType !== 1 || r.toLowerCase() !== t.nodeName.toLowerCase()
              ? null
              : t),
          t !== null
            ? ((e.stateNode = t), (ot = e), (at = $t(t.firstChild)), !0)
            : !1
        );
      case 6:
        return (
          (t = e.pendingProps === "" || t.nodeType !== 3 ? null : t),
          t !== null ? ((e.stateNode = t), (ot = e), (at = null), !0) : !1
        );
      case 13:
        return (
          (t = t.nodeType !== 8 ? null : t),
          t !== null
            ? ((r = g1 !== null ? { id: Ot, overflow: Tt } : null),
              (e.memoizedState = {
                dehydrated: t,
                treeContext: r,
                retryLane: 1073741824,
              }),
              (r = Ct(18, null, null, 0)),
              (r.stateNode = t),
              (r.return = e),
              (e.child = r),
              (ot = e),
              (at = null),
              !0)
            : !1
        );
      default:
        return !1;
    }
  }
  function S2(e) {
    return (e.mode & 1) !== 0 && (e.flags & 128) === 0;
  }
  function N2(e) {
    if (ye) {
      var t = at;
      if (t) {
        var r = t;
        if (!bs(e, t)) {
          if (S2(e)) throw Error(a(418));
          t = $t(r.nextSibling);
          var n = ot;
          t && bs(e, t)
            ? Ns(n, r)
            : ((e.flags = (e.flags & -4097) | 2), (ye = !1), (ot = e));
        }
      } else {
        if (S2(e)) throw Error(a(418));
        (e.flags = (e.flags & -4097) | 2), (ye = !1), (ot = e);
      }
    }
  }
  function ks(e) {
    for (
      e = e.return;
      e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13;

    )
      e = e.return;
    ot = e;
  }
  function On(e) {
    if (e !== ot) return !1;
    if (!ye) return ks(e), (ye = !0), !1;
    var t;
    if (
      ((t = e.tag !== 3) &&
        !(t = e.tag !== 5) &&
        ((t = e.type),
        (t = t !== "head" && t !== "body" && !x2(e.type, e.memoizedProps))),
      t && (t = at))
    ) {
      if (S2(e)) throw (Ds(), Error(a(418)));
      for (; t; ) Ns(e, t), (t = $t(t.nextSibling));
    }
    if ((ks(e), e.tag === 13)) {
      if (((e = e.memoizedState), (e = e !== null ? e.dehydrated : null), !e))
        throw Error(a(317));
      e: {
        for (e = e.nextSibling, t = 0; e; ) {
          if (e.nodeType === 8) {
            var r = e.data;
            if (r === "/$") {
              if (t === 0) {
                at = $t(e.nextSibling);
                break e;
              }
              t--;
            } else (r !== "$" && r !== "$!" && r !== "$?") || t++;
          }
          e = e.nextSibling;
        }
        at = null;
      }
    } else at = ot ? $t(e.stateNode.nextSibling) : null;
    return !0;
  }
  function Ds() {
    for (var e = at; e; ) e = $t(e.nextSibling);
  }
  function K1() {
    (at = ot = null), (ye = !1);
  }
  function b2(e) {
    vt === null ? (vt = [e]) : vt.push(e);
  }
  var u4 = F.ReactCurrentBatchConfig;
  function Ir(e, t, r) {
    if (
      ((e = r.ref),
      e !== null && typeof e != "function" && typeof e != "object")
    ) {
      if (r._owner) {
        if (((r = r._owner), r)) {
          if (r.tag !== 1) throw Error(a(309));
          var n = r.stateNode;
        }
        if (!n) throw Error(a(147, e));
        var o = n,
          u = "" + e;
        return t !== null &&
          t.ref !== null &&
          typeof t.ref == "function" &&
          t.ref._stringRef === u
          ? t.ref
          : ((t = function (f) {
              var x = o.refs;
              f === null ? delete x[u] : (x[u] = f);
            }),
            (t._stringRef = u),
            t);
      }
      if (typeof e != "string") throw Error(a(284));
      if (!r._owner) throw Error(a(290, e));
    }
    return e;
  }
  function Tn(e, t) {
    throw (
      ((e = Object.prototype.toString.call(t)),
      Error(
        a(
          31,
          e === "[object Object]"
            ? "object with keys {" + Object.keys(t).join(", ") + "}"
            : e
        )
      ))
    );
  }
  function _s(e) {
    var t = e._init;
    return t(e._payload);
  }
  function Rs(e) {
    function t(N, j) {
      if (e) {
        var k = N.deletions;
        k === null ? ((N.deletions = [j]), (N.flags |= 16)) : k.push(j);
      }
    }
    function r(N, j) {
      if (!e) return null;
      for (; j !== null; ) t(N, j), (j = j.sibling);
      return null;
    }
    function n(N, j) {
      for (N = new Map(); j !== null; )
        j.key !== null ? N.set(j.key, j) : N.set(j.index, j), (j = j.sibling);
      return N;
    }
    function o(N, j) {
      return (N = n1(N, j)), (N.index = 0), (N.sibling = null), N;
    }
    function u(N, j, k) {
      return (
        (N.index = k),
        e
          ? ((k = N.alternate),
            k !== null
              ? ((k = k.index), k < j ? ((N.flags |= 2), j) : k)
              : ((N.flags |= 2), j))
          : ((N.flags |= 1048576), j)
      );
    }
    function f(N) {
      return e && N.alternate === null && (N.flags |= 2), N;
    }
    function x(N, j, k, B) {
      return j === null || j.tag !== 6
        ? ((j = gi(k, N.mode, B)), (j.return = N), j)
        : ((j = o(j, k)), (j.return = N), j);
    }
    function v(N, j, k, B) {
      var K = k.type;
      return K === Y
        ? I(N, j, k.props.children, B, k.key)
        : j !== null &&
          (j.elementType === K ||
            (typeof K == "object" &&
              K !== null &&
              K.$$typeof === je &&
              _s(K) === j.type))
        ? ((B = o(j, k.props)), (B.ref = Ir(N, j, k)), (B.return = N), B)
        : ((B = il(k.type, k.key, k.props, null, N.mode, B)),
          (B.ref = Ir(N, j, k)),
          (B.return = N),
          B);
    }
    function D(N, j, k, B) {
      return j === null ||
        j.tag !== 4 ||
        j.stateNode.containerInfo !== k.containerInfo ||
        j.stateNode.implementation !== k.implementation
        ? ((j = vi(k, N.mode, B)), (j.return = N), j)
        : ((j = o(j, k.children || [])), (j.return = N), j);
    }
    function I(N, j, k, B, K) {
      return j === null || j.tag !== 7
        ? ((j = b1(k, N.mode, B, K)), (j.return = N), j)
        : ((j = o(j, k)), (j.return = N), j);
    }
    function A(N, j, k) {
      if ((typeof j == "string" && j !== "") || typeof j == "number")
        return (j = gi("" + j, N.mode, k)), (j.return = N), j;
      if (typeof j == "object" && j !== null) {
        switch (j.$$typeof) {
          case ee:
            return (
              (k = il(j.type, j.key, j.props, null, N.mode, k)),
              (k.ref = Ir(N, null, j)),
              (k.return = N),
              k
            );
          case re:
            return (j = vi(j, N.mode, k)), (j.return = N), j;
          case je:
            var B = j._init;
            return A(N, B(j._payload), k);
        }
        if (dr(j) || X(j))
          return (j = b1(j, N.mode, k, null)), (j.return = N), j;
        Tn(N, j);
      }
      return null;
    }
    function O(N, j, k, B) {
      var K = j !== null ? j.key : null;
      if ((typeof k == "string" && k !== "") || typeof k == "number")
        return K !== null ? null : x(N, j, "" + k, B);
      if (typeof k == "object" && k !== null) {
        switch (k.$$typeof) {
          case ee:
            return k.key === K ? v(N, j, k, B) : null;
          case re:
            return k.key === K ? D(N, j, k, B) : null;
          case je:
            return (K = k._init), O(N, j, K(k._payload), B);
        }
        if (dr(k) || X(k)) return K !== null ? null : I(N, j, k, B, null);
        Tn(N, k);
      }
      return null;
    }
    function U(N, j, k, B, K) {
      if ((typeof B == "string" && B !== "") || typeof B == "number")
        return (N = N.get(k) || null), x(j, N, "" + B, K);
      if (typeof B == "object" && B !== null) {
        switch (B.$$typeof) {
          case ee:
            return (
              (N = N.get(B.key === null ? k : B.key) || null), v(j, N, B, K)
            );
          case re:
            return (
              (N = N.get(B.key === null ? k : B.key) || null), D(j, N, B, K)
            );
          case je:
            var J = B._init;
            return U(N, j, k, J(B._payload), K);
        }
        if (dr(B) || X(B)) return (N = N.get(k) || null), I(j, N, B, K, null);
        Tn(j, B);
      }
      return null;
    }
    function $(N, j, k, B) {
      for (
        var K = null, J = null, q = j, te = (j = 0), ze = null;
        q !== null && te < k.length;
        te++
      ) {
        q.index > te ? ((ze = q), (q = null)) : (ze = q.sibling);
        var ce = O(N, q, k[te], B);
        if (ce === null) {
          q === null && (q = ze);
          break;
        }
        e && q && ce.alternate === null && t(N, q),
          (j = u(ce, j, te)),
          J === null ? (K = ce) : (J.sibling = ce),
          (J = ce),
          (q = ze);
      }
      if (te === k.length) return r(N, q), ye && v1(N, te), K;
      if (q === null) {
        for (; te < k.length; te++)
          (q = A(N, k[te], B)),
            q !== null &&
              ((j = u(q, j, te)),
              J === null ? (K = q) : (J.sibling = q),
              (J = q));
        return ye && v1(N, te), K;
      }
      for (q = n(N, q); te < k.length; te++)
        (ze = U(q, N, te, k[te], B)),
          ze !== null &&
            (e &&
              ze.alternate !== null &&
              q.delete(ze.key === null ? te : ze.key),
            (j = u(ze, j, te)),
            J === null ? (K = ze) : (J.sibling = ze),
            (J = ze));
      return (
        e &&
          q.forEach(function (l1) {
            return t(N, l1);
          }),
        ye && v1(N, te),
        K
      );
    }
    function G(N, j, k, B) {
      var K = X(k);
      if (typeof K != "function") throw Error(a(150));
      if (((k = K.call(k)), k == null)) throw Error(a(151));
      for (
        var J = (K = null), q = j, te = (j = 0), ze = null, ce = k.next();
        q !== null && !ce.done;
        te++, ce = k.next()
      ) {
        q.index > te ? ((ze = q), (q = null)) : (ze = q.sibling);
        var l1 = O(N, q, ce.value, B);
        if (l1 === null) {
          q === null && (q = ze);
          break;
        }
        e && q && l1.alternate === null && t(N, q),
          (j = u(l1, j, te)),
          J === null ? (K = l1) : (J.sibling = l1),
          (J = l1),
          (q = ze);
      }
      if (ce.done) return r(N, q), ye && v1(N, te), K;
      if (q === null) {
        for (; !ce.done; te++, ce = k.next())
          (ce = A(N, ce.value, B)),
            ce !== null &&
              ((j = u(ce, j, te)),
              J === null ? (K = ce) : (J.sibling = ce),
              (J = ce));
        return ye && v1(N, te), K;
      }
      for (q = n(N, q); !ce.done; te++, ce = k.next())
        (ce = U(q, N, te, ce.value, B)),
          ce !== null &&
            (e &&
              ce.alternate !== null &&
              q.delete(ce.key === null ? te : ce.key),
            (j = u(ce, j, te)),
            J === null ? (K = ce) : (J.sibling = ce),
            (J = ce));
      return (
        e &&
          q.forEach(function (U4) {
            return t(N, U4);
          }),
        ye && v1(N, te),
        K
      );
    }
    function De(N, j, k, B) {
      if (
        (typeof k == "object" &&
          k !== null &&
          k.type === Y &&
          k.key === null &&
          (k = k.props.children),
        typeof k == "object" && k !== null)
      ) {
        switch (k.$$typeof) {
          case ee:
            e: {
              for (var K = k.key, J = j; J !== null; ) {
                if (J.key === K) {
                  if (((K = k.type), K === Y)) {
                    if (J.tag === 7) {
                      r(N, J.sibling),
                        (j = o(J, k.props.children)),
                        (j.return = N),
                        (N = j);
                      break e;
                    }
                  } else if (
                    J.elementType === K ||
                    (typeof K == "object" &&
                      K !== null &&
                      K.$$typeof === je &&
                      _s(K) === J.type)
                  ) {
                    r(N, J.sibling),
                      (j = o(J, k.props)),
                      (j.ref = Ir(N, J, k)),
                      (j.return = N),
                      (N = j);
                    break e;
                  }
                  r(N, J);
                  break;
                } else t(N, J);
                J = J.sibling;
              }
              k.type === Y
                ? ((j = b1(k.props.children, N.mode, B, k.key)),
                  (j.return = N),
                  (N = j))
                : ((B = il(k.type, k.key, k.props, null, N.mode, B)),
                  (B.ref = Ir(N, j, k)),
                  (B.return = N),
                  (N = B));
            }
            return f(N);
          case re:
            e: {
              for (J = k.key; j !== null; ) {
                if (j.key === J)
                  if (
                    j.tag === 4 &&
                    j.stateNode.containerInfo === k.containerInfo &&
                    j.stateNode.implementation === k.implementation
                  ) {
                    r(N, j.sibling),
                      (j = o(j, k.children || [])),
                      (j.return = N),
                      (N = j);
                    break e;
                  } else {
                    r(N, j);
                    break;
                  }
                else t(N, j);
                j = j.sibling;
              }
              (j = vi(k, N.mode, B)), (j.return = N), (N = j);
            }
            return f(N);
          case je:
            return (J = k._init), De(N, j, J(k._payload), B);
        }
        if (dr(k)) return $(N, j, k, B);
        if (X(k)) return G(N, j, k, B);
        Tn(N, k);
      }
      return (typeof k == "string" && k !== "") || typeof k == "number"
        ? ((k = "" + k),
          j !== null && j.tag === 6
            ? (r(N, j.sibling), (j = o(j, k)), (j.return = N), (N = j))
            : (r(N, j), (j = gi(k, N.mode, B)), (j.return = N), (N = j)),
          f(N))
        : r(N, j);
    }
    return De;
  }
  var Q1 = Rs(!0),
    Ms = Rs(!1),
    In = Gt(null),
    An = null,
    Y1 = null,
    k2 = null;
  function D2() {
    k2 = Y1 = An = null;
  }
  function _2(e) {
    var t = In.current;
    ve(In), (e._currentValue = t);
  }
  function R2(e, t, r) {
    for (; e !== null; ) {
      var n = e.alternate;
      if (
        ((e.childLanes & t) !== t
          ? ((e.childLanes |= t), n !== null && (n.childLanes |= t))
          : n !== null && (n.childLanes & t) !== t && (n.childLanes |= t),
        e === r)
      )
        break;
      e = e.return;
    }
  }
  function X1(e, t) {
    (An = e),
      (k2 = Y1 = null),
      (e = e.dependencies),
      e !== null &&
        e.firstContext !== null &&
        ((e.lanes & t) !== 0 && (qe = !0), (e.firstContext = null));
  }
  function mt(e) {
    var t = e._currentValue;
    if (k2 !== e)
      if (((e = { context: e, memoizedValue: t, next: null }), Y1 === null)) {
        if (An === null) throw Error(a(308));
        (Y1 = e), (An.dependencies = { lanes: 0, firstContext: e });
      } else Y1 = Y1.next = e;
    return t;
  }
  var w1 = null;
  function M2(e) {
    w1 === null ? (w1 = [e]) : w1.push(e);
  }
  function Ps(e, t, r, n) {
    var o = t.interleaved;
    return (
      o === null ? ((r.next = r), M2(t)) : ((r.next = o.next), (o.next = r)),
      (t.interleaved = r),
      It(e, n)
    );
  }
  function It(e, t) {
    e.lanes |= t;
    var r = e.alternate;
    for (r !== null && (r.lanes |= t), r = e, e = e.return; e !== null; )
      (e.childLanes |= t),
        (r = e.alternate),
        r !== null && (r.childLanes |= t),
        (r = e),
        (e = e.return);
    return r.tag === 3 ? r.stateNode : null;
  }
  var Yt = !1;
  function P2(e) {
    e.updateQueue = {
      baseState: e.memoizedState,
      firstBaseUpdate: null,
      lastBaseUpdate: null,
      shared: { pending: null, interleaved: null, lanes: 0 },
      effects: null,
    };
  }
  function Os(e, t) {
    (e = e.updateQueue),
      t.updateQueue === e &&
        (t.updateQueue = {
          baseState: e.baseState,
          firstBaseUpdate: e.firstBaseUpdate,
          lastBaseUpdate: e.lastBaseUpdate,
          shared: e.shared,
          effects: e.effects,
        });
  }
  function At(e, t) {
    return {
      eventTime: e,
      lane: t,
      tag: 0,
      payload: null,
      callback: null,
      next: null,
    };
  }
  function Xt(e, t, r) {
    var n = e.updateQueue;
    if (n === null) return null;
    if (((n = n.shared), (oe & 2) !== 0)) {
      var o = n.pending;
      return (
        o === null ? (t.next = t) : ((t.next = o.next), (o.next = t)),
        (n.pending = t),
        It(e, r)
      );
    }
    return (
      (o = n.interleaved),
      o === null ? ((t.next = t), M2(n)) : ((t.next = o.next), (o.next = t)),
      (n.interleaved = t),
      It(e, r)
    );
  }
  function Bn(e, t, r) {
    if (
      ((t = t.updateQueue), t !== null && ((t = t.shared), (r & 4194240) !== 0))
    ) {
      var n = t.lanes;
      (n &= e.pendingLanes), (r |= n), (t.lanes = r), Gl(e, r);
    }
  }
  function Ts(e, t) {
    var r = e.updateQueue,
      n = e.alternate;
    if (n !== null && ((n = n.updateQueue), r === n)) {
      var o = null,
        u = null;
      if (((r = r.firstBaseUpdate), r !== null)) {
        do {
          var f = {
            eventTime: r.eventTime,
            lane: r.lane,
            tag: r.tag,
            payload: r.payload,
            callback: r.callback,
            next: null,
          };
          u === null ? (o = u = f) : (u = u.next = f), (r = r.next);
        } while (r !== null);
        u === null ? (o = u = t) : (u = u.next = t);
      } else o = u = t;
      (r = {
        baseState: n.baseState,
        firstBaseUpdate: o,
        lastBaseUpdate: u,
        shared: n.shared,
        effects: n.effects,
      }),
        (e.updateQueue = r);
      return;
    }
    (e = r.lastBaseUpdate),
      e === null ? (r.firstBaseUpdate = t) : (e.next = t),
      (r.lastBaseUpdate = t);
  }
  function zn(e, t, r, n) {
    var o = e.updateQueue;
    Yt = !1;
    var u = o.firstBaseUpdate,
      f = o.lastBaseUpdate,
      x = o.shared.pending;
    if (x !== null) {
      o.shared.pending = null;
      var v = x,
        D = v.next;
      (v.next = null), f === null ? (u = D) : (f.next = D), (f = v);
      var I = e.alternate;
      I !== null &&
        ((I = I.updateQueue),
        (x = I.lastBaseUpdate),
        x !== f &&
          (x === null ? (I.firstBaseUpdate = D) : (x.next = D),
          (I.lastBaseUpdate = v)));
    }
    if (u !== null) {
      var A = o.baseState;
      (f = 0), (I = D = v = null), (x = u);
      do {
        var O = x.lane,
          U = x.eventTime;
        if ((n & O) === O) {
          I !== null &&
            (I = I.next =
              {
                eventTime: U,
                lane: 0,
                tag: x.tag,
                payload: x.payload,
                callback: x.callback,
                next: null,
              });
          e: {
            var $ = e,
              G = x;
            switch (((O = t), (U = r), G.tag)) {
              case 1:
                if ((($ = G.payload), typeof $ == "function")) {
                  A = $.call(U, A, O);
                  break e;
                }
                A = $;
                break e;
              case 3:
                $.flags = ($.flags & -65537) | 128;
              case 0:
                if (
                  (($ = G.payload),
                  (O = typeof $ == "function" ? $.call(U, A, O) : $),
                  O == null)
                )
                  break e;
                A = W({}, A, O);
                break e;
              case 2:
                Yt = !0;
            }
          }
          x.callback !== null &&
            x.lane !== 0 &&
            ((e.flags |= 64),
            (O = o.effects),
            O === null ? (o.effects = [x]) : O.push(x));
        } else
          (U = {
            eventTime: U,
            lane: O,
            tag: x.tag,
            payload: x.payload,
            callback: x.callback,
            next: null,
          }),
            I === null ? ((D = I = U), (v = A)) : (I = I.next = U),
            (f |= O);
        if (((x = x.next), x === null)) {
          if (((x = o.shared.pending), x === null)) break;
          (O = x),
            (x = O.next),
            (O.next = null),
            (o.lastBaseUpdate = O),
            (o.shared.pending = null);
        }
      } while (!0);
      if (
        (I === null && (v = A),
        (o.baseState = v),
        (o.firstBaseUpdate = D),
        (o.lastBaseUpdate = I),
        (t = o.shared.interleaved),
        t !== null)
      ) {
        o = t;
        do (f |= o.lane), (o = o.next);
        while (o !== t);
      } else u === null && (o.shared.lanes = 0);
      (E1 |= f), (e.lanes = f), (e.memoizedState = A);
    }
  }
  function Is(e, t, r) {
    if (((e = t.effects), (t.effects = null), e !== null))
      for (t = 0; t < e.length; t++) {
        var n = e[t],
          o = n.callback;
        if (o !== null) {
          if (((n.callback = null), (n = r), typeof o != "function"))
            throw Error(a(191, o));
          o.call(n);
        }
      }
  }
  var Ar = {},
    bt = Gt(Ar),
    Br = Gt(Ar),
    zr = Gt(Ar);
  function y1(e) {
    if (e === Ar) throw Error(a(174));
    return e;
  }
  function O2(e, t) {
    switch ((Ce(zr, t), Ce(Br, e), Ce(bt, Ar), (e = t.nodeType), e)) {
      case 9:
      case 11:
        t = (t = t.documentElement) ? t.namespaceURI : Tl(null, "");
        break;
      default:
        (e = e === 8 ? t.parentNode : t),
          (t = e.namespaceURI || null),
          (e = e.tagName),
          (t = Tl(t, e));
    }
    ve(bt), Ce(bt, t);
  }
  function J1() {
    ve(bt), ve(Br), ve(zr);
  }
  function As(e) {
    y1(zr.current);
    var t = y1(bt.current),
      r = Tl(t, e.type);
    t !== r && (Ce(Br, e), Ce(bt, r));
  }
  function T2(e) {
    Br.current === e && (ve(bt), ve(Br));
  }
  var Ee = Gt(0);
  function Fn(e) {
    for (var t = e; t !== null; ) {
      if (t.tag === 13) {
        var r = t.memoizedState;
        if (
          r !== null &&
          ((r = r.dehydrated), r === null || r.data === "$?" || r.data === "$!")
        )
          return t;
      } else if (t.tag === 19 && t.memoizedProps.revealOrder !== void 0) {
        if ((t.flags & 128) !== 0) return t;
      } else if (t.child !== null) {
        (t.child.return = t), (t = t.child);
        continue;
      }
      if (t === e) break;
      for (; t.sibling === null; ) {
        if (t.return === null || t.return === e) return null;
        t = t.return;
      }
      (t.sibling.return = t.return), (t = t.sibling);
    }
    return null;
  }
  var I2 = [];
  function A2() {
    for (var e = 0; e < I2.length; e++)
      I2[e]._workInProgressVersionPrimary = null;
    I2.length = 0;
  }
  var Vn = F.ReactCurrentDispatcher,
    B2 = F.ReactCurrentBatchConfig,
    j1 = 0,
    Le = null,
    Pe = null,
    Ae = null,
    Un = !1,
    Fr = !1,
    Vr = 0,
    c4 = 0;
  function We() {
    throw Error(a(321));
  }
  function z2(e, t) {
    if (t === null) return !1;
    for (var r = 0; r < t.length && r < e.length; r++)
      if (!gt(e[r], t[r])) return !1;
    return !0;
  }
  function F2(e, t, r, n, o, u) {
    if (
      ((j1 = u),
      (Le = t),
      (t.memoizedState = null),
      (t.updateQueue = null),
      (t.lanes = 0),
      (Vn.current = e === null || e.memoizedState === null ? p4 : h4),
      (e = r(n, o)),
      Fr)
    ) {
      u = 0;
      do {
        if (((Fr = !1), (Vr = 0), 25 <= u)) throw Error(a(301));
        (u += 1),
          (Ae = Pe = null),
          (t.updateQueue = null),
          (Vn.current = C4),
          (e = r(n, o));
      } while (Fr);
    }
    if (
      ((Vn.current = Wn),
      (t = Pe !== null && Pe.next !== null),
      (j1 = 0),
      (Ae = Pe = Le = null),
      (Un = !1),
      t)
    )
      throw Error(a(300));
    return e;
  }
  function V2() {
    var e = Vr !== 0;
    return (Vr = 0), e;
  }
  function kt() {
    var e = {
      memoizedState: null,
      baseState: null,
      baseQueue: null,
      queue: null,
      next: null,
    };
    return Ae === null ? (Le.memoizedState = Ae = e) : (Ae = Ae.next = e), Ae;
  }
  function pt() {
    if (Pe === null) {
      var e = Le.alternate;
      e = e !== null ? e.memoizedState : null;
    } else e = Pe.next;
    var t = Ae === null ? Le.memoizedState : Ae.next;
    if (t !== null) (Ae = t), (Pe = e);
    else {
      if (e === null) throw Error(a(310));
      (Pe = e),
        (e = {
          memoizedState: Pe.memoizedState,
          baseState: Pe.baseState,
          baseQueue: Pe.baseQueue,
          queue: Pe.queue,
          next: null,
        }),
        Ae === null ? (Le.memoizedState = Ae = e) : (Ae = Ae.next = e);
    }
    return Ae;
  }
  function Ur(e, t) {
    return typeof t == "function" ? t(e) : t;
  }
  function U2(e) {
    var t = pt(),
      r = t.queue;
    if (r === null) throw Error(a(311));
    r.lastRenderedReducer = e;
    var n = Pe,
      o = n.baseQueue,
      u = r.pending;
    if (u !== null) {
      if (o !== null) {
        var f = o.next;
        (o.next = u.next), (u.next = f);
      }
      (n.baseQueue = o = u), (r.pending = null);
    }
    if (o !== null) {
      (u = o.next), (n = n.baseState);
      var x = (f = null),
        v = null,
        D = u;
      do {
        var I = D.lane;
        if ((j1 & I) === I)
          v !== null &&
            (v = v.next =
              {
                lane: 0,
                action: D.action,
                hasEagerState: D.hasEagerState,
                eagerState: D.eagerState,
                next: null,
              }),
            (n = D.hasEagerState ? D.eagerState : e(n, D.action));
        else {
          var A = {
            lane: I,
            action: D.action,
            hasEagerState: D.hasEagerState,
            eagerState: D.eagerState,
            next: null,
          };
          v === null ? ((x = v = A), (f = n)) : (v = v.next = A),
            (Le.lanes |= I),
            (E1 |= I);
        }
        D = D.next;
      } while (D !== null && D !== u);
      v === null ? (f = n) : (v.next = x),
        gt(n, t.memoizedState) || (qe = !0),
        (t.memoizedState = n),
        (t.baseState = f),
        (t.baseQueue = v),
        (r.lastRenderedState = n);
    }
    if (((e = r.interleaved), e !== null)) {
      o = e;
      do (u = o.lane), (Le.lanes |= u), (E1 |= u), (o = o.next);
      while (o !== e);
    } else o === null && (r.lanes = 0);
    return [t.memoizedState, r.dispatch];
  }
  function H2(e) {
    var t = pt(),
      r = t.queue;
    if (r === null) throw Error(a(311));
    r.lastRenderedReducer = e;
    var n = r.dispatch,
      o = r.pending,
      u = t.memoizedState;
    if (o !== null) {
      r.pending = null;
      var f = (o = o.next);
      do (u = e(u, f.action)), (f = f.next);
      while (f !== o);
      gt(u, t.memoizedState) || (qe = !0),
        (t.memoizedState = u),
        t.baseQueue === null && (t.baseState = u),
        (r.lastRenderedState = u);
    }
    return [u, n];
  }
  function Bs() {}
  function zs(e, t) {
    var r = Le,
      n = pt(),
      o = t(),
      u = !gt(n.memoizedState, o);
    if (
      (u && ((n.memoizedState = o), (qe = !0)),
      (n = n.queue),
      Z2(Us.bind(null, r, n, e), [e]),
      n.getSnapshot !== t || u || (Ae !== null && Ae.memoizedState.tag & 1))
    ) {
      if (
        ((r.flags |= 2048),
        Hr(9, Vs.bind(null, r, n, o, t), void 0, null),
        Be === null)
      )
        throw Error(a(349));
      (j1 & 30) !== 0 || Fs(r, t, o);
    }
    return o;
  }
  function Fs(e, t, r) {
    (e.flags |= 16384),
      (e = { getSnapshot: t, value: r }),
      (t = Le.updateQueue),
      t === null
        ? ((t = { lastEffect: null, stores: null }),
          (Le.updateQueue = t),
          (t.stores = [e]))
        : ((r = t.stores), r === null ? (t.stores = [e]) : r.push(e));
  }
  function Vs(e, t, r, n) {
    (t.value = r), (t.getSnapshot = n), Hs(t) && Zs(e);
  }
  function Us(e, t, r) {
    return r(function () {
      Hs(t) && Zs(e);
    });
  }
  function Hs(e) {
    var t = e.getSnapshot;
    e = e.value;
    try {
      var r = t();
      return !gt(e, r);
    } catch {
      return !0;
    }
  }
  function Zs(e) {
    var t = It(e, 1);
    t !== null && Et(t, e, 1, -1);
  }
  function Ws(e) {
    var t = kt();
    return (
      typeof e == "function" && (e = e()),
      (t.memoizedState = t.baseState = e),
      (e = {
        pending: null,
        interleaved: null,
        lanes: 0,
        dispatch: null,
        lastRenderedReducer: Ur,
        lastRenderedState: e,
      }),
      (t.queue = e),
      (e = e.dispatch = m4.bind(null, Le, e)),
      [t.memoizedState, e]
    );
  }
  function Hr(e, t, r, n) {
    return (
      (e = { tag: e, create: t, destroy: r, deps: n, next: null }),
      (t = Le.updateQueue),
      t === null
        ? ((t = { lastEffect: null, stores: null }),
          (Le.updateQueue = t),
          (t.lastEffect = e.next = e))
        : ((r = t.lastEffect),
          r === null
            ? (t.lastEffect = e.next = e)
            : ((n = r.next), (r.next = e), (e.next = n), (t.lastEffect = e))),
      e
    );
  }
  function $s() {
    return pt().memoizedState;
  }
  function Hn(e, t, r, n) {
    var o = kt();
    (Le.flags |= e),
      (o.memoizedState = Hr(1 | t, r, void 0, n === void 0 ? null : n));
  }
  function Zn(e, t, r, n) {
    var o = pt();
    n = n === void 0 ? null : n;
    var u = void 0;
    if (Pe !== null) {
      var f = Pe.memoizedState;
      if (((u = f.destroy), n !== null && z2(n, f.deps))) {
        o.memoizedState = Hr(t, r, u, n);
        return;
      }
    }
    (Le.flags |= e), (o.memoizedState = Hr(1 | t, r, u, n));
  }
  function Gs(e, t) {
    return Hn(8390656, 8, e, t);
  }
  function Z2(e, t) {
    return Zn(2048, 8, e, t);
  }
  function Ks(e, t) {
    return Zn(4, 2, e, t);
  }
  function Qs(e, t) {
    return Zn(4, 4, e, t);
  }
  function Ys(e, t) {
    if (typeof t == "function")
      return (
        (e = e()),
        t(e),
        function () {
          t(null);
        }
      );
    if (t != null)
      return (
        (e = e()),
        (t.current = e),
        function () {
          t.current = null;
        }
      );
  }
  function Xs(e, t, r) {
    return (
      (r = r != null ? r.concat([e]) : null), Zn(4, 4, Ys.bind(null, t, e), r)
    );
  }
  function W2() {}
  function Js(e, t) {
    var r = pt();
    t = t === void 0 ? null : t;
    var n = r.memoizedState;
    return n !== null && t !== null && z2(t, n[1])
      ? n[0]
      : ((r.memoizedState = [e, t]), e);
  }
  function qs(e, t) {
    var r = pt();
    t = t === void 0 ? null : t;
    var n = r.memoizedState;
    return n !== null && t !== null && z2(t, n[1])
      ? n[0]
      : ((e = e()), (r.memoizedState = [e, t]), e);
  }
  function eo(e, t, r) {
    return (j1 & 21) === 0
      ? (e.baseState && ((e.baseState = !1), (qe = !0)), (e.memoizedState = r))
      : (gt(r, t) ||
          ((r = _3()), (Le.lanes |= r), (E1 |= r), (e.baseState = !0)),
        t);
  }
  function d4(e, t) {
    var r = pe;
    (pe = r !== 0 && 4 > r ? r : 4), e(!0);
    var n = B2.transition;
    B2.transition = {};
    try {
      e(!1), t();
    } finally {
      (pe = r), (B2.transition = n);
    }
  }
  function to() {
    return pt().memoizedState;
  }
  function f4(e, t, r) {
    var n = t1(e);
    if (
      ((r = {
        lane: n,
        action: r,
        hasEagerState: !1,
        eagerState: null,
        next: null,
      }),
      ro(e))
    )
      no(t, r);
    else if (((r = Ps(e, t, r, n)), r !== null)) {
      var o = Ye();
      Et(r, e, n, o), lo(r, t, n);
    }
  }
  function m4(e, t, r) {
    var n = t1(e),
      o = {
        lane: n,
        action: r,
        hasEagerState: !1,
        eagerState: null,
        next: null,
      };
    if (ro(e)) no(t, o);
    else {
      var u = e.alternate;
      if (
        e.lanes === 0 &&
        (u === null || u.lanes === 0) &&
        ((u = t.lastRenderedReducer), u !== null)
      )
        try {
          var f = t.lastRenderedState,
            x = u(f, r);
          if (((o.hasEagerState = !0), (o.eagerState = x), gt(x, f))) {
            var v = t.interleaved;
            v === null
              ? ((o.next = o), M2(t))
              : ((o.next = v.next), (v.next = o)),
              (t.interleaved = o);
            return;
          }
        } catch {
        } finally {
        }
      (r = Ps(e, t, o, n)),
        r !== null && ((o = Ye()), Et(r, e, n, o), lo(r, t, n));
    }
  }
  function ro(e) {
    var t = e.alternate;
    return e === Le || (t !== null && t === Le);
  }
  function no(e, t) {
    Fr = Un = !0;
    var r = e.pending;
    r === null ? (t.next = t) : ((t.next = r.next), (r.next = t)),
      (e.pending = t);
  }
  function lo(e, t, r) {
    if ((r & 4194240) !== 0) {
      var n = t.lanes;
      (n &= e.pendingLanes), (r |= n), (t.lanes = r), Gl(e, r);
    }
  }
  var Wn = {
      readContext: mt,
      useCallback: We,
      useContext: We,
      useEffect: We,
      useImperativeHandle: We,
      useInsertionEffect: We,
      useLayoutEffect: We,
      useMemo: We,
      useReducer: We,
      useRef: We,
      useState: We,
      useDebugValue: We,
      useDeferredValue: We,
      useTransition: We,
      useMutableSource: We,
      useSyncExternalStore: We,
      useId: We,
      unstable_isNewReconciler: !1,
    },
    p4 = {
      readContext: mt,
      useCallback: function (e, t) {
        return (kt().memoizedState = [e, t === void 0 ? null : t]), e;
      },
      useContext: mt,
      useEffect: Gs,
      useImperativeHandle: function (e, t, r) {
        return (
          (r = r != null ? r.concat([e]) : null),
          Hn(4194308, 4, Ys.bind(null, t, e), r)
        );
      },
      useLayoutEffect: function (e, t) {
        return Hn(4194308, 4, e, t);
      },
      useInsertionEffect: function (e, t) {
        return Hn(4, 2, e, t);
      },
      useMemo: function (e, t) {
        var r = kt();
        return (
          (t = t === void 0 ? null : t),
          (e = e()),
          (r.memoizedState = [e, t]),
          e
        );
      },
      useReducer: function (e, t, r) {
        var n = kt();
        return (
          (t = r !== void 0 ? r(t) : t),
          (n.memoizedState = n.baseState = t),
          (e = {
            pending: null,
            interleaved: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: e,
            lastRenderedState: t,
          }),
          (n.queue = e),
          (e = e.dispatch = f4.bind(null, Le, e)),
          [n.memoizedState, e]
        );
      },
      useRef: function (e) {
        var t = kt();
        return (e = { current: e }), (t.memoizedState = e);
      },
      useState: Ws,
      useDebugValue: W2,
      useDeferredValue: function (e) {
        return (kt().memoizedState = e);
      },
      useTransition: function () {
        var e = Ws(!1),
          t = e[0];
        return (e = d4.bind(null, e[1])), (kt().memoizedState = e), [t, e];
      },
      useMutableSource: function () {},
      useSyncExternalStore: function (e, t, r) {
        var n = Le,
          o = kt();
        if (ye) {
          if (r === void 0) throw Error(a(407));
          r = r();
        } else {
          if (((r = t()), Be === null)) throw Error(a(349));
          (j1 & 30) !== 0 || Fs(n, t, r);
        }
        o.memoizedState = r;
        var u = { value: r, getSnapshot: t };
        return (
          (o.queue = u),
          Gs(Us.bind(null, n, u, e), [e]),
          (n.flags |= 2048),
          Hr(9, Vs.bind(null, n, u, r, t), void 0, null),
          r
        );
      },
      useId: function () {
        var e = kt(),
          t = Be.identifierPrefix;
        if (ye) {
          var r = Tt,
            n = Ot;
          (r = (n & ~(1 << (32 - xt(n) - 1))).toString(32) + r),
            (t = ":" + t + "R" + r),
            (r = Vr++),
            0 < r && (t += "H" + r.toString(32)),
            (t += ":");
        } else (r = c4++), (t = ":" + t + "r" + r.toString(32) + ":");
        return (e.memoizedState = t);
      },
      unstable_isNewReconciler: !1,
    },
    h4 = {
      readContext: mt,
      useCallback: Js,
      useContext: mt,
      useEffect: Z2,
      useImperativeHandle: Xs,
      useInsertionEffect: Ks,
      useLayoutEffect: Qs,
      useMemo: qs,
      useReducer: U2,
      useRef: $s,
      useState: function () {
        return U2(Ur);
      },
      useDebugValue: W2,
      useDeferredValue: function (e) {
        var t = pt();
        return eo(t, Pe.memoizedState, e);
      },
      useTransition: function () {
        var e = U2(Ur)[0],
          t = pt().memoizedState;
        return [e, t];
      },
      useMutableSource: Bs,
      useSyncExternalStore: zs,
      useId: to,
      unstable_isNewReconciler: !1,
    },
    C4 = {
      readContext: mt,
      useCallback: Js,
      useContext: mt,
      useEffect: Z2,
      useImperativeHandle: Xs,
      useInsertionEffect: Ks,
      useLayoutEffect: Qs,
      useMemo: qs,
      useReducer: H2,
      useRef: $s,
      useState: function () {
        return H2(Ur);
      },
      useDebugValue: W2,
      useDeferredValue: function (e) {
        var t = pt();
        return Pe === null ? (t.memoizedState = e) : eo(t, Pe.memoizedState, e);
      },
      useTransition: function () {
        var e = H2(Ur)[0],
          t = pt().memoizedState;
        return [e, t];
      },
      useMutableSource: Bs,
      useSyncExternalStore: zs,
      useId: to,
      unstable_isNewReconciler: !1,
    };
  function wt(e, t) {
    if (e && e.defaultProps) {
      (t = W({}, t)), (e = e.defaultProps);
      for (var r in e) t[r] === void 0 && (t[r] = e[r]);
      return t;
    }
    return t;
  }
  function $2(e, t, r, n) {
    (t = e.memoizedState),
      (r = r(n, t)),
      (r = r == null ? t : W({}, t, r)),
      (e.memoizedState = r),
      e.lanes === 0 && (e.updateQueue.baseState = r);
  }
  var $n = {
    isMounted: function (e) {
      return (e = e._reactInternals) ? h1(e) === e : !1;
    },
    enqueueSetState: function (e, t, r) {
      e = e._reactInternals;
      var n = Ye(),
        o = t1(e),
        u = At(n, o);
      (u.payload = t),
        r != null && (u.callback = r),
        (t = Xt(e, u, o)),
        t !== null && (Et(t, e, o, n), Bn(t, e, o));
    },
    enqueueReplaceState: function (e, t, r) {
      e = e._reactInternals;
      var n = Ye(),
        o = t1(e),
        u = At(n, o);
      (u.tag = 1),
        (u.payload = t),
        r != null && (u.callback = r),
        (t = Xt(e, u, o)),
        t !== null && (Et(t, e, o, n), Bn(t, e, o));
    },
    enqueueForceUpdate: function (e, t) {
      e = e._reactInternals;
      var r = Ye(),
        n = t1(e),
        o = At(r, n);
      (o.tag = 2),
        t != null && (o.callback = t),
        (t = Xt(e, o, n)),
        t !== null && (Et(t, e, n, r), Bn(t, e, n));
    },
  };
  function io(e, t, r, n, o, u, f) {
    return (
      (e = e.stateNode),
      typeof e.shouldComponentUpdate == "function"
        ? e.shouldComponentUpdate(n, u, f)
        : t.prototype && t.prototype.isPureReactComponent
        ? !Dr(r, n) || !Dr(o, u)
        : !0
    );
  }
  function so(e, t, r) {
    var n = !1,
      o = Kt,
      u = t.contextType;
    return (
      typeof u == "object" && u !== null
        ? (u = mt(u))
        : ((o = Je(t) ? x1 : Ze.current),
          (n = t.contextTypes),
          (u = (n = n != null) ? W1(e, o) : Kt)),
      (t = new t(r, u)),
      (e.memoizedState =
        t.state !== null && t.state !== void 0 ? t.state : null),
      (t.updater = $n),
      (e.stateNode = t),
      (t._reactInternals = e),
      n &&
        ((e = e.stateNode),
        (e.__reactInternalMemoizedUnmaskedChildContext = o),
        (e.__reactInternalMemoizedMaskedChildContext = u)),
      t
    );
  }
  function oo(e, t, r, n) {
    (e = t.state),
      typeof t.componentWillReceiveProps == "function" &&
        t.componentWillReceiveProps(r, n),
      typeof t.UNSAFE_componentWillReceiveProps == "function" &&
        t.UNSAFE_componentWillReceiveProps(r, n),
      t.state !== e && $n.enqueueReplaceState(t, t.state, null);
  }
  function G2(e, t, r, n) {
    var o = e.stateNode;
    (o.props = r), (o.state = e.memoizedState), (o.refs = {}), P2(e);
    var u = t.contextType;
    typeof u == "object" && u !== null
      ? (o.context = mt(u))
      : ((u = Je(t) ? x1 : Ze.current), (o.context = W1(e, u))),
      (o.state = e.memoizedState),
      (u = t.getDerivedStateFromProps),
      typeof u == "function" && ($2(e, t, u, r), (o.state = e.memoizedState)),
      typeof t.getDerivedStateFromProps == "function" ||
        typeof o.getSnapshotBeforeUpdate == "function" ||
        (typeof o.UNSAFE_componentWillMount != "function" &&
          typeof o.componentWillMount != "function") ||
        ((t = o.state),
        typeof o.componentWillMount == "function" && o.componentWillMount(),
        typeof o.UNSAFE_componentWillMount == "function" &&
          o.UNSAFE_componentWillMount(),
        t !== o.state && $n.enqueueReplaceState(o, o.state, null),
        zn(e, r, o, n),
        (o.state = e.memoizedState)),
      typeof o.componentDidMount == "function" && (e.flags |= 4194308);
  }
  function q1(e, t) {
    try {
      var r = "",
        n = t;
      do (r += ae(n)), (n = n.return);
      while (n);
      var o = r;
    } catch (u) {
      o =
        `
Error generating stack: ` +
        u.message +
        `
` +
        u.stack;
    }
    return { value: e, source: t, stack: o, digest: null };
  }
  function K2(e, t, r) {
    return { value: e, source: null, stack: r ?? null, digest: t ?? null };
  }
  function Q2(e, t) {
    try {
      console.error(t.value);
    } catch (r) {
      setTimeout(function () {
        throw r;
      });
    }
  }
  var x4 = typeof WeakMap == "function" ? WeakMap : Map;
  function ao(e, t, r) {
    (r = At(-1, r)), (r.tag = 3), (r.payload = { element: null });
    var n = t.value;
    return (
      (r.callback = function () {
        qn || ((qn = !0), (ci = n)), Q2(e, t);
      }),
      r
    );
  }
  function uo(e, t, r) {
    (r = At(-1, r)), (r.tag = 3);
    var n = e.type.getDerivedStateFromError;
    if (typeof n == "function") {
      var o = t.value;
      (r.payload = function () {
        return n(o);
      }),
        (r.callback = function () {
          Q2(e, t);
        });
    }
    var u = e.stateNode;
    return (
      u !== null &&
        typeof u.componentDidCatch == "function" &&
        (r.callback = function () {
          Q2(e, t),
            typeof n != "function" &&
              (qt === null ? (qt = new Set([this])) : qt.add(this));
          var f = t.stack;
          this.componentDidCatch(t.value, {
            componentStack: f !== null ? f : "",
          });
        }),
      r
    );
  }
  function co(e, t, r) {
    var n = e.pingCache;
    if (n === null) {
      n = e.pingCache = new x4();
      var o = new Set();
      n.set(t, o);
    } else (o = n.get(t)), o === void 0 && ((o = new Set()), n.set(t, o));
    o.has(r) || (o.add(r), (e = R4.bind(null, e, t, r)), t.then(e, e));
  }
  function fo(e) {
    do {
      var t;
      if (
        ((t = e.tag === 13) &&
          ((t = e.memoizedState),
          (t = t !== null ? t.dehydrated !== null : !0)),
        t)
      )
        return e;
      e = e.return;
    } while (e !== null);
    return null;
  }
  function mo(e, t, r, n, o) {
    return (e.mode & 1) === 0
      ? (e === t
          ? (e.flags |= 65536)
          : ((e.flags |= 128),
            (r.flags |= 131072),
            (r.flags &= -52805),
            r.tag === 1 &&
              (r.alternate === null
                ? (r.tag = 17)
                : ((t = At(-1, 1)), (t.tag = 2), Xt(r, t, 1))),
            (r.lanes |= 1)),
        e)
      : ((e.flags |= 65536), (e.lanes = o), e);
  }
  var g4 = F.ReactCurrentOwner,
    qe = !1;
  function Qe(e, t, r, n) {
    t.child = e === null ? Ms(t, null, r, n) : Q1(t, e.child, r, n);
  }
  function po(e, t, r, n, o) {
    r = r.render;
    var u = t.ref;
    return (
      X1(t, o),
      (n = F2(e, t, r, n, u, o)),
      (r = V2()),
      e !== null && !qe
        ? ((t.updateQueue = e.updateQueue),
          (t.flags &= -2053),
          (e.lanes &= ~o),
          Bt(e, t, o))
        : (ye && r && E2(t), (t.flags |= 1), Qe(e, t, n, o), t.child)
    );
  }
  function ho(e, t, r, n, o) {
    if (e === null) {
      var u = r.type;
      return typeof u == "function" &&
        !xi(u) &&
        u.defaultProps === void 0 &&
        r.compare === null &&
        r.defaultProps === void 0
        ? ((t.tag = 15), (t.type = u), Co(e, t, u, n, o))
        : ((e = il(r.type, null, n, t, t.mode, o)),
          (e.ref = t.ref),
          (e.return = t),
          (t.child = e));
    }
    if (((u = e.child), (e.lanes & o) === 0)) {
      var f = u.memoizedProps;
      if (
        ((r = r.compare), (r = r !== null ? r : Dr), r(f, n) && e.ref === t.ref)
      )
        return Bt(e, t, o);
    }
    return (
      (t.flags |= 1),
      (e = n1(u, n)),
      (e.ref = t.ref),
      (e.return = t),
      (t.child = e)
    );
  }
  function Co(e, t, r, n, o) {
    if (e !== null) {
      var u = e.memoizedProps;
      if (Dr(u, n) && e.ref === t.ref)
        if (((qe = !1), (t.pendingProps = n = u), (e.lanes & o) !== 0))
          (e.flags & 131072) !== 0 && (qe = !0);
        else return (t.lanes = e.lanes), Bt(e, t, o);
    }
    return Y2(e, t, r, n, o);
  }
  function xo(e, t, r) {
    var n = t.pendingProps,
      o = n.children,
      u = e !== null ? e.memoizedState : null;
    if (n.mode === "hidden")
      if ((t.mode & 1) === 0)
        (t.memoizedState = {
          baseLanes: 0,
          cachePool: null,
          transitions: null,
        }),
          Ce(tr, ut),
          (ut |= r);
      else {
        if ((r & 1073741824) === 0)
          return (
            (e = u !== null ? u.baseLanes | r : r),
            (t.lanes = t.childLanes = 1073741824),
            (t.memoizedState = {
              baseLanes: e,
              cachePool: null,
              transitions: null,
            }),
            (t.updateQueue = null),
            Ce(tr, ut),
            (ut |= e),
            null
          );
        (t.memoizedState = {
          baseLanes: 0,
          cachePool: null,
          transitions: null,
        }),
          (n = u !== null ? u.baseLanes : r),
          Ce(tr, ut),
          (ut |= n);
      }
    else
      u !== null ? ((n = u.baseLanes | r), (t.memoizedState = null)) : (n = r),
        Ce(tr, ut),
        (ut |= n);
    return Qe(e, t, o, r), t.child;
  }
  function go(e, t) {
    var r = t.ref;
    ((e === null && r !== null) || (e !== null && e.ref !== r)) &&
      ((t.flags |= 512), (t.flags |= 2097152));
  }
  function Y2(e, t, r, n, o) {
    var u = Je(r) ? x1 : Ze.current;
    return (
      (u = W1(t, u)),
      X1(t, o),
      (r = F2(e, t, r, n, u, o)),
      (n = V2()),
      e !== null && !qe
        ? ((t.updateQueue = e.updateQueue),
          (t.flags &= -2053),
          (e.lanes &= ~o),
          Bt(e, t, o))
        : (ye && n && E2(t), (t.flags |= 1), Qe(e, t, r, o), t.child)
    );
  }
  function vo(e, t, r, n, o) {
    if (Je(r)) {
      var u = !0;
      _n(t);
    } else u = !1;
    if ((X1(t, o), t.stateNode === null))
      Kn(e, t), so(t, r, n), G2(t, r, n, o), (n = !0);
    else if (e === null) {
      var f = t.stateNode,
        x = t.memoizedProps;
      f.props = x;
      var v = f.context,
        D = r.contextType;
      typeof D == "object" && D !== null
        ? (D = mt(D))
        : ((D = Je(r) ? x1 : Ze.current), (D = W1(t, D)));
      var I = r.getDerivedStateFromProps,
        A =
          typeof I == "function" ||
          typeof f.getSnapshotBeforeUpdate == "function";
      A ||
        (typeof f.UNSAFE_componentWillReceiveProps != "function" &&
          typeof f.componentWillReceiveProps != "function") ||
        ((x !== n || v !== D) && oo(t, f, n, D)),
        (Yt = !1);
      var O = t.memoizedState;
      (f.state = O),
        zn(t, n, f, o),
        (v = t.memoizedState),
        x !== n || O !== v || Xe.current || Yt
          ? (typeof I == "function" && ($2(t, r, I, n), (v = t.memoizedState)),
            (x = Yt || io(t, r, x, n, O, v, D))
              ? (A ||
                  (typeof f.UNSAFE_componentWillMount != "function" &&
                    typeof f.componentWillMount != "function") ||
                  (typeof f.componentWillMount == "function" &&
                    f.componentWillMount(),
                  typeof f.UNSAFE_componentWillMount == "function" &&
                    f.UNSAFE_componentWillMount()),
                typeof f.componentDidMount == "function" &&
                  (t.flags |= 4194308))
              : (typeof f.componentDidMount == "function" &&
                  (t.flags |= 4194308),
                (t.memoizedProps = n),
                (t.memoizedState = v)),
            (f.props = n),
            (f.state = v),
            (f.context = D),
            (n = x))
          : (typeof f.componentDidMount == "function" && (t.flags |= 4194308),
            (n = !1));
    } else {
      (f = t.stateNode),
        Os(e, t),
        (x = t.memoizedProps),
        (D = t.type === t.elementType ? x : wt(t.type, x)),
        (f.props = D),
        (A = t.pendingProps),
        (O = f.context),
        (v = r.contextType),
        typeof v == "object" && v !== null
          ? (v = mt(v))
          : ((v = Je(r) ? x1 : Ze.current), (v = W1(t, v)));
      var U = r.getDerivedStateFromProps;
      (I =
        typeof U == "function" ||
        typeof f.getSnapshotBeforeUpdate == "function") ||
        (typeof f.UNSAFE_componentWillReceiveProps != "function" &&
          typeof f.componentWillReceiveProps != "function") ||
        ((x !== A || O !== v) && oo(t, f, n, v)),
        (Yt = !1),
        (O = t.memoizedState),
        (f.state = O),
        zn(t, n, f, o);
      var $ = t.memoizedState;
      x !== A || O !== $ || Xe.current || Yt
        ? (typeof U == "function" && ($2(t, r, U, n), ($ = t.memoizedState)),
          (D = Yt || io(t, r, D, n, O, $, v) || !1)
            ? (I ||
                (typeof f.UNSAFE_componentWillUpdate != "function" &&
                  typeof f.componentWillUpdate != "function") ||
                (typeof f.componentWillUpdate == "function" &&
                  f.componentWillUpdate(n, $, v),
                typeof f.UNSAFE_componentWillUpdate == "function" &&
                  f.UNSAFE_componentWillUpdate(n, $, v)),
              typeof f.componentDidUpdate == "function" && (t.flags |= 4),
              typeof f.getSnapshotBeforeUpdate == "function" &&
                (t.flags |= 1024))
            : (typeof f.componentDidUpdate != "function" ||
                (x === e.memoizedProps && O === e.memoizedState) ||
                (t.flags |= 4),
              typeof f.getSnapshotBeforeUpdate != "function" ||
                (x === e.memoizedProps && O === e.memoizedState) ||
                (t.flags |= 1024),
              (t.memoizedProps = n),
              (t.memoizedState = $)),
          (f.props = n),
          (f.state = $),
          (f.context = v),
          (n = D))
        : (typeof f.componentDidUpdate != "function" ||
            (x === e.memoizedProps && O === e.memoizedState) ||
            (t.flags |= 4),
          typeof f.getSnapshotBeforeUpdate != "function" ||
            (x === e.memoizedProps && O === e.memoizedState) ||
            (t.flags |= 1024),
          (n = !1));
    }
    return X2(e, t, r, n, u, o);
  }
  function X2(e, t, r, n, o, u) {
    go(e, t);
    var f = (t.flags & 128) !== 0;
    if (!n && !f) return o && Es(t, r, !1), Bt(e, t, u);
    (n = t.stateNode), (g4.current = t);
    var x =
      f && typeof r.getDerivedStateFromError != "function" ? null : n.render();
    return (
      (t.flags |= 1),
      e !== null && f
        ? ((t.child = Q1(t, e.child, null, u)), (t.child = Q1(t, null, x, u)))
        : Qe(e, t, x, u),
      (t.memoizedState = n.state),
      o && Es(t, r, !0),
      t.child
    );
  }
  function wo(e) {
    var t = e.stateNode;
    t.pendingContext
      ? ys(e, t.pendingContext, t.pendingContext !== t.context)
      : t.context && ys(e, t.context, !1),
      O2(e, t.containerInfo);
  }
  function yo(e, t, r, n, o) {
    return K1(), b2(o), (t.flags |= 256), Qe(e, t, r, n), t.child;
  }
  var J2 = { dehydrated: null, treeContext: null, retryLane: 0 };
  function q2(e) {
    return { baseLanes: e, cachePool: null, transitions: null };
  }
  function jo(e, t, r) {
    var n = t.pendingProps,
      o = Ee.current,
      u = !1,
      f = (t.flags & 128) !== 0,
      x;
    if (
      ((x = f) ||
        (x = e !== null && e.memoizedState === null ? !1 : (o & 2) !== 0),
      x
        ? ((u = !0), (t.flags &= -129))
        : (e === null || e.memoizedState !== null) && (o |= 1),
      Ce(Ee, o & 1),
      e === null)
    )
      return (
        N2(t),
        (e = t.memoizedState),
        e !== null && ((e = e.dehydrated), e !== null)
          ? ((t.mode & 1) === 0
              ? (t.lanes = 1)
              : e.data === "$!"
              ? (t.lanes = 8)
              : (t.lanes = 1073741824),
            null)
          : ((f = n.children),
            (e = n.fallback),
            u
              ? ((n = t.mode),
                (u = t.child),
                (f = { mode: "hidden", children: f }),
                (n & 1) === 0 && u !== null
                  ? ((u.childLanes = 0), (u.pendingProps = f))
                  : (u = sl(f, n, 0, null)),
                (e = b1(e, n, r, null)),
                (u.return = t),
                (e.return = t),
                (u.sibling = e),
                (t.child = u),
                (t.child.memoizedState = q2(r)),
                (t.memoizedState = J2),
                e)
              : ei(t, f))
      );
    if (((o = e.memoizedState), o !== null && ((x = o.dehydrated), x !== null)))
      return v4(e, t, f, n, x, o, r);
    if (u) {
      (u = n.fallback), (f = t.mode), (o = e.child), (x = o.sibling);
      var v = { mode: "hidden", children: n.children };
      return (
        (f & 1) === 0 && t.child !== o
          ? ((n = t.child),
            (n.childLanes = 0),
            (n.pendingProps = v),
            (t.deletions = null))
          : ((n = n1(o, v)), (n.subtreeFlags = o.subtreeFlags & 14680064)),
        x !== null ? (u = n1(x, u)) : ((u = b1(u, f, r, null)), (u.flags |= 2)),
        (u.return = t),
        (n.return = t),
        (n.sibling = u),
        (t.child = n),
        (n = u),
        (u = t.child),
        (f = e.child.memoizedState),
        (f =
          f === null
            ? q2(r)
            : {
                baseLanes: f.baseLanes | r,
                cachePool: null,
                transitions: f.transitions,
              }),
        (u.memoizedState = f),
        (u.childLanes = e.childLanes & ~r),
        (t.memoizedState = J2),
        n
      );
    }
    return (
      (u = e.child),
      (e = u.sibling),
      (n = n1(u, { mode: "visible", children: n.children })),
      (t.mode & 1) === 0 && (n.lanes = r),
      (n.return = t),
      (n.sibling = null),
      e !== null &&
        ((r = t.deletions),
        r === null ? ((t.deletions = [e]), (t.flags |= 16)) : r.push(e)),
      (t.child = n),
      (t.memoizedState = null),
      n
    );
  }
  function ei(e, t) {
    return (
      (t = sl({ mode: "visible", children: t }, e.mode, 0, null)),
      (t.return = e),
      (e.child = t)
    );
  }
  function Gn(e, t, r, n) {
    return (
      n !== null && b2(n),
      Q1(t, e.child, null, r),
      (e = ei(t, t.pendingProps.children)),
      (e.flags |= 2),
      (t.memoizedState = null),
      e
    );
  }
  function v4(e, t, r, n, o, u, f) {
    if (r)
      return t.flags & 256
        ? ((t.flags &= -257), (n = K2(Error(a(422)))), Gn(e, t, f, n))
        : t.memoizedState !== null
        ? ((t.child = e.child), (t.flags |= 128), null)
        : ((u = n.fallback),
          (o = t.mode),
          (n = sl({ mode: "visible", children: n.children }, o, 0, null)),
          (u = b1(u, o, f, null)),
          (u.flags |= 2),
          (n.return = t),
          (u.return = t),
          (n.sibling = u),
          (t.child = n),
          (t.mode & 1) !== 0 && Q1(t, e.child, null, f),
          (t.child.memoizedState = q2(f)),
          (t.memoizedState = J2),
          u);
    if ((t.mode & 1) === 0) return Gn(e, t, f, null);
    if (o.data === "$!") {
      if (((n = o.nextSibling && o.nextSibling.dataset), n)) var x = n.dgst;
      return (
        (n = x), (u = Error(a(419))), (n = K2(u, n, void 0)), Gn(e, t, f, n)
      );
    }
    if (((x = (f & e.childLanes) !== 0), qe || x)) {
      if (((n = Be), n !== null)) {
        switch (f & -f) {
          case 4:
            o = 2;
            break;
          case 16:
            o = 8;
            break;
          case 64:
          case 128:
          case 256:
          case 512:
          case 1024:
          case 2048:
          case 4096:
          case 8192:
          case 16384:
          case 32768:
          case 65536:
          case 131072:
          case 262144:
          case 524288:
          case 1048576:
          case 2097152:
          case 4194304:
          case 8388608:
          case 16777216:
          case 33554432:
          case 67108864:
            o = 32;
            break;
          case 536870912:
            o = 268435456;
            break;
          default:
            o = 0;
        }
        (o = (o & (n.suspendedLanes | f)) !== 0 ? 0 : o),
          o !== 0 &&
            o !== u.retryLane &&
            ((u.retryLane = o), It(e, o), Et(n, e, o, -1));
      }
      return Ci(), (n = K2(Error(a(421)))), Gn(e, t, f, n);
    }
    return o.data === "$?"
      ? ((t.flags |= 128),
        (t.child = e.child),
        (t = M4.bind(null, e)),
        (o._reactRetry = t),
        null)
      : ((e = u.treeContext),
        (at = $t(o.nextSibling)),
        (ot = t),
        (ye = !0),
        (vt = null),
        e !== null &&
          ((dt[ft++] = Ot),
          (dt[ft++] = Tt),
          (dt[ft++] = g1),
          (Ot = e.id),
          (Tt = e.overflow),
          (g1 = t)),
        (t = ei(t, n.children)),
        (t.flags |= 4096),
        t);
  }
  function Eo(e, t, r) {
    e.lanes |= t;
    var n = e.alternate;
    n !== null && (n.lanes |= t), R2(e.return, t, r);
  }
  function ti(e, t, r, n, o) {
    var u = e.memoizedState;
    u === null
      ? (e.memoizedState = {
          isBackwards: t,
          rendering: null,
          renderingStartTime: 0,
          last: n,
          tail: r,
          tailMode: o,
        })
      : ((u.isBackwards = t),
        (u.rendering = null),
        (u.renderingStartTime = 0),
        (u.last = n),
        (u.tail = r),
        (u.tailMode = o));
  }
  function Lo(e, t, r) {
    var n = t.pendingProps,
      o = n.revealOrder,
      u = n.tail;
    if ((Qe(e, t, n.children, r), (n = Ee.current), (n & 2) !== 0))
      (n = (n & 1) | 2), (t.flags |= 128);
    else {
      if (e !== null && (e.flags & 128) !== 0)
        e: for (e = t.child; e !== null; ) {
          if (e.tag === 13) e.memoizedState !== null && Eo(e, r, t);
          else if (e.tag === 19) Eo(e, r, t);
          else if (e.child !== null) {
            (e.child.return = e), (e = e.child);
            continue;
          }
          if (e === t) break e;
          for (; e.sibling === null; ) {
            if (e.return === null || e.return === t) break e;
            e = e.return;
          }
          (e.sibling.return = e.return), (e = e.sibling);
        }
      n &= 1;
    }
    if ((Ce(Ee, n), (t.mode & 1) === 0)) t.memoizedState = null;
    else
      switch (o) {
        case "forwards":
          for (r = t.child, o = null; r !== null; )
            (e = r.alternate),
              e !== null && Fn(e) === null && (o = r),
              (r = r.sibling);
          (r = o),
            r === null
              ? ((o = t.child), (t.child = null))
              : ((o = r.sibling), (r.sibling = null)),
            ti(t, !1, o, r, u);
          break;
        case "backwards":
          for (r = null, o = t.child, t.child = null; o !== null; ) {
            if (((e = o.alternate), e !== null && Fn(e) === null)) {
              t.child = o;
              break;
            }
            (e = o.sibling), (o.sibling = r), (r = o), (o = e);
          }
          ti(t, !0, r, null, u);
          break;
        case "together":
          ti(t, !1, null, null, void 0);
          break;
        default:
          t.memoizedState = null;
      }
    return t.child;
  }
  function Kn(e, t) {
    (t.mode & 1) === 0 &&
      e !== null &&
      ((e.alternate = null), (t.alternate = null), (t.flags |= 2));
  }
  function Bt(e, t, r) {
    if (
      (e !== null && (t.dependencies = e.dependencies),
      (E1 |= t.lanes),
      (r & t.childLanes) === 0)
    )
      return null;
    if (e !== null && t.child !== e.child) throw Error(a(153));
    if (t.child !== null) {
      for (
        e = t.child, r = n1(e, e.pendingProps), t.child = r, r.return = t;
        e.sibling !== null;

      )
        (e = e.sibling),
          (r = r.sibling = n1(e, e.pendingProps)),
          (r.return = t);
      r.sibling = null;
    }
    return t.child;
  }
  function w4(e, t, r) {
    switch (t.tag) {
      case 3:
        wo(t), K1();
        break;
      case 5:
        As(t);
        break;
      case 1:
        Je(t.type) && _n(t);
        break;
      case 4:
        O2(t, t.stateNode.containerInfo);
        break;
      case 10:
        var n = t.type._context,
          o = t.memoizedProps.value;
        Ce(In, n._currentValue), (n._currentValue = o);
        break;
      case 13:
        if (((n = t.memoizedState), n !== null))
          return n.dehydrated !== null
            ? (Ce(Ee, Ee.current & 1), (t.flags |= 128), null)
            : (r & t.child.childLanes) !== 0
            ? jo(e, t, r)
            : (Ce(Ee, Ee.current & 1),
              (e = Bt(e, t, r)),
              e !== null ? e.sibling : null);
        Ce(Ee, Ee.current & 1);
        break;
      case 19:
        if (((n = (r & t.childLanes) !== 0), (e.flags & 128) !== 0)) {
          if (n) return Lo(e, t, r);
          t.flags |= 128;
        }
        if (
          ((o = t.memoizedState),
          o !== null &&
            ((o.rendering = null), (o.tail = null), (o.lastEffect = null)),
          Ce(Ee, Ee.current),
          n)
        )
          break;
        return null;
      case 22:
      case 23:
        return (t.lanes = 0), xo(e, t, r);
    }
    return Bt(e, t, r);
  }
  var So, ri, No, bo;
  (So = function (e, t) {
    for (var r = t.child; r !== null; ) {
      if (r.tag === 5 || r.tag === 6) e.appendChild(r.stateNode);
      else if (r.tag !== 4 && r.child !== null) {
        (r.child.return = r), (r = r.child);
        continue;
      }
      if (r === t) break;
      for (; r.sibling === null; ) {
        if (r.return === null || r.return === t) return;
        r = r.return;
      }
      (r.sibling.return = r.return), (r = r.sibling);
    }
  }),
    (ri = function () {}),
    (No = function (e, t, r, n) {
      var o = e.memoizedProps;
      if (o !== n) {
        (e = t.stateNode), y1(bt.current);
        var u = null;
        switch (r) {
          case "input":
            (o = Rl(e, o)), (n = Rl(e, n)), (u = []);
            break;
          case "select":
            (o = W({}, o, { value: void 0 })),
              (n = W({}, n, { value: void 0 })),
              (u = []);
            break;
          case "textarea":
            (o = Ol(e, o)), (n = Ol(e, n)), (u = []);
            break;
          default:
            typeof o.onClick != "function" &&
              typeof n.onClick == "function" &&
              (e.onclick = bn);
        }
        Il(r, n);
        var f;
        r = null;
        for (D in o)
          if (!n.hasOwnProperty(D) && o.hasOwnProperty(D) && o[D] != null)
            if (D === "style") {
              var x = o[D];
              for (f in x) x.hasOwnProperty(f) && (r || (r = {}), (r[f] = ""));
            } else
              D !== "dangerouslySetInnerHTML" &&
                D !== "children" &&
                D !== "suppressContentEditableWarning" &&
                D !== "suppressHydrationWarning" &&
                D !== "autoFocus" &&
                (d.hasOwnProperty(D)
                  ? u || (u = [])
                  : (u = u || []).push(D, null));
        for (D in n) {
          var v = n[D];
          if (
            ((x = o != null ? o[D] : void 0),
            n.hasOwnProperty(D) && v !== x && (v != null || x != null))
          )
            if (D === "style")
              if (x) {
                for (f in x)
                  !x.hasOwnProperty(f) ||
                    (v && v.hasOwnProperty(f)) ||
                    (r || (r = {}), (r[f] = ""));
                for (f in v)
                  v.hasOwnProperty(f) &&
                    x[f] !== v[f] &&
                    (r || (r = {}), (r[f] = v[f]));
              } else r || (u || (u = []), u.push(D, r)), (r = v);
            else
              D === "dangerouslySetInnerHTML"
                ? ((v = v ? v.__html : void 0),
                  (x = x ? x.__html : void 0),
                  v != null && x !== v && (u = u || []).push(D, v))
                : D === "children"
                ? (typeof v != "string" && typeof v != "number") ||
                  (u = u || []).push(D, "" + v)
                : D !== "suppressContentEditableWarning" &&
                  D !== "suppressHydrationWarning" &&
                  (d.hasOwnProperty(D)
                    ? (v != null && D === "onScroll" && ge("scroll", e),
                      u || x === v || (u = []))
                    : (u = u || []).push(D, v));
        }
        r && (u = u || []).push("style", r);
        var D = u;
        (t.updateQueue = D) && (t.flags |= 4);
      }
    }),
    (bo = function (e, t, r, n) {
      r !== n && (t.flags |= 4);
    });
  function Zr(e, t) {
    if (!ye)
      switch (e.tailMode) {
        case "hidden":
          t = e.tail;
          for (var r = null; t !== null; )
            t.alternate !== null && (r = t), (t = t.sibling);
          r === null ? (e.tail = null) : (r.sibling = null);
          break;
        case "collapsed":
          r = e.tail;
          for (var n = null; r !== null; )
            r.alternate !== null && (n = r), (r = r.sibling);
          n === null
            ? t || e.tail === null
              ? (e.tail = null)
              : (e.tail.sibling = null)
            : (n.sibling = null);
      }
  }
  function $e(e) {
    var t = e.alternate !== null && e.alternate.child === e.child,
      r = 0,
      n = 0;
    if (t)
      for (var o = e.child; o !== null; )
        (r |= o.lanes | o.childLanes),
          (n |= o.subtreeFlags & 14680064),
          (n |= o.flags & 14680064),
          (o.return = e),
          (o = o.sibling);
    else
      for (o = e.child; o !== null; )
        (r |= o.lanes | o.childLanes),
          (n |= o.subtreeFlags),
          (n |= o.flags),
          (o.return = e),
          (o = o.sibling);
    return (e.subtreeFlags |= n), (e.childLanes = r), t;
  }
  function y4(e, t, r) {
    var n = t.pendingProps;
    switch ((L2(t), t.tag)) {
      case 2:
      case 16:
      case 15:
      case 0:
      case 11:
      case 7:
      case 8:
      case 12:
      case 9:
      case 14:
        return $e(t), null;
      case 1:
        return Je(t.type) && Dn(), $e(t), null;
      case 3:
        return (
          (n = t.stateNode),
          J1(),
          ve(Xe),
          ve(Ze),
          A2(),
          n.pendingContext &&
            ((n.context = n.pendingContext), (n.pendingContext = null)),
          (e === null || e.child === null) &&
            (On(t)
              ? (t.flags |= 4)
              : e === null ||
                (e.memoizedState.isDehydrated && (t.flags & 256) === 0) ||
                ((t.flags |= 1024), vt !== null && (mi(vt), (vt = null)))),
          ri(e, t),
          $e(t),
          null
        );
      case 5:
        T2(t);
        var o = y1(zr.current);
        if (((r = t.type), e !== null && t.stateNode != null))
          No(e, t, r, n, o),
            e.ref !== t.ref && ((t.flags |= 512), (t.flags |= 2097152));
        else {
          if (!n) {
            if (t.stateNode === null) throw Error(a(166));
            return $e(t), null;
          }
          if (((e = y1(bt.current)), On(t))) {
            (n = t.stateNode), (r = t.type);
            var u = t.memoizedProps;
            switch (((n[Nt] = t), (n[Or] = u), (e = (t.mode & 1) !== 0), r)) {
              case "dialog":
                ge("cancel", n), ge("close", n);
                break;
              case "iframe":
              case "object":
              case "embed":
                ge("load", n);
                break;
              case "video":
              case "audio":
                for (o = 0; o < Rr.length; o++) ge(Rr[o], n);
                break;
              case "source":
                ge("error", n);
                break;
              case "img":
              case "image":
              case "link":
                ge("error", n), ge("load", n);
                break;
              case "details":
                ge("toggle", n);
                break;
              case "input":
                s3(n, u), ge("invalid", n);
                break;
              case "select":
                (n._wrapperState = { wasMultiple: !!u.multiple }),
                  ge("invalid", n);
                break;
              case "textarea":
                u3(n, u), ge("invalid", n);
            }
            Il(r, u), (o = null);
            for (var f in u)
              if (u.hasOwnProperty(f)) {
                var x = u[f];
                f === "children"
                  ? typeof x == "string"
                    ? n.textContent !== x &&
                      (u.suppressHydrationWarning !== !0 &&
                        Nn(n.textContent, x, e),
                      (o = ["children", x]))
                    : typeof x == "number" &&
                      n.textContent !== "" + x &&
                      (u.suppressHydrationWarning !== !0 &&
                        Nn(n.textContent, x, e),
                      (o = ["children", "" + x]))
                  : d.hasOwnProperty(f) &&
                    x != null &&
                    f === "onScroll" &&
                    ge("scroll", n);
              }
            switch (r) {
              case "input":
                rn(n), a3(n, u, !0);
                break;
              case "textarea":
                rn(n), d3(n);
                break;
              case "select":
              case "option":
                break;
              default:
                typeof u.onClick == "function" && (n.onclick = bn);
            }
            (n = o), (t.updateQueue = n), n !== null && (t.flags |= 4);
          } else {
            (f = o.nodeType === 9 ? o : o.ownerDocument),
              e === "http://www.w3.org/1999/xhtml" && (e = f3(r)),
              e === "http://www.w3.org/1999/xhtml"
                ? r === "script"
                  ? ((e = f.createElement("div")),
                    (e.innerHTML = "<script></script>"),
                    (e = e.removeChild(e.firstChild)))
                  : typeof n.is == "string"
                  ? (e = f.createElement(r, { is: n.is }))
                  : ((e = f.createElement(r)),
                    r === "select" &&
                      ((f = e),
                      n.multiple
                        ? (f.multiple = !0)
                        : n.size && (f.size = n.size)))
                : (e = f.createElementNS(e, r)),
              (e[Nt] = t),
              (e[Or] = n),
              So(e, t, !1, !1),
              (t.stateNode = e);
            e: {
              switch (((f = Al(r, n)), r)) {
                case "dialog":
                  ge("cancel", e), ge("close", e), (o = n);
                  break;
                case "iframe":
                case "object":
                case "embed":
                  ge("load", e), (o = n);
                  break;
                case "video":
                case "audio":
                  for (o = 0; o < Rr.length; o++) ge(Rr[o], e);
                  o = n;
                  break;
                case "source":
                  ge("error", e), (o = n);
                  break;
                case "img":
                case "image":
                case "link":
                  ge("error", e), ge("load", e), (o = n);
                  break;
                case "details":
                  ge("toggle", e), (o = n);
                  break;
                case "input":
                  s3(e, n), (o = Rl(e, n)), ge("invalid", e);
                  break;
                case "option":
                  o = n;
                  break;
                case "select":
                  (e._wrapperState = { wasMultiple: !!n.multiple }),
                    (o = W({}, n, { value: void 0 })),
                    ge("invalid", e);
                  break;
                case "textarea":
                  u3(e, n), (o = Ol(e, n)), ge("invalid", e);
                  break;
                default:
                  o = n;
              }
              Il(r, o), (x = o);
              for (u in x)
                if (x.hasOwnProperty(u)) {
                  var v = x[u];
                  u === "style"
                    ? h3(e, v)
                    : u === "dangerouslySetInnerHTML"
                    ? ((v = v ? v.__html : void 0), v != null && m3(e, v))
                    : u === "children"
                    ? typeof v == "string"
                      ? (r !== "textarea" || v !== "") && fr(e, v)
                      : typeof v == "number" && fr(e, "" + v)
                    : u !== "suppressContentEditableWarning" &&
                      u !== "suppressHydrationWarning" &&
                      u !== "autoFocus" &&
                      (d.hasOwnProperty(u)
                        ? v != null && u === "onScroll" && ge("scroll", e)
                        : v != null && V(e, u, v, f));
                }
              switch (r) {
                case "input":
                  rn(e), a3(e, n, !1);
                  break;
                case "textarea":
                  rn(e), d3(e);
                  break;
                case "option":
                  n.value != null && e.setAttribute("value", "" + me(n.value));
                  break;
                case "select":
                  (e.multiple = !!n.multiple),
                    (u = n.value),
                    u != null
                      ? P1(e, !!n.multiple, u, !1)
                      : n.defaultValue != null &&
                        P1(e, !!n.multiple, n.defaultValue, !0);
                  break;
                default:
                  typeof o.onClick == "function" && (e.onclick = bn);
              }
              switch (r) {
                case "button":
                case "input":
                case "select":
                case "textarea":
                  n = !!n.autoFocus;
                  break e;
                case "img":
                  n = !0;
                  break e;
                default:
                  n = !1;
              }
            }
            n && (t.flags |= 4);
          }
          t.ref !== null && ((t.flags |= 512), (t.flags |= 2097152));
        }
        return $e(t), null;
      case 6:
        if (e && t.stateNode != null) bo(e, t, e.memoizedProps, n);
        else {
          if (typeof n != "string" && t.stateNode === null) throw Error(a(166));
          if (((r = y1(zr.current)), y1(bt.current), On(t))) {
            if (
              ((n = t.stateNode),
              (r = t.memoizedProps),
              (n[Nt] = t),
              (u = n.nodeValue !== r) && ((e = ot), e !== null))
            )
              switch (e.tag) {
                case 3:
                  Nn(n.nodeValue, r, (e.mode & 1) !== 0);
                  break;
                case 5:
                  e.memoizedProps.suppressHydrationWarning !== !0 &&
                    Nn(n.nodeValue, r, (e.mode & 1) !== 0);
              }
            u && (t.flags |= 4);
          } else
            (n = (r.nodeType === 9 ? r : r.ownerDocument).createTextNode(n)),
              (n[Nt] = t),
              (t.stateNode = n);
        }
        return $e(t), null;
      case 13:
        if (
          (ve(Ee),
          (n = t.memoizedState),
          e === null ||
            (e.memoizedState !== null && e.memoizedState.dehydrated !== null))
        ) {
          if (ye && at !== null && (t.mode & 1) !== 0 && (t.flags & 128) === 0)
            Ds(), K1(), (t.flags |= 98560), (u = !1);
          else if (((u = On(t)), n !== null && n.dehydrated !== null)) {
            if (e === null) {
              if (!u) throw Error(a(318));
              if (
                ((u = t.memoizedState),
                (u = u !== null ? u.dehydrated : null),
                !u)
              )
                throw Error(a(317));
              u[Nt] = t;
            } else
              K1(),
                (t.flags & 128) === 0 && (t.memoizedState = null),
                (t.flags |= 4);
            $e(t), (u = !1);
          } else vt !== null && (mi(vt), (vt = null)), (u = !0);
          if (!u) return t.flags & 65536 ? t : null;
        }
        return (t.flags & 128) !== 0
          ? ((t.lanes = r), t)
          : ((n = n !== null),
            n !== (e !== null && e.memoizedState !== null) &&
              n &&
              ((t.child.flags |= 8192),
              (t.mode & 1) !== 0 &&
                (e === null || (Ee.current & 1) !== 0
                  ? Oe === 0 && (Oe = 3)
                  : Ci())),
            t.updateQueue !== null && (t.flags |= 4),
            $e(t),
            null);
      case 4:
        return (
          J1(),
          ri(e, t),
          e === null && Mr(t.stateNode.containerInfo),
          $e(t),
          null
        );
      case 10:
        return _2(t.type._context), $e(t), null;
      case 17:
        return Je(t.type) && Dn(), $e(t), null;
      case 19:
        if ((ve(Ee), (u = t.memoizedState), u === null)) return $e(t), null;
        if (((n = (t.flags & 128) !== 0), (f = u.rendering), f === null))
          if (n) Zr(u, !1);
          else {
            if (Oe !== 0 || (e !== null && (e.flags & 128) !== 0))
              for (e = t.child; e !== null; ) {
                if (((f = Fn(e)), f !== null)) {
                  for (
                    t.flags |= 128,
                      Zr(u, !1),
                      n = f.updateQueue,
                      n !== null && ((t.updateQueue = n), (t.flags |= 4)),
                      t.subtreeFlags = 0,
                      n = r,
                      r = t.child;
                    r !== null;

                  )
                    (u = r),
                      (e = n),
                      (u.flags &= 14680066),
                      (f = u.alternate),
                      f === null
                        ? ((u.childLanes = 0),
                          (u.lanes = e),
                          (u.child = null),
                          (u.subtreeFlags = 0),
                          (u.memoizedProps = null),
                          (u.memoizedState = null),
                          (u.updateQueue = null),
                          (u.dependencies = null),
                          (u.stateNode = null))
                        : ((u.childLanes = f.childLanes),
                          (u.lanes = f.lanes),
                          (u.child = f.child),
                          (u.subtreeFlags = 0),
                          (u.deletions = null),
                          (u.memoizedProps = f.memoizedProps),
                          (u.memoizedState = f.memoizedState),
                          (u.updateQueue = f.updateQueue),
                          (u.type = f.type),
                          (e = f.dependencies),
                          (u.dependencies =
                            e === null
                              ? null
                              : {
                                  lanes: e.lanes,
                                  firstContext: e.firstContext,
                                })),
                      (r = r.sibling);
                  return Ce(Ee, (Ee.current & 1) | 2), t.child;
                }
                e = e.sibling;
              }
            u.tail !== null &&
              ke() > rr &&
              ((t.flags |= 128), (n = !0), Zr(u, !1), (t.lanes = 4194304));
          }
        else {
          if (!n)
            if (((e = Fn(f)), e !== null)) {
              if (
                ((t.flags |= 128),
                (n = !0),
                (r = e.updateQueue),
                r !== null && ((t.updateQueue = r), (t.flags |= 4)),
                Zr(u, !0),
                u.tail === null &&
                  u.tailMode === "hidden" &&
                  !f.alternate &&
                  !ye)
              )
                return $e(t), null;
            } else
              2 * ke() - u.renderingStartTime > rr &&
                r !== 1073741824 &&
                ((t.flags |= 128), (n = !0), Zr(u, !1), (t.lanes = 4194304));
          u.isBackwards
            ? ((f.sibling = t.child), (t.child = f))
            : ((r = u.last),
              r !== null ? (r.sibling = f) : (t.child = f),
              (u.last = f));
        }
        return u.tail !== null
          ? ((t = u.tail),
            (u.rendering = t),
            (u.tail = t.sibling),
            (u.renderingStartTime = ke()),
            (t.sibling = null),
            (r = Ee.current),
            Ce(Ee, n ? (r & 1) | 2 : r & 1),
            t)
          : ($e(t), null);
      case 22:
      case 23:
        return (
          hi(),
          (n = t.memoizedState !== null),
          e !== null && (e.memoizedState !== null) !== n && (t.flags |= 8192),
          n && (t.mode & 1) !== 0
            ? (ut & 1073741824) !== 0 &&
              ($e(t), t.subtreeFlags & 6 && (t.flags |= 8192))
            : $e(t),
          null
        );
      case 24:
        return null;
      case 25:
        return null;
    }
    throw Error(a(156, t.tag));
  }
  function j4(e, t) {
    switch ((L2(t), t.tag)) {
      case 1:
        return (
          Je(t.type) && Dn(),
          (e = t.flags),
          e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
        );
      case 3:
        return (
          J1(),
          ve(Xe),
          ve(Ze),
          A2(),
          (e = t.flags),
          (e & 65536) !== 0 && (e & 128) === 0
            ? ((t.flags = (e & -65537) | 128), t)
            : null
        );
      case 5:
        return T2(t), null;
      case 13:
        if (
          (ve(Ee), (e = t.memoizedState), e !== null && e.dehydrated !== null)
        ) {
          if (t.alternate === null) throw Error(a(340));
          K1();
        }
        return (
          (e = t.flags), e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
        );
      case 19:
        return ve(Ee), null;
      case 4:
        return J1(), null;
      case 10:
        return _2(t.type._context), null;
      case 22:
      case 23:
        return hi(), null;
      case 24:
        return null;
      default:
        return null;
    }
  }
  var Qn = !1,
    Ge = !1,
    E4 = typeof WeakSet == "function" ? WeakSet : Set,
    Z = null;
  function er(e, t) {
    var r = e.ref;
    if (r !== null)
      if (typeof r == "function")
        try {
          r(null);
        } catch (n) {
          Ne(e, t, n);
        }
      else r.current = null;
  }
  function ni(e, t, r) {
    try {
      r();
    } catch (n) {
      Ne(e, t, n);
    }
  }
  var ko = !1;
  function L4(e, t) {
    if (((h2 = hn), (e = is()), o2(e))) {
      if ("selectionStart" in e)
        var r = { start: e.selectionStart, end: e.selectionEnd };
      else
        e: {
          r = ((r = e.ownerDocument) && r.defaultView) || window;
          var n = r.getSelection && r.getSelection();
          if (n && n.rangeCount !== 0) {
            r = n.anchorNode;
            var o = n.anchorOffset,
              u = n.focusNode;
            n = n.focusOffset;
            try {
              r.nodeType, u.nodeType;
            } catch {
              r = null;
              break e;
            }
            var f = 0,
              x = -1,
              v = -1,
              D = 0,
              I = 0,
              A = e,
              O = null;
            t: for (;;) {
              for (
                var U;
                A !== r || (o !== 0 && A.nodeType !== 3) || (x = f + o),
                  A !== u || (n !== 0 && A.nodeType !== 3) || (v = f + n),
                  A.nodeType === 3 && (f += A.nodeValue.length),
                  (U = A.firstChild) !== null;

              )
                (O = A), (A = U);
              for (;;) {
                if (A === e) break t;
                if (
                  (O === r && ++D === o && (x = f),
                  O === u && ++I === n && (v = f),
                  (U = A.nextSibling) !== null)
                )
                  break;
                (A = O), (O = A.parentNode);
              }
              A = U;
            }
            r = x === -1 || v === -1 ? null : { start: x, end: v };
          } else r = null;
        }
      r = r || { start: 0, end: 0 };
    } else r = null;
    for (
      C2 = { focusedElem: e, selectionRange: r }, hn = !1, Z = t;
      Z !== null;

    )
      if (((t = Z), (e = t.child), (t.subtreeFlags & 1028) !== 0 && e !== null))
        (e.return = t), (Z = e);
      else
        for (; Z !== null; ) {
          t = Z;
          try {
            var $ = t.alternate;
            if ((t.flags & 1024) !== 0)
              switch (t.tag) {
                case 0:
                case 11:
                case 15:
                  break;
                case 1:
                  if ($ !== null) {
                    var G = $.memoizedProps,
                      De = $.memoizedState,
                      N = t.stateNode,
                      j = N.getSnapshotBeforeUpdate(
                        t.elementType === t.type ? G : wt(t.type, G),
                        De
                      );
                    N.__reactInternalSnapshotBeforeUpdate = j;
                  }
                  break;
                case 3:
                  var k = t.stateNode.containerInfo;
                  k.nodeType === 1
                    ? (k.textContent = "")
                    : k.nodeType === 9 &&
                      k.documentElement &&
                      k.removeChild(k.documentElement);
                  break;
                case 5:
                case 6:
                case 4:
                case 17:
                  break;
                default:
                  throw Error(a(163));
              }
          } catch (B) {
            Ne(t, t.return, B);
          }
          if (((e = t.sibling), e !== null)) {
            (e.return = t.return), (Z = e);
            break;
          }
          Z = t.return;
        }
    return ($ = ko), (ko = !1), $;
  }
  function Wr(e, t, r) {
    var n = t.updateQueue;
    if (((n = n !== null ? n.lastEffect : null), n !== null)) {
      var o = (n = n.next);
      do {
        if ((o.tag & e) === e) {
          var u = o.destroy;
          (o.destroy = void 0), u !== void 0 && ni(t, r, u);
        }
        o = o.next;
      } while (o !== n);
    }
  }
  function Yn(e, t) {
    if (
      ((t = t.updateQueue), (t = t !== null ? t.lastEffect : null), t !== null)
    ) {
      var r = (t = t.next);
      do {
        if ((r.tag & e) === e) {
          var n = r.create;
          r.destroy = n();
        }
        r = r.next;
      } while (r !== t);
    }
  }
  function li(e) {
    var t = e.ref;
    if (t !== null) {
      var r = e.stateNode;
      switch (e.tag) {
        case 5:
          e = r;
          break;
        default:
          e = r;
      }
      typeof t == "function" ? t(e) : (t.current = e);
    }
  }
  function Do(e) {
    var t = e.alternate;
    t !== null && ((e.alternate = null), Do(t)),
      (e.child = null),
      (e.deletions = null),
      (e.sibling = null),
      e.tag === 5 &&
        ((t = e.stateNode),
        t !== null &&
          (delete t[Nt],
          delete t[Or],
          delete t[w2],
          delete t[s4],
          delete t[o4])),
      (e.stateNode = null),
      (e.return = null),
      (e.dependencies = null),
      (e.memoizedProps = null),
      (e.memoizedState = null),
      (e.pendingProps = null),
      (e.stateNode = null),
      (e.updateQueue = null);
  }
  function _o(e) {
    return e.tag === 5 || e.tag === 3 || e.tag === 4;
  }
  function Ro(e) {
    e: for (;;) {
      for (; e.sibling === null; ) {
        if (e.return === null || _o(e.return)) return null;
        e = e.return;
      }
      for (
        e.sibling.return = e.return, e = e.sibling;
        e.tag !== 5 && e.tag !== 6 && e.tag !== 18;

      ) {
        if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
        (e.child.return = e), (e = e.child);
      }
      if (!(e.flags & 2)) return e.stateNode;
    }
  }
  function ii(e, t, r) {
    var n = e.tag;
    if (n === 5 || n === 6)
      (e = e.stateNode),
        t
          ? r.nodeType === 8
            ? r.parentNode.insertBefore(e, t)
            : r.insertBefore(e, t)
          : (r.nodeType === 8
              ? ((t = r.parentNode), t.insertBefore(e, r))
              : ((t = r), t.appendChild(e)),
            (r = r._reactRootContainer),
            r != null || t.onclick !== null || (t.onclick = bn));
    else if (n !== 4 && ((e = e.child), e !== null))
      for (ii(e, t, r), e = e.sibling; e !== null; )
        ii(e, t, r), (e = e.sibling);
  }
  function si(e, t, r) {
    var n = e.tag;
    if (n === 5 || n === 6)
      (e = e.stateNode), t ? r.insertBefore(e, t) : r.appendChild(e);
    else if (n !== 4 && ((e = e.child), e !== null))
      for (si(e, t, r), e = e.sibling; e !== null; )
        si(e, t, r), (e = e.sibling);
  }
  var Fe = null,
    yt = !1;
  function Jt(e, t, r) {
    for (r = r.child; r !== null; ) Mo(e, t, r), (r = r.sibling);
  }
  function Mo(e, t, r) {
    if (St && typeof St.onCommitFiberUnmount == "function")
      try {
        St.onCommitFiberUnmount(un, r);
      } catch {}
    switch (r.tag) {
      case 5:
        Ge || er(r, t);
      case 6:
        var n = Fe,
          o = yt;
        (Fe = null),
          Jt(e, t, r),
          (Fe = n),
          (yt = o),
          Fe !== null &&
            (yt
              ? ((e = Fe),
                (r = r.stateNode),
                e.nodeType === 8
                  ? e.parentNode.removeChild(r)
                  : e.removeChild(r))
              : Fe.removeChild(r.stateNode));
        break;
      case 18:
        Fe !== null &&
          (yt
            ? ((e = Fe),
              (r = r.stateNode),
              e.nodeType === 8
                ? v2(e.parentNode, r)
                : e.nodeType === 1 && v2(e, r),
              Er(e))
            : v2(Fe, r.stateNode));
        break;
      case 4:
        (n = Fe),
          (o = yt),
          (Fe = r.stateNode.containerInfo),
          (yt = !0),
          Jt(e, t, r),
          (Fe = n),
          (yt = o);
        break;
      case 0:
      case 11:
      case 14:
      case 15:
        if (
          !Ge &&
          ((n = r.updateQueue), n !== null && ((n = n.lastEffect), n !== null))
        ) {
          o = n = n.next;
          do {
            var u = o,
              f = u.destroy;
            (u = u.tag),
              f !== void 0 && ((u & 2) !== 0 || (u & 4) !== 0) && ni(r, t, f),
              (o = o.next);
          } while (o !== n);
        }
        Jt(e, t, r);
        break;
      case 1:
        if (
          !Ge &&
          (er(r, t),
          (n = r.stateNode),
          typeof n.componentWillUnmount == "function")
        )
          try {
            (n.props = r.memoizedProps),
              (n.state = r.memoizedState),
              n.componentWillUnmount();
          } catch (x) {
            Ne(r, t, x);
          }
        Jt(e, t, r);
        break;
      case 21:
        Jt(e, t, r);
        break;
      case 22:
        r.mode & 1
          ? ((Ge = (n = Ge) || r.memoizedState !== null), Jt(e, t, r), (Ge = n))
          : Jt(e, t, r);
        break;
      default:
        Jt(e, t, r);
    }
  }
  function Po(e) {
    var t = e.updateQueue;
    if (t !== null) {
      e.updateQueue = null;
      var r = e.stateNode;
      r === null && (r = e.stateNode = new E4()),
        t.forEach(function (n) {
          var o = P4.bind(null, e, n);
          r.has(n) || (r.add(n), n.then(o, o));
        });
    }
  }
  function jt(e, t) {
    var r = t.deletions;
    if (r !== null)
      for (var n = 0; n < r.length; n++) {
        var o = r[n];
        try {
          var u = e,
            f = t,
            x = f;
          e: for (; x !== null; ) {
            switch (x.tag) {
              case 5:
                (Fe = x.stateNode), (yt = !1);
                break e;
              case 3:
                (Fe = x.stateNode.containerInfo), (yt = !0);
                break e;
              case 4:
                (Fe = x.stateNode.containerInfo), (yt = !0);
                break e;
            }
            x = x.return;
          }
          if (Fe === null) throw Error(a(160));
          Mo(u, f, o), (Fe = null), (yt = !1);
          var v = o.alternate;
          v !== null && (v.return = null), (o.return = null);
        } catch (D) {
          Ne(o, t, D);
        }
      }
    if (t.subtreeFlags & 12854)
      for (t = t.child; t !== null; ) Oo(t, e), (t = t.sibling);
  }
  function Oo(e, t) {
    var r = e.alternate,
      n = e.flags;
    switch (e.tag) {
      case 0:
      case 11:
      case 14:
      case 15:
        if ((jt(t, e), Dt(e), n & 4)) {
          try {
            Wr(3, e, e.return), Yn(3, e);
          } catch (G) {
            Ne(e, e.return, G);
          }
          try {
            Wr(5, e, e.return);
          } catch (G) {
            Ne(e, e.return, G);
          }
        }
        break;
      case 1:
        jt(t, e), Dt(e), n & 512 && r !== null && er(r, r.return);
        break;
      case 5:
        if (
          (jt(t, e),
          Dt(e),
          n & 512 && r !== null && er(r, r.return),
          e.flags & 32)
        ) {
          var o = e.stateNode;
          try {
            fr(o, "");
          } catch (G) {
            Ne(e, e.return, G);
          }
        }
        if (n & 4 && ((o = e.stateNode), o != null)) {
          var u = e.memoizedProps,
            f = r !== null ? r.memoizedProps : u,
            x = e.type,
            v = e.updateQueue;
          if (((e.updateQueue = null), v !== null))
            try {
              x === "input" && u.type === "radio" && u.name != null && o3(o, u),
                Al(x, f);
              var D = Al(x, u);
              for (f = 0; f < v.length; f += 2) {
                var I = v[f],
                  A = v[f + 1];
                I === "style"
                  ? h3(o, A)
                  : I === "dangerouslySetInnerHTML"
                  ? m3(o, A)
                  : I === "children"
                  ? fr(o, A)
                  : V(o, I, A, D);
              }
              switch (x) {
                case "input":
                  Ml(o, u);
                  break;
                case "textarea":
                  c3(o, u);
                  break;
                case "select":
                  var O = o._wrapperState.wasMultiple;
                  o._wrapperState.wasMultiple = !!u.multiple;
                  var U = u.value;
                  U != null
                    ? P1(o, !!u.multiple, U, !1)
                    : O !== !!u.multiple &&
                      (u.defaultValue != null
                        ? P1(o, !!u.multiple, u.defaultValue, !0)
                        : P1(o, !!u.multiple, u.multiple ? [] : "", !1));
              }
              o[Or] = u;
            } catch (G) {
              Ne(e, e.return, G);
            }
        }
        break;
      case 6:
        if ((jt(t, e), Dt(e), n & 4)) {
          if (e.stateNode === null) throw Error(a(162));
          (o = e.stateNode), (u = e.memoizedProps);
          try {
            o.nodeValue = u;
          } catch (G) {
            Ne(e, e.return, G);
          }
        }
        break;
      case 3:
        if (
          (jt(t, e), Dt(e), n & 4 && r !== null && r.memoizedState.isDehydrated)
        )
          try {
            Er(t.containerInfo);
          } catch (G) {
            Ne(e, e.return, G);
          }
        break;
      case 4:
        jt(t, e), Dt(e);
        break;
      case 13:
        jt(t, e),
          Dt(e),
          (o = e.child),
          o.flags & 8192 &&
            ((u = o.memoizedState !== null),
            (o.stateNode.isHidden = u),
            !u ||
              (o.alternate !== null && o.alternate.memoizedState !== null) ||
              (ui = ke())),
          n & 4 && Po(e);
        break;
      case 22:
        if (
          ((I = r !== null && r.memoizedState !== null),
          e.mode & 1 ? ((Ge = (D = Ge) || I), jt(t, e), (Ge = D)) : jt(t, e),
          Dt(e),
          n & 8192)
        ) {
          if (
            ((D = e.memoizedState !== null),
            (e.stateNode.isHidden = D) && !I && (e.mode & 1) !== 0)
          )
            for (Z = e, I = e.child; I !== null; ) {
              for (A = Z = I; Z !== null; ) {
                switch (((O = Z), (U = O.child), O.tag)) {
                  case 0:
                  case 11:
                  case 14:
                  case 15:
                    Wr(4, O, O.return);
                    break;
                  case 1:
                    er(O, O.return);
                    var $ = O.stateNode;
                    if (typeof $.componentWillUnmount == "function") {
                      (n = O), (r = O.return);
                      try {
                        (t = n),
                          ($.props = t.memoizedProps),
                          ($.state = t.memoizedState),
                          $.componentWillUnmount();
                      } catch (G) {
                        Ne(n, r, G);
                      }
                    }
                    break;
                  case 5:
                    er(O, O.return);
                    break;
                  case 22:
                    if (O.memoizedState !== null) {
                      Ao(A);
                      continue;
                    }
                }
                U !== null ? ((U.return = O), (Z = U)) : Ao(A);
              }
              I = I.sibling;
            }
          e: for (I = null, A = e; ; ) {
            if (A.tag === 5) {
              if (I === null) {
                I = A;
                try {
                  (o = A.stateNode),
                    D
                      ? ((u = o.style),
                        typeof u.setProperty == "function"
                          ? u.setProperty("display", "none", "important")
                          : (u.display = "none"))
                      : ((x = A.stateNode),
                        (v = A.memoizedProps.style),
                        (f =
                          v != null && v.hasOwnProperty("display")
                            ? v.display
                            : null),
                        (x.style.display = p3("display", f)));
                } catch (G) {
                  Ne(e, e.return, G);
                }
              }
            } else if (A.tag === 6) {
              if (I === null)
                try {
                  A.stateNode.nodeValue = D ? "" : A.memoizedProps;
                } catch (G) {
                  Ne(e, e.return, G);
                }
            } else if (
              ((A.tag !== 22 && A.tag !== 23) ||
                A.memoizedState === null ||
                A === e) &&
              A.child !== null
            ) {
              (A.child.return = A), (A = A.child);
              continue;
            }
            if (A === e) break e;
            for (; A.sibling === null; ) {
              if (A.return === null || A.return === e) break e;
              I === A && (I = null), (A = A.return);
            }
            I === A && (I = null),
              (A.sibling.return = A.return),
              (A = A.sibling);
          }
        }
        break;
      case 19:
        jt(t, e), Dt(e), n & 4 && Po(e);
        break;
      case 21:
        break;
      default:
        jt(t, e), Dt(e);
    }
  }
  function Dt(e) {
    var t = e.flags;
    if (t & 2) {
      try {
        e: {
          for (var r = e.return; r !== null; ) {
            if (_o(r)) {
              var n = r;
              break e;
            }
            r = r.return;
          }
          throw Error(a(160));
        }
        switch (n.tag) {
          case 5:
            var o = n.stateNode;
            n.flags & 32 && (fr(o, ""), (n.flags &= -33));
            var u = Ro(e);
            si(e, u, o);
            break;
          case 3:
          case 4:
            var f = n.stateNode.containerInfo,
              x = Ro(e);
            ii(e, x, f);
            break;
          default:
            throw Error(a(161));
        }
      } catch (v) {
        Ne(e, e.return, v);
      }
      e.flags &= -3;
    }
    t & 4096 && (e.flags &= -4097);
  }
  function S4(e, t, r) {
    (Z = e), To(e);
  }
  function To(e, t, r) {
    for (var n = (e.mode & 1) !== 0; Z !== null; ) {
      var o = Z,
        u = o.child;
      if (o.tag === 22 && n) {
        var f = o.memoizedState !== null || Qn;
        if (!f) {
          var x = o.alternate,
            v = (x !== null && x.memoizedState !== null) || Ge;
          x = Qn;
          var D = Ge;
          if (((Qn = f), (Ge = v) && !D))
            for (Z = o; Z !== null; )
              (f = Z),
                (v = f.child),
                f.tag === 22 && f.memoizedState !== null
                  ? Bo(o)
                  : v !== null
                  ? ((v.return = f), (Z = v))
                  : Bo(o);
          for (; u !== null; ) (Z = u), To(u), (u = u.sibling);
          (Z = o), (Qn = x), (Ge = D);
        }
        Io(e);
      } else
        (o.subtreeFlags & 8772) !== 0 && u !== null
          ? ((u.return = o), (Z = u))
          : Io(e);
    }
  }
  function Io(e) {
    for (; Z !== null; ) {
      var t = Z;
      if ((t.flags & 8772) !== 0) {
        var r = t.alternate;
        try {
          if ((t.flags & 8772) !== 0)
            switch (t.tag) {
              case 0:
              case 11:
              case 15:
                Ge || Yn(5, t);
                break;
              case 1:
                var n = t.stateNode;
                if (t.flags & 4 && !Ge)
                  if (r === null) n.componentDidMount();
                  else {
                    var o =
                      t.elementType === t.type
                        ? r.memoizedProps
                        : wt(t.type, r.memoizedProps);
                    n.componentDidUpdate(
                      o,
                      r.memoizedState,
                      n.__reactInternalSnapshotBeforeUpdate
                    );
                  }
                var u = t.updateQueue;
                u !== null && Is(t, u, n);
                break;
              case 3:
                var f = t.updateQueue;
                if (f !== null) {
                  if (((r = null), t.child !== null))
                    switch (t.child.tag) {
                      case 5:
                        r = t.child.stateNode;
                        break;
                      case 1:
                        r = t.child.stateNode;
                    }
                  Is(t, f, r);
                }
                break;
              case 5:
                var x = t.stateNode;
                if (r === null && t.flags & 4) {
                  r = x;
                  var v = t.memoizedProps;
                  switch (t.type) {
                    case "button":
                    case "input":
                    case "select":
                    case "textarea":
                      v.autoFocus && r.focus();
                      break;
                    case "img":
                      v.src && (r.src = v.src);
                  }
                }
                break;
              case 6:
                break;
              case 4:
                break;
              case 12:
                break;
              case 13:
                if (t.memoizedState === null) {
                  var D = t.alternate;
                  if (D !== null) {
                    var I = D.memoizedState;
                    if (I !== null) {
                      var A = I.dehydrated;
                      A !== null && Er(A);
                    }
                  }
                }
                break;
              case 19:
              case 17:
              case 21:
              case 22:
              case 23:
              case 25:
                break;
              default:
                throw Error(a(163));
            }
          Ge || (t.flags & 512 && li(t));
        } catch (O) {
          Ne(t, t.return, O);
        }
      }
      if (t === e) {
        Z = null;
        break;
      }
      if (((r = t.sibling), r !== null)) {
        (r.return = t.return), (Z = r);
        break;
      }
      Z = t.return;
    }
  }
  function Ao(e) {
    for (; Z !== null; ) {
      var t = Z;
      if (t === e) {
        Z = null;
        break;
      }
      var r = t.sibling;
      if (r !== null) {
        (r.return = t.return), (Z = r);
        break;
      }
      Z = t.return;
    }
  }
  function Bo(e) {
    for (; Z !== null; ) {
      var t = Z;
      try {
        switch (t.tag) {
          case 0:
          case 11:
          case 15:
            var r = t.return;
            try {
              Yn(4, t);
            } catch (v) {
              Ne(t, r, v);
            }
            break;
          case 1:
            var n = t.stateNode;
            if (typeof n.componentDidMount == "function") {
              var o = t.return;
              try {
                n.componentDidMount();
              } catch (v) {
                Ne(t, o, v);
              }
            }
            var u = t.return;
            try {
              li(t);
            } catch (v) {
              Ne(t, u, v);
            }
            break;
          case 5:
            var f = t.return;
            try {
              li(t);
            } catch (v) {
              Ne(t, f, v);
            }
        }
      } catch (v) {
        Ne(t, t.return, v);
      }
      if (t === e) {
        Z = null;
        break;
      }
      var x = t.sibling;
      if (x !== null) {
        (x.return = t.return), (Z = x);
        break;
      }
      Z = t.return;
    }
  }
  var N4 = Math.ceil,
    Xn = F.ReactCurrentDispatcher,
    oi = F.ReactCurrentOwner,
    ht = F.ReactCurrentBatchConfig,
    oe = 0,
    Be = null,
    Re = null,
    Ve = 0,
    ut = 0,
    tr = Gt(0),
    Oe = 0,
    $r = null,
    E1 = 0,
    Jn = 0,
    ai = 0,
    Gr = null,
    et = null,
    ui = 0,
    rr = 1 / 0,
    zt = null,
    qn = !1,
    ci = null,
    qt = null,
    el = !1,
    e1 = null,
    tl = 0,
    Kr = 0,
    di = null,
    rl = -1,
    nl = 0;
  function Ye() {
    return (oe & 6) !== 0 ? ke() : rl !== -1 ? rl : (rl = ke());
  }
  function t1(e) {
    return (e.mode & 1) === 0
      ? 1
      : (oe & 2) !== 0 && Ve !== 0
      ? Ve & -Ve
      : u4.transition !== null
      ? (nl === 0 && (nl = _3()), nl)
      : ((e = pe),
        e !== 0 || ((e = window.event), (e = e === void 0 ? 16 : z3(e.type))),
        e);
  }
  function Et(e, t, r, n) {
    if (50 < Kr) throw ((Kr = 0), (di = null), Error(a(185)));
    gr(e, r, n),
      ((oe & 2) === 0 || e !== Be) &&
        (e === Be && ((oe & 2) === 0 && (Jn |= r), Oe === 4 && r1(e, Ve)),
        tt(e, n),
        r === 1 &&
          oe === 0 &&
          (t.mode & 1) === 0 &&
          ((rr = ke() + 500), Rn && Qt()));
  }
  function tt(e, t) {
    var r = e.callbackNode;
    u5(e, t);
    var n = fn(e, e === Be ? Ve : 0);
    if (n === 0)
      r !== null && b3(r), (e.callbackNode = null), (e.callbackPriority = 0);
    else if (((t = n & -n), e.callbackPriority !== t)) {
      if ((r != null && b3(r), t === 1))
        e.tag === 0 ? a4(Fo.bind(null, e)) : Ls(Fo.bind(null, e)),
          l4(function () {
            (oe & 6) === 0 && Qt();
          }),
          (r = null);
      else {
        switch (R3(n)) {
          case 1:
            r = Zl;
            break;
          case 4:
            r = k3;
            break;
          case 16:
            r = an;
            break;
          case 536870912:
            r = D3;
            break;
          default:
            r = an;
        }
        r = Ko(r, zo.bind(null, e));
      }
      (e.callbackPriority = t), (e.callbackNode = r);
    }
  }
  function zo(e, t) {
    if (((rl = -1), (nl = 0), (oe & 6) !== 0)) throw Error(a(327));
    var r = e.callbackNode;
    if (nr() && e.callbackNode !== r) return null;
    var n = fn(e, e === Be ? Ve : 0);
    if (n === 0) return null;
    if ((n & 30) !== 0 || (n & e.expiredLanes) !== 0 || t) t = ll(e, n);
    else {
      t = n;
      var o = oe;
      oe |= 2;
      var u = Uo();
      (Be !== e || Ve !== t) && ((zt = null), (rr = ke() + 500), S1(e, t));
      do
        try {
          D4();
          break;
        } catch (x) {
          Vo(e, x);
        }
      while (!0);
      D2(),
        (Xn.current = u),
        (oe = o),
        Re !== null ? (t = 0) : ((Be = null), (Ve = 0), (t = Oe));
    }
    if (t !== 0) {
      if (
        (t === 2 && ((o = Wl(e)), o !== 0 && ((n = o), (t = fi(e, o)))),
        t === 1)
      )
        throw ((r = $r), S1(e, 0), r1(e, n), tt(e, ke()), r);
      if (t === 6) r1(e, n);
      else {
        if (
          ((o = e.current.alternate),
          (n & 30) === 0 &&
            !b4(o) &&
            ((t = ll(e, n)),
            t === 2 && ((u = Wl(e)), u !== 0 && ((n = u), (t = fi(e, u)))),
            t === 1))
        )
          throw ((r = $r), S1(e, 0), r1(e, n), tt(e, ke()), r);
        switch (((e.finishedWork = o), (e.finishedLanes = n), t)) {
          case 0:
          case 1:
            throw Error(a(345));
          case 2:
            N1(e, et, zt);
            break;
          case 3:
            if (
              (r1(e, n),
              (n & 130023424) === n && ((t = ui + 500 - ke()), 10 < t))
            ) {
              if (fn(e, 0) !== 0) break;
              if (((o = e.suspendedLanes), (o & n) !== n)) {
                Ye(), (e.pingedLanes |= e.suspendedLanes & o);
                break;
              }
              e.timeoutHandle = g2(N1.bind(null, e, et, zt), t);
              break;
            }
            N1(e, et, zt);
            break;
          case 4:
            if ((r1(e, n), (n & 4194240) === n)) break;
            for (t = e.eventTimes, o = -1; 0 < n; ) {
              var f = 31 - xt(n);
              (u = 1 << f), (f = t[f]), f > o && (o = f), (n &= ~u);
            }
            if (
              ((n = o),
              (n = ke() - n),
              (n =
                (120 > n
                  ? 120
                  : 480 > n
                  ? 480
                  : 1080 > n
                  ? 1080
                  : 1920 > n
                  ? 1920
                  : 3e3 > n
                  ? 3e3
                  : 4320 > n
                  ? 4320
                  : 1960 * N4(n / 1960)) - n),
              10 < n)
            ) {
              e.timeoutHandle = g2(N1.bind(null, e, et, zt), n);
              break;
            }
            N1(e, et, zt);
            break;
          case 5:
            N1(e, et, zt);
            break;
          default:
            throw Error(a(329));
        }
      }
    }
    return tt(e, ke()), e.callbackNode === r ? zo.bind(null, e) : null;
  }
  function fi(e, t) {
    var r = Gr;
    return (
      e.current.memoizedState.isDehydrated && (S1(e, t).flags |= 256),
      (e = ll(e, t)),
      e !== 2 && ((t = et), (et = r), t !== null && mi(t)),
      e
    );
  }
  function mi(e) {
    et === null ? (et = e) : et.push.apply(et, e);
  }
  function b4(e) {
    for (var t = e; ; ) {
      if (t.flags & 16384) {
        var r = t.updateQueue;
        if (r !== null && ((r = r.stores), r !== null))
          for (var n = 0; n < r.length; n++) {
            var o = r[n],
              u = o.getSnapshot;
            o = o.value;
            try {
              if (!gt(u(), o)) return !1;
            } catch {
              return !1;
            }
          }
      }
      if (((r = t.child), t.subtreeFlags & 16384 && r !== null))
        (r.return = t), (t = r);
      else {
        if (t === e) break;
        for (; t.sibling === null; ) {
          if (t.return === null || t.return === e) return !0;
          t = t.return;
        }
        (t.sibling.return = t.return), (t = t.sibling);
      }
    }
    return !0;
  }
  function r1(e, t) {
    for (
      t &= ~ai,
        t &= ~Jn,
        e.suspendedLanes |= t,
        e.pingedLanes &= ~t,
        e = e.expirationTimes;
      0 < t;

    ) {
      var r = 31 - xt(t),
        n = 1 << r;
      (e[r] = -1), (t &= ~n);
    }
  }
  function Fo(e) {
    if ((oe & 6) !== 0) throw Error(a(327));
    nr();
    var t = fn(e, 0);
    if ((t & 1) === 0) return tt(e, ke()), null;
    var r = ll(e, t);
    if (e.tag !== 0 && r === 2) {
      var n = Wl(e);
      n !== 0 && ((t = n), (r = fi(e, n)));
    }
    if (r === 1) throw ((r = $r), S1(e, 0), r1(e, t), tt(e, ke()), r);
    if (r === 6) throw Error(a(345));
    return (
      (e.finishedWork = e.current.alternate),
      (e.finishedLanes = t),
      N1(e, et, zt),
      tt(e, ke()),
      null
    );
  }
  function pi(e, t) {
    var r = oe;
    oe |= 1;
    try {
      return e(t);
    } finally {
      (oe = r), oe === 0 && ((rr = ke() + 500), Rn && Qt());
    }
  }
  function L1(e) {
    e1 !== null && e1.tag === 0 && (oe & 6) === 0 && nr();
    var t = oe;
    oe |= 1;
    var r = ht.transition,
      n = pe;
    try {
      if (((ht.transition = null), (pe = 1), e)) return e();
    } finally {
      (pe = n), (ht.transition = r), (oe = t), (oe & 6) === 0 && Qt();
    }
  }
  function hi() {
    (ut = tr.current), ve(tr);
  }
  function S1(e, t) {
    (e.finishedWork = null), (e.finishedLanes = 0);
    var r = e.timeoutHandle;
    if ((r !== -1 && ((e.timeoutHandle = -1), n4(r)), Re !== null))
      for (r = Re.return; r !== null; ) {
        var n = r;
        switch ((L2(n), n.tag)) {
          case 1:
            (n = n.type.childContextTypes), n != null && Dn();
            break;
          case 3:
            J1(), ve(Xe), ve(Ze), A2();
            break;
          case 5:
            T2(n);
            break;
          case 4:
            J1();
            break;
          case 13:
            ve(Ee);
            break;
          case 19:
            ve(Ee);
            break;
          case 10:
            _2(n.type._context);
            break;
          case 22:
          case 23:
            hi();
        }
        r = r.return;
      }
    if (
      ((Be = e),
      (Re = e = n1(e.current, null)),
      (Ve = ut = t),
      (Oe = 0),
      ($r = null),
      (ai = Jn = E1 = 0),
      (et = Gr = null),
      w1 !== null)
    ) {
      for (t = 0; t < w1.length; t++)
        if (((r = w1[t]), (n = r.interleaved), n !== null)) {
          r.interleaved = null;
          var o = n.next,
            u = r.pending;
          if (u !== null) {
            var f = u.next;
            (u.next = o), (n.next = f);
          }
          r.pending = n;
        }
      w1 = null;
    }
    return e;
  }
  function Vo(e, t) {
    do {
      var r = Re;
      try {
        if ((D2(), (Vn.current = Wn), Un)) {
          for (var n = Le.memoizedState; n !== null; ) {
            var o = n.queue;
            o !== null && (o.pending = null), (n = n.next);
          }
          Un = !1;
        }
        if (
          ((j1 = 0),
          (Ae = Pe = Le = null),
          (Fr = !1),
          (Vr = 0),
          (oi.current = null),
          r === null || r.return === null)
        ) {
          (Oe = 1), ($r = t), (Re = null);
          break;
        }
        e: {
          var u = e,
            f = r.return,
            x = r,
            v = t;
          if (
            ((t = Ve),
            (x.flags |= 32768),
            v !== null && typeof v == "object" && typeof v.then == "function")
          ) {
            var D = v,
              I = x,
              A = I.tag;
            if ((I.mode & 1) === 0 && (A === 0 || A === 11 || A === 15)) {
              var O = I.alternate;
              O
                ? ((I.updateQueue = O.updateQueue),
                  (I.memoizedState = O.memoizedState),
                  (I.lanes = O.lanes))
                : ((I.updateQueue = null), (I.memoizedState = null));
            }
            var U = fo(f);
            if (U !== null) {
              (U.flags &= -257),
                mo(U, f, x, u, t),
                U.mode & 1 && co(u, D, t),
                (t = U),
                (v = D);
              var $ = t.updateQueue;
              if ($ === null) {
                var G = new Set();
                G.add(v), (t.updateQueue = G);
              } else $.add(v);
              break e;
            } else {
              if ((t & 1) === 0) {
                co(u, D, t), Ci();
                break e;
              }
              v = Error(a(426));
            }
          } else if (ye && x.mode & 1) {
            var De = fo(f);
            if (De !== null) {
              (De.flags & 65536) === 0 && (De.flags |= 256),
                mo(De, f, x, u, t),
                b2(q1(v, x));
              break e;
            }
          }
          (u = v = q1(v, x)),
            Oe !== 4 && (Oe = 2),
            Gr === null ? (Gr = [u]) : Gr.push(u),
            (u = f);
          do {
            switch (u.tag) {
              case 3:
                (u.flags |= 65536), (t &= -t), (u.lanes |= t);
                var N = ao(u, v, t);
                Ts(u, N);
                break e;
              case 1:
                x = v;
                var j = u.type,
                  k = u.stateNode;
                if (
                  (u.flags & 128) === 0 &&
                  (typeof j.getDerivedStateFromError == "function" ||
                    (k !== null &&
                      typeof k.componentDidCatch == "function" &&
                      (qt === null || !qt.has(k))))
                ) {
                  (u.flags |= 65536), (t &= -t), (u.lanes |= t);
                  var B = uo(u, x, t);
                  Ts(u, B);
                  break e;
                }
            }
            u = u.return;
          } while (u !== null);
        }
        Zo(r);
      } catch (K) {
        (t = K), Re === r && r !== null && (Re = r = r.return);
        continue;
      }
      break;
    } while (!0);
  }
  function Uo() {
    var e = Xn.current;
    return (Xn.current = Wn), e === null ? Wn : e;
  }
  function Ci() {
    (Oe === 0 || Oe === 3 || Oe === 2) && (Oe = 4),
      Be === null ||
        ((E1 & 268435455) === 0 && (Jn & 268435455) === 0) ||
        r1(Be, Ve);
  }
  function ll(e, t) {
    var r = oe;
    oe |= 2;
    var n = Uo();
    (Be !== e || Ve !== t) && ((zt = null), S1(e, t));
    do
      try {
        k4();
        break;
      } catch (o) {
        Vo(e, o);
      }
    while (!0);
    if ((D2(), (oe = r), (Xn.current = n), Re !== null)) throw Error(a(261));
    return (Be = null), (Ve = 0), Oe;
  }
  function k4() {
    for (; Re !== null; ) Ho(Re);
  }
  function D4() {
    for (; Re !== null && !e5(); ) Ho(Re);
  }
  function Ho(e) {
    var t = Go(e.alternate, e, ut);
    (e.memoizedProps = e.pendingProps),
      t === null ? Zo(e) : (Re = t),
      (oi.current = null);
  }
  function Zo(e) {
    var t = e;
    do {
      var r = t.alternate;
      if (((e = t.return), (t.flags & 32768) === 0)) {
        if (((r = y4(r, t, ut)), r !== null)) {
          Re = r;
          return;
        }
      } else {
        if (((r = j4(r, t)), r !== null)) {
          (r.flags &= 32767), (Re = r);
          return;
        }
        if (e !== null)
          (e.flags |= 32768), (e.subtreeFlags = 0), (e.deletions = null);
        else {
          (Oe = 6), (Re = null);
          return;
        }
      }
      if (((t = t.sibling), t !== null)) {
        Re = t;
        return;
      }
      Re = t = e;
    } while (t !== null);
    Oe === 0 && (Oe = 5);
  }
  function N1(e, t, r) {
    var n = pe,
      o = ht.transition;
    try {
      (ht.transition = null), (pe = 1), _4(e, t, r, n);
    } finally {
      (ht.transition = o), (pe = n);
    }
    return null;
  }
  function _4(e, t, r, n) {
    do nr();
    while (e1 !== null);
    if ((oe & 6) !== 0) throw Error(a(327));
    r = e.finishedWork;
    var o = e.finishedLanes;
    if (r === null) return null;
    if (((e.finishedWork = null), (e.finishedLanes = 0), r === e.current))
      throw Error(a(177));
    (e.callbackNode = null), (e.callbackPriority = 0);
    var u = r.lanes | r.childLanes;
    if (
      (c5(e, u),
      e === Be && ((Re = Be = null), (Ve = 0)),
      ((r.subtreeFlags & 2064) === 0 && (r.flags & 2064) === 0) ||
        el ||
        ((el = !0),
        Ko(an, function () {
          return nr(), null;
        })),
      (u = (r.flags & 15990) !== 0),
      (r.subtreeFlags & 15990) !== 0 || u)
    ) {
      (u = ht.transition), (ht.transition = null);
      var f = pe;
      pe = 1;
      var x = oe;
      (oe |= 4),
        (oi.current = null),
        L4(e, r),
        Oo(r, e),
        Y5(C2),
        (hn = !!h2),
        (C2 = h2 = null),
        (e.current = r),
        S4(r),
        t5(),
        (oe = x),
        (pe = f),
        (ht.transition = u);
    } else e.current = r;
    if (
      (el && ((el = !1), (e1 = e), (tl = o)),
      (u = e.pendingLanes),
      u === 0 && (qt = null),
      l5(r.stateNode),
      tt(e, ke()),
      t !== null)
    )
      for (n = e.onRecoverableError, r = 0; r < t.length; r++)
        (o = t[r]), n(o.value, { componentStack: o.stack, digest: o.digest });
    if (qn) throw ((qn = !1), (e = ci), (ci = null), e);
    return (
      (tl & 1) !== 0 && e.tag !== 0 && nr(),
      (u = e.pendingLanes),
      (u & 1) !== 0 ? (e === di ? Kr++ : ((Kr = 0), (di = e))) : (Kr = 0),
      Qt(),
      null
    );
  }
  function nr() {
    if (e1 !== null) {
      var e = R3(tl),
        t = ht.transition,
        r = pe;
      try {
        if (((ht.transition = null), (pe = 16 > e ? 16 : e), e1 === null))
          var n = !1;
        else {
          if (((e = e1), (e1 = null), (tl = 0), (oe & 6) !== 0))
            throw Error(a(331));
          var o = oe;
          for (oe |= 4, Z = e.current; Z !== null; ) {
            var u = Z,
              f = u.child;
            if ((Z.flags & 16) !== 0) {
              var x = u.deletions;
              if (x !== null) {
                for (var v = 0; v < x.length; v++) {
                  var D = x[v];
                  for (Z = D; Z !== null; ) {
                    var I = Z;
                    switch (I.tag) {
                      case 0:
                      case 11:
                      case 15:
                        Wr(8, I, u);
                    }
                    var A = I.child;
                    if (A !== null) (A.return = I), (Z = A);
                    else
                      for (; Z !== null; ) {
                        I = Z;
                        var O = I.sibling,
                          U = I.return;
                        if ((Do(I), I === D)) {
                          Z = null;
                          break;
                        }
                        if (O !== null) {
                          (O.return = U), (Z = O);
                          break;
                        }
                        Z = U;
                      }
                  }
                }
                var $ = u.alternate;
                if ($ !== null) {
                  var G = $.child;
                  if (G !== null) {
                    $.child = null;
                    do {
                      var De = G.sibling;
                      (G.sibling = null), (G = De);
                    } while (G !== null);
                  }
                }
                Z = u;
              }
            }
            if ((u.subtreeFlags & 2064) !== 0 && f !== null)
              (f.return = u), (Z = f);
            else
              e: for (; Z !== null; ) {
                if (((u = Z), (u.flags & 2048) !== 0))
                  switch (u.tag) {
                    case 0:
                    case 11:
                    case 15:
                      Wr(9, u, u.return);
                  }
                var N = u.sibling;
                if (N !== null) {
                  (N.return = u.return), (Z = N);
                  break e;
                }
                Z = u.return;
              }
          }
          var j = e.current;
          for (Z = j; Z !== null; ) {
            f = Z;
            var k = f.child;
            if ((f.subtreeFlags & 2064) !== 0 && k !== null)
              (k.return = f), (Z = k);
            else
              e: for (f = j; Z !== null; ) {
                if (((x = Z), (x.flags & 2048) !== 0))
                  try {
                    switch (x.tag) {
                      case 0:
                      case 11:
                      case 15:
                        Yn(9, x);
                    }
                  } catch (K) {
                    Ne(x, x.return, K);
                  }
                if (x === f) {
                  Z = null;
                  break e;
                }
                var B = x.sibling;
                if (B !== null) {
                  (B.return = x.return), (Z = B);
                  break e;
                }
                Z = x.return;
              }
          }
          if (
            ((oe = o),
            Qt(),
            St && typeof St.onPostCommitFiberRoot == "function")
          )
            try {
              St.onPostCommitFiberRoot(un, e);
            } catch {}
          n = !0;
        }
        return n;
      } finally {
        (pe = r), (ht.transition = t);
      }
    }
    return !1;
  }
  function Wo(e, t, r) {
    (t = q1(r, t)),
      (t = ao(e, t, 1)),
      (e = Xt(e, t, 1)),
      (t = Ye()),
      e !== null && (gr(e, 1, t), tt(e, t));
  }
  function Ne(e, t, r) {
    if (e.tag === 3) Wo(e, e, r);
    else
      for (; t !== null; ) {
        if (t.tag === 3) {
          Wo(t, e, r);
          break;
        } else if (t.tag === 1) {
          var n = t.stateNode;
          if (
            typeof t.type.getDerivedStateFromError == "function" ||
            (typeof n.componentDidCatch == "function" &&
              (qt === null || !qt.has(n)))
          ) {
            (e = q1(r, e)),
              (e = uo(t, e, 1)),
              (t = Xt(t, e, 1)),
              (e = Ye()),
              t !== null && (gr(t, 1, e), tt(t, e));
            break;
          }
        }
        t = t.return;
      }
  }
  function R4(e, t, r) {
    var n = e.pingCache;
    n !== null && n.delete(t),
      (t = Ye()),
      (e.pingedLanes |= e.suspendedLanes & r),
      Be === e &&
        (Ve & r) === r &&
        (Oe === 4 || (Oe === 3 && (Ve & 130023424) === Ve && 500 > ke() - ui)
          ? S1(e, 0)
          : (ai |= r)),
      tt(e, t);
  }
  function $o(e, t) {
    t === 0 &&
      ((e.mode & 1) === 0
        ? (t = 1)
        : ((t = dn), (dn <<= 1), (dn & 130023424) === 0 && (dn = 4194304)));
    var r = Ye();
    (e = It(e, t)), e !== null && (gr(e, t, r), tt(e, r));
  }
  function M4(e) {
    var t = e.memoizedState,
      r = 0;
    t !== null && (r = t.retryLane), $o(e, r);
  }
  function P4(e, t) {
    var r = 0;
    switch (e.tag) {
      case 13:
        var n = e.stateNode,
          o = e.memoizedState;
        o !== null && (r = o.retryLane);
        break;
      case 19:
        n = e.stateNode;
        break;
      default:
        throw Error(a(314));
    }
    n !== null && n.delete(t), $o(e, r);
  }
  var Go;
  Go = function (e, t, r) {
    if (e !== null)
      if (e.memoizedProps !== t.pendingProps || Xe.current) qe = !0;
      else {
        if ((e.lanes & r) === 0 && (t.flags & 128) === 0)
          return (qe = !1), w4(e, t, r);
        qe = (e.flags & 131072) !== 0;
      }
    else (qe = !1), ye && (t.flags & 1048576) !== 0 && Ss(t, Pn, t.index);
    switch (((t.lanes = 0), t.tag)) {
      case 2:
        var n = t.type;
        Kn(e, t), (e = t.pendingProps);
        var o = W1(t, Ze.current);
        X1(t, r), (o = F2(null, t, n, e, o, r));
        var u = V2();
        return (
          (t.flags |= 1),
          typeof o == "object" &&
          o !== null &&
          typeof o.render == "function" &&
          o.$$typeof === void 0
            ? ((t.tag = 1),
              (t.memoizedState = null),
              (t.updateQueue = null),
              Je(n) ? ((u = !0), _n(t)) : (u = !1),
              (t.memoizedState =
                o.state !== null && o.state !== void 0 ? o.state : null),
              P2(t),
              (o.updater = $n),
              (t.stateNode = o),
              (o._reactInternals = t),
              G2(t, n, e, r),
              (t = X2(null, t, n, !0, u, r)))
            : ((t.tag = 0), ye && u && E2(t), Qe(null, t, o, r), (t = t.child)),
          t
        );
      case 16:
        n = t.elementType;
        e: {
          switch (
            (Kn(e, t),
            (e = t.pendingProps),
            (o = n._init),
            (n = o(n._payload)),
            (t.type = n),
            (o = t.tag = T4(n)),
            (e = wt(n, e)),
            o)
          ) {
            case 0:
              t = Y2(null, t, n, e, r);
              break e;
            case 1:
              t = vo(null, t, n, e, r);
              break e;
            case 11:
              t = po(null, t, n, e, r);
              break e;
            case 14:
              t = ho(null, t, n, wt(n.type, e), r);
              break e;
          }
          throw Error(a(306, n, ""));
        }
        return t;
      case 0:
        return (
          (n = t.type),
          (o = t.pendingProps),
          (o = t.elementType === n ? o : wt(n, o)),
          Y2(e, t, n, o, r)
        );
      case 1:
        return (
          (n = t.type),
          (o = t.pendingProps),
          (o = t.elementType === n ? o : wt(n, o)),
          vo(e, t, n, o, r)
        );
      case 3:
        e: {
          if ((wo(t), e === null)) throw Error(a(387));
          (n = t.pendingProps),
            (u = t.memoizedState),
            (o = u.element),
            Os(e, t),
            zn(t, n, null, r);
          var f = t.memoizedState;
          if (((n = f.element), u.isDehydrated))
            if (
              ((u = {
                element: n,
                isDehydrated: !1,
                cache: f.cache,
                pendingSuspenseBoundaries: f.pendingSuspenseBoundaries,
                transitions: f.transitions,
              }),
              (t.updateQueue.baseState = u),
              (t.memoizedState = u),
              t.flags & 256)
            ) {
              (o = q1(Error(a(423)), t)), (t = yo(e, t, n, r, o));
              break e;
            } else if (n !== o) {
              (o = q1(Error(a(424)), t)), (t = yo(e, t, n, r, o));
              break e;
            } else
              for (
                at = $t(t.stateNode.containerInfo.firstChild),
                  ot = t,
                  ye = !0,
                  vt = null,
                  r = Ms(t, null, n, r),
                  t.child = r;
                r;

              )
                (r.flags = (r.flags & -3) | 4096), (r = r.sibling);
          else {
            if ((K1(), n === o)) {
              t = Bt(e, t, r);
              break e;
            }
            Qe(e, t, n, r);
          }
          t = t.child;
        }
        return t;
      case 5:
        return (
          As(t),
          e === null && N2(t),
          (n = t.type),
          (o = t.pendingProps),
          (u = e !== null ? e.memoizedProps : null),
          (f = o.children),
          x2(n, o) ? (f = null) : u !== null && x2(n, u) && (t.flags |= 32),
          go(e, t),
          Qe(e, t, f, r),
          t.child
        );
      case 6:
        return e === null && N2(t), null;
      case 13:
        return jo(e, t, r);
      case 4:
        return (
          O2(t, t.stateNode.containerInfo),
          (n = t.pendingProps),
          e === null ? (t.child = Q1(t, null, n, r)) : Qe(e, t, n, r),
          t.child
        );
      case 11:
        return (
          (n = t.type),
          (o = t.pendingProps),
          (o = t.elementType === n ? o : wt(n, o)),
          po(e, t, n, o, r)
        );
      case 7:
        return Qe(e, t, t.pendingProps, r), t.child;
      case 8:
        return Qe(e, t, t.pendingProps.children, r), t.child;
      case 12:
        return Qe(e, t, t.pendingProps.children, r), t.child;
      case 10:
        e: {
          if (
            ((n = t.type._context),
            (o = t.pendingProps),
            (u = t.memoizedProps),
            (f = o.value),
            Ce(In, n._currentValue),
            (n._currentValue = f),
            u !== null)
          )
            if (gt(u.value, f)) {
              if (u.children === o.children && !Xe.current) {
                t = Bt(e, t, r);
                break e;
              }
            } else
              for (u = t.child, u !== null && (u.return = t); u !== null; ) {
                var x = u.dependencies;
                if (x !== null) {
                  f = u.child;
                  for (var v = x.firstContext; v !== null; ) {
                    if (v.context === n) {
                      if (u.tag === 1) {
                        (v = At(-1, r & -r)), (v.tag = 2);
                        var D = u.updateQueue;
                        if (D !== null) {
                          D = D.shared;
                          var I = D.pending;
                          I === null
                            ? (v.next = v)
                            : ((v.next = I.next), (I.next = v)),
                            (D.pending = v);
                        }
                      }
                      (u.lanes |= r),
                        (v = u.alternate),
                        v !== null && (v.lanes |= r),
                        R2(u.return, r, t),
                        (x.lanes |= r);
                      break;
                    }
                    v = v.next;
                  }
                } else if (u.tag === 10) f = u.type === t.type ? null : u.child;
                else if (u.tag === 18) {
                  if (((f = u.return), f === null)) throw Error(a(341));
                  (f.lanes |= r),
                    (x = f.alternate),
                    x !== null && (x.lanes |= r),
                    R2(f, r, t),
                    (f = u.sibling);
                } else f = u.child;
                if (f !== null) f.return = u;
                else
                  for (f = u; f !== null; ) {
                    if (f === t) {
                      f = null;
                      break;
                    }
                    if (((u = f.sibling), u !== null)) {
                      (u.return = f.return), (f = u);
                      break;
                    }
                    f = f.return;
                  }
                u = f;
              }
          Qe(e, t, o.children, r), (t = t.child);
        }
        return t;
      case 9:
        return (
          (o = t.type),
          (n = t.pendingProps.children),
          X1(t, r),
          (o = mt(o)),
          (n = n(o)),
          (t.flags |= 1),
          Qe(e, t, n, r),
          t.child
        );
      case 14:
        return (
          (n = t.type),
          (o = wt(n, t.pendingProps)),
          (o = wt(n.type, o)),
          ho(e, t, n, o, r)
        );
      case 15:
        return Co(e, t, t.type, t.pendingProps, r);
      case 17:
        return (
          (n = t.type),
          (o = t.pendingProps),
          (o = t.elementType === n ? o : wt(n, o)),
          Kn(e, t),
          (t.tag = 1),
          Je(n) ? ((e = !0), _n(t)) : (e = !1),
          X1(t, r),
          so(t, n, o),
          G2(t, n, o, r),
          X2(null, t, n, !0, e, r)
        );
      case 19:
        return Lo(e, t, r);
      case 22:
        return xo(e, t, r);
    }
    throw Error(a(156, t.tag));
  };
  function Ko(e, t) {
    return N3(e, t);
  }
  function O4(e, t, r, n) {
    (this.tag = e),
      (this.key = r),
      (this.sibling =
        this.child =
        this.return =
        this.stateNode =
        this.type =
        this.elementType =
          null),
      (this.index = 0),
      (this.ref = null),
      (this.pendingProps = t),
      (this.dependencies =
        this.memoizedState =
        this.updateQueue =
        this.memoizedProps =
          null),
      (this.mode = n),
      (this.subtreeFlags = this.flags = 0),
      (this.deletions = null),
      (this.childLanes = this.lanes = 0),
      (this.alternate = null);
  }
  function Ct(e, t, r, n) {
    return new O4(e, t, r, n);
  }
  function xi(e) {
    return (e = e.prototype), !(!e || !e.isReactComponent);
  }
  function T4(e) {
    if (typeof e == "function") return xi(e) ? 1 : 0;
    if (e != null) {
      if (((e = e.$$typeof), e === _e)) return 11;
      if (e === He) return 14;
    }
    return 2;
  }
  function n1(e, t) {
    var r = e.alternate;
    return (
      r === null
        ? ((r = Ct(e.tag, t, e.key, e.mode)),
          (r.elementType = e.elementType),
          (r.type = e.type),
          (r.stateNode = e.stateNode),
          (r.alternate = e),
          (e.alternate = r))
        : ((r.pendingProps = t),
          (r.type = e.type),
          (r.flags = 0),
          (r.subtreeFlags = 0),
          (r.deletions = null)),
      (r.flags = e.flags & 14680064),
      (r.childLanes = e.childLanes),
      (r.lanes = e.lanes),
      (r.child = e.child),
      (r.memoizedProps = e.memoizedProps),
      (r.memoizedState = e.memoizedState),
      (r.updateQueue = e.updateQueue),
      (t = e.dependencies),
      (r.dependencies =
        t === null ? null : { lanes: t.lanes, firstContext: t.firstContext }),
      (r.sibling = e.sibling),
      (r.index = e.index),
      (r.ref = e.ref),
      r
    );
  }
  function il(e, t, r, n, o, u) {
    var f = 2;
    if (((n = e), typeof e == "function")) xi(e) && (f = 1);
    else if (typeof e == "string") f = 5;
    else
      e: switch (e) {
        case Y:
          return b1(r.children, o, u, t);
        case fe:
          (f = 8), (o |= 8);
          break;
        case Ie:
          return (
            (e = Ct(12, r, t, o | 2)), (e.elementType = Ie), (e.lanes = u), e
          );
        case Se:
          return (e = Ct(13, r, t, o)), (e.elementType = Se), (e.lanes = u), e;
        case Ue:
          return (e = Ct(19, r, t, o)), (e.elementType = Ue), (e.lanes = u), e;
        case Q:
          return sl(r, o, u, t);
        default:
          if (typeof e == "object" && e !== null)
            switch (e.$$typeof) {
              case be:
                f = 10;
                break e;
              case xe:
                f = 9;
                break e;
              case _e:
                f = 11;
                break e;
              case He:
                f = 14;
                break e;
              case je:
                (f = 16), (n = null);
                break e;
            }
          throw Error(a(130, e == null ? e : typeof e, ""));
      }
    return (
      (t = Ct(f, r, t, o)), (t.elementType = e), (t.type = n), (t.lanes = u), t
    );
  }
  function b1(e, t, r, n) {
    return (e = Ct(7, e, n, t)), (e.lanes = r), e;
  }
  function sl(e, t, r, n) {
    return (
      (e = Ct(22, e, n, t)),
      (e.elementType = Q),
      (e.lanes = r),
      (e.stateNode = { isHidden: !1 }),
      e
    );
  }
  function gi(e, t, r) {
    return (e = Ct(6, e, null, t)), (e.lanes = r), e;
  }
  function vi(e, t, r) {
    return (
      (t = Ct(4, e.children !== null ? e.children : [], e.key, t)),
      (t.lanes = r),
      (t.stateNode = {
        containerInfo: e.containerInfo,
        pendingChildren: null,
        implementation: e.implementation,
      }),
      t
    );
  }
  function I4(e, t, r, n, o) {
    (this.tag = t),
      (this.containerInfo = e),
      (this.finishedWork =
        this.pingCache =
        this.current =
        this.pendingChildren =
          null),
      (this.timeoutHandle = -1),
      (this.callbackNode = this.pendingContext = this.context = null),
      (this.callbackPriority = 0),
      (this.eventTimes = $l(0)),
      (this.expirationTimes = $l(-1)),
      (this.entangledLanes =
        this.finishedLanes =
        this.mutableReadLanes =
        this.expiredLanes =
        this.pingedLanes =
        this.suspendedLanes =
        this.pendingLanes =
          0),
      (this.entanglements = $l(0)),
      (this.identifierPrefix = n),
      (this.onRecoverableError = o),
      (this.mutableSourceEagerHydrationData = null);
  }
  function wi(e, t, r, n, o, u, f, x, v) {
    return (
      (e = new I4(e, t, r, x, v)),
      t === 1 ? ((t = 1), u === !0 && (t |= 8)) : (t = 0),
      (u = Ct(3, null, null, t)),
      (e.current = u),
      (u.stateNode = e),
      (u.memoizedState = {
        element: n,
        isDehydrated: r,
        cache: null,
        transitions: null,
        pendingSuspenseBoundaries: null,
      }),
      P2(u),
      e
    );
  }
  function A4(e, t, r) {
    var n =
      3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
    return {
      $$typeof: re,
      key: n == null ? null : "" + n,
      children: e,
      containerInfo: t,
      implementation: r,
    };
  }
  function Qo(e) {
    if (!e) return Kt;
    e = e._reactInternals;
    e: {
      if (h1(e) !== e || e.tag !== 1) throw Error(a(170));
      var t = e;
      do {
        switch (t.tag) {
          case 3:
            t = t.stateNode.context;
            break e;
          case 1:
            if (Je(t.type)) {
              t = t.stateNode.__reactInternalMemoizedMergedChildContext;
              break e;
            }
        }
        t = t.return;
      } while (t !== null);
      throw Error(a(171));
    }
    if (e.tag === 1) {
      var r = e.type;
      if (Je(r)) return js(e, r, t);
    }
    return t;
  }
  function Yo(e, t, r, n, o, u, f, x, v) {
    return (
      (e = wi(r, n, !0, e, o, u, f, x, v)),
      (e.context = Qo(null)),
      (r = e.current),
      (n = Ye()),
      (o = t1(r)),
      (u = At(n, o)),
      (u.callback = t ?? null),
      Xt(r, u, o),
      (e.current.lanes = o),
      gr(e, o, n),
      tt(e, n),
      e
    );
  }
  function ol(e, t, r, n) {
    var o = t.current,
      u = Ye(),
      f = t1(o);
    return (
      (r = Qo(r)),
      t.context === null ? (t.context = r) : (t.pendingContext = r),
      (t = At(u, f)),
      (t.payload = { element: e }),
      (n = n === void 0 ? null : n),
      n !== null && (t.callback = n),
      (e = Xt(o, t, f)),
      e !== null && (Et(e, o, f, u), Bn(e, o, f)),
      f
    );
  }
  function al(e) {
    if (((e = e.current), !e.child)) return null;
    switch (e.child.tag) {
      case 5:
        return e.child.stateNode;
      default:
        return e.child.stateNode;
    }
  }
  function Xo(e, t) {
    if (((e = e.memoizedState), e !== null && e.dehydrated !== null)) {
      var r = e.retryLane;
      e.retryLane = r !== 0 && r < t ? r : t;
    }
  }
  function yi(e, t) {
    Xo(e, t), (e = e.alternate) && Xo(e, t);
  }
  function B4() {
    return null;
  }
  var Jo =
    typeof reportError == "function"
      ? reportError
      : function (e) {
          console.error(e);
        };
  function ji(e) {
    this._internalRoot = e;
  }
  (ul.prototype.render = ji.prototype.render =
    function (e) {
      var t = this._internalRoot;
      if (t === null) throw Error(a(409));
      ol(e, t, null, null);
    }),
    (ul.prototype.unmount = ji.prototype.unmount =
      function () {
        var e = this._internalRoot;
        if (e !== null) {
          this._internalRoot = null;
          var t = e.containerInfo;
          L1(function () {
            ol(null, e, null, null);
          }),
            (t[Mt] = null);
        }
      });
  function ul(e) {
    this._internalRoot = e;
  }
  ul.prototype.unstable_scheduleHydration = function (e) {
    if (e) {
      var t = O3();
      e = { blockedOn: null, target: e, priority: t };
      for (var r = 0; r < Ht.length && t !== 0 && t < Ht[r].priority; r++);
      Ht.splice(r, 0, e), r === 0 && A3(e);
    }
  };
  function Ei(e) {
    return !(!e || (e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11));
  }
  function cl(e) {
    return !(
      !e ||
      (e.nodeType !== 1 &&
        e.nodeType !== 9 &&
        e.nodeType !== 11 &&
        (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
    );
  }
  function qo() {}
  function z4(e, t, r, n, o) {
    if (o) {
      if (typeof n == "function") {
        var u = n;
        n = function () {
          var D = al(f);
          u.call(D);
        };
      }
      var f = Yo(t, n, e, 0, null, !1, !1, "", qo);
      return (
        (e._reactRootContainer = f),
        (e[Mt] = f.current),
        Mr(e.nodeType === 8 ? e.parentNode : e),
        L1(),
        f
      );
    }
    for (; (o = e.lastChild); ) e.removeChild(o);
    if (typeof n == "function") {
      var x = n;
      n = function () {
        var D = al(v);
        x.call(D);
      };
    }
    var v = wi(e, 0, !1, null, null, !1, !1, "", qo);
    return (
      (e._reactRootContainer = v),
      (e[Mt] = v.current),
      Mr(e.nodeType === 8 ? e.parentNode : e),
      L1(function () {
        ol(t, v, r, n);
      }),
      v
    );
  }
  function dl(e, t, r, n, o) {
    var u = r._reactRootContainer;
    if (u) {
      var f = u;
      if (typeof o == "function") {
        var x = o;
        o = function () {
          var v = al(f);
          x.call(v);
        };
      }
      ol(t, f, e, o);
    } else f = z4(r, t, e, o, n);
    return al(f);
  }
  (M3 = function (e) {
    switch (e.tag) {
      case 3:
        var t = e.stateNode;
        if (t.current.memoizedState.isDehydrated) {
          var r = xr(t.pendingLanes);
          r !== 0 &&
            (Gl(t, r | 1),
            tt(t, ke()),
            (oe & 6) === 0 && ((rr = ke() + 500), Qt()));
        }
        break;
      case 13:
        L1(function () {
          var n = It(e, 1);
          if (n !== null) {
            var o = Ye();
            Et(n, e, 1, o);
          }
        }),
          yi(e, 1);
    }
  }),
    (Kl = function (e) {
      if (e.tag === 13) {
        var t = It(e, 134217728);
        if (t !== null) {
          var r = Ye();
          Et(t, e, 134217728, r);
        }
        yi(e, 134217728);
      }
    }),
    (P3 = function (e) {
      if (e.tag === 13) {
        var t = t1(e),
          r = It(e, t);
        if (r !== null) {
          var n = Ye();
          Et(r, e, t, n);
        }
        yi(e, t);
      }
    }),
    (O3 = function () {
      return pe;
    }),
    (T3 = function (e, t) {
      var r = pe;
      try {
        return (pe = e), t();
      } finally {
        pe = r;
      }
    }),
    (Fl = function (e, t, r) {
      switch (t) {
        case "input":
          if ((Ml(e, r), (t = r.name), r.type === "radio" && t != null)) {
            for (r = e; r.parentNode; ) r = r.parentNode;
            for (
              r = r.querySelectorAll(
                "input[name=" + JSON.stringify("" + t) + '][type="radio"]'
              ),
                t = 0;
              t < r.length;
              t++
            ) {
              var n = r[t];
              if (n !== e && n.form === e.form) {
                var o = kn(n);
                if (!o) throw Error(a(90));
                i3(n), Ml(n, o);
              }
            }
          }
          break;
        case "textarea":
          c3(e, r);
          break;
        case "select":
          (t = r.value), t != null && P1(e, !!r.multiple, t, !1);
      }
    }),
    (v3 = pi),
    (w3 = L1);
  var F4 = { usingClientEntryPoint: !1, Events: [Tr, H1, kn, x3, g3, pi] },
    Qr = {
      findFiberByHostInstance: C1,
      bundleType: 0,
      version: "18.3.1",
      rendererPackageName: "react-dom",
    },
    V4 = {
      bundleType: Qr.bundleType,
      version: Qr.version,
      rendererPackageName: Qr.rendererPackageName,
      rendererConfig: Qr.rendererConfig,
      overrideHookState: null,
      overrideHookStateDeletePath: null,
      overrideHookStateRenamePath: null,
      overrideProps: null,
      overridePropsDeletePath: null,
      overridePropsRenamePath: null,
      setErrorHandler: null,
      setSuspenseHandler: null,
      scheduleUpdate: null,
      currentDispatcherRef: F.ReactCurrentDispatcher,
      findHostInstanceByFiber: function (e) {
        return (e = L3(e)), e === null ? null : e.stateNode;
      },
      findFiberByHostInstance: Qr.findFiberByHostInstance || B4,
      findHostInstancesForRefresh: null,
      scheduleRefresh: null,
      scheduleRoot: null,
      setRefreshHandler: null,
      getCurrentFiber: null,
      reconcilerVersion: "18.3.1-next-f1338f8080-20240426",
    };
  if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ < "u") {
    var fl = __REACT_DEVTOOLS_GLOBAL_HOOK__;
    if (!fl.isDisabled && fl.supportsFiber)
      try {
        (un = fl.inject(V4)), (St = fl);
      } catch {}
  }
  return (
    (rt.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = F4),
    (rt.createPortal = function (e, t) {
      var r =
        2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
      if (!Ei(t)) throw Error(a(200));
      return A4(e, t, null, r);
    }),
    (rt.createRoot = function (e, t) {
      if (!Ei(e)) throw Error(a(299));
      var r = !1,
        n = "",
        o = Jo;
      return (
        t != null &&
          (t.unstable_strictMode === !0 && (r = !0),
          t.identifierPrefix !== void 0 && (n = t.identifierPrefix),
          t.onRecoverableError !== void 0 && (o = t.onRecoverableError)),
        (t = wi(e, 1, !1, null, null, r, !1, n, o)),
        (e[Mt] = t.current),
        Mr(e.nodeType === 8 ? e.parentNode : e),
        new ji(t)
      );
    }),
    (rt.findDOMNode = function (e) {
      if (e == null) return null;
      if (e.nodeType === 1) return e;
      var t = e._reactInternals;
      if (t === void 0)
        throw typeof e.render == "function"
          ? Error(a(188))
          : ((e = Object.keys(e).join(",")), Error(a(268, e)));
      return (e = L3(t)), (e = e === null ? null : e.stateNode), e;
    }),
    (rt.flushSync = function (e) {
      return L1(e);
    }),
    (rt.hydrate = function (e, t, r) {
      if (!cl(t)) throw Error(a(200));
      return dl(null, e, t, !0, r);
    }),
    (rt.hydrateRoot = function (e, t, r) {
      if (!Ei(e)) throw Error(a(405));
      var n = (r != null && r.hydratedSources) || null,
        o = !1,
        u = "",
        f = Jo;
      if (
        (r != null &&
          (r.unstable_strictMode === !0 && (o = !0),
          r.identifierPrefix !== void 0 && (u = r.identifierPrefix),
          r.onRecoverableError !== void 0 && (f = r.onRecoverableError)),
        (t = Yo(t, null, e, 1, r ?? null, o, !1, u, f)),
        (e[Mt] = t.current),
        Mr(e),
        n)
      )
        for (e = 0; e < n.length; e++)
          (r = n[e]),
            (o = r._getVersion),
            (o = o(r._source)),
            t.mutableSourceEagerHydrationData == null
              ? (t.mutableSourceEagerHydrationData = [r, o])
              : t.mutableSourceEagerHydrationData.push(r, o);
      return new ul(t);
    }),
    (rt.render = function (e, t, r) {
      if (!cl(t)) throw Error(a(200));
      return dl(null, e, t, !1, r);
    }),
    (rt.unmountComponentAtNode = function (e) {
      if (!cl(e)) throw Error(a(40));
      return e._reactRootContainer
        ? (L1(function () {
            dl(null, null, e, !1, function () {
              (e._reactRootContainer = null), (e[Mt] = null);
            });
          }),
          !0)
        : !1;
    }),
    (rt.unstable_batchedUpdates = pi),
    (rt.unstable_renderSubtreeIntoContainer = function (e, t, r, n) {
      if (!cl(r)) throw Error(a(200));
      if (e == null || e._reactInternals === void 0) throw Error(a(38));
      return dl(e, t, r, !1, n);
    }),
    (rt.version = "18.3.1-next-f1338f8080-20240426"),
    rt
  );
}
var o0;
function z0() {
  if (o0) return Ni.exports;
  o0 = 1;
  function l() {
    if (
      !(
        typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ > "u" ||
        typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function"
      )
    )
      try {
        __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(l);
      } catch (s) {
        console.error(s);
      }
  }
  return l(), (Ni.exports = Q4()), Ni.exports;
}
var a0;
function Y4() {
  if (a0) return ml;
  a0 = 1;
  var l = z0();
  return (ml.createRoot = l.createRoot), (ml.hydrateRoot = l.hydrateRoot), ml;
}
var X4 = Y4();
const J4 = El(X4);
var F0 = z0();
const q4 = El(F0);
/**
 * @remix-run/router v1.23.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */ function Xr() {
  return (
    (Xr = Object.assign
      ? Object.assign.bind()
      : function (l) {
          for (var s = 1; s < arguments.length; s++) {
            var a = arguments[s];
            for (var c in a)
              Object.prototype.hasOwnProperty.call(a, c) && (l[c] = a[c]);
          }
          return l;
        }),
    Xr.apply(this, arguments)
  );
}
var o1;
(function (l) {
  (l.Pop = "POP"), (l.Push = "PUSH"), (l.Replace = "REPLACE");
})(o1 || (o1 = {}));
const u0 = "popstate";
function eu(l) {
  l === void 0 && (l = {});
  function s(c, d) {
    let { pathname: m, search: h, hash: p } = c.location;
    return Ui(
      "",
      { pathname: m, search: h, hash: p },
      (d.state && d.state.usr) || null,
      (d.state && d.state.key) || "default"
    );
  }
  function a(c, d) {
    return typeof d == "string" ? d : U0(d);
  }
  return ru(s, a, null, l);
}
function Te(l, s) {
  if (l === !1 || l === null || typeof l > "u") throw new Error(s);
}
function V0(l, s) {
  if (!l) {
    typeof console < "u" && console.warn(s);
    try {
      throw new Error(s);
    } catch {}
  }
}
function tu() {
  return Math.random().toString(36).substr(2, 8);
}
function c0(l, s) {
  return { usr: l.state, key: l.key, idx: s };
}
function Ui(l, s, a, c) {
  return (
    a === void 0 && (a = null),
    Xr(
      { pathname: typeof l == "string" ? l : l.pathname, search: "", hash: "" },
      typeof s == "string" ? ar(s) : s,
      { state: a, key: (s && s.key) || c || tu() }
    )
  );
}
function U0(l) {
  let { pathname: s = "/", search: a = "", hash: c = "" } = l;
  return (
    a && a !== "?" && (s += a.charAt(0) === "?" ? a : "?" + a),
    c && c !== "#" && (s += c.charAt(0) === "#" ? c : "#" + c),
    s
  );
}
function ar(l) {
  let s = {};
  if (l) {
    let a = l.indexOf("#");
    a >= 0 && ((s.hash = l.substr(a)), (l = l.substr(0, a)));
    let c = l.indexOf("?");
    c >= 0 && ((s.search = l.substr(c)), (l = l.substr(0, c))),
      l && (s.pathname = l);
  }
  return s;
}
function ru(l, s, a, c) {
  c === void 0 && (c = {});
  let { window: d = document.defaultView, v5Compat: m = !1 } = c,
    h = d.history,
    p = o1.Pop,
    y = null,
    w = E();
  w == null && ((w = 0), h.replaceState(Xr({}, h.state, { idx: w }), ""));
  function E() {
    return (h.state || { idx: null }).idx;
  }
  function g() {
    p = o1.Pop;
    let _ = E(),
      M = _ == null ? null : _ - w;
    (w = _), y && y({ action: p, location: S.location, delta: M });
  }
  function b(_, M) {
    p = o1.Push;
    let H = Ui(S.location, _, M);
    w = E() + 1;
    let V = c0(H, w),
      F = S.createHref(H);
    try {
      h.pushState(V, "", F);
    } catch (ee) {
      if (ee instanceof DOMException && ee.name === "DataCloneError") throw ee;
      d.location.assign(F);
    }
    m && y && y({ action: p, location: S.location, delta: 1 });
  }
  function R(_, M) {
    p = o1.Replace;
    let H = Ui(S.location, _, M);
    w = E();
    let V = c0(H, w),
      F = S.createHref(H);
    h.replaceState(V, "", F),
      m && y && y({ action: p, location: S.location, delta: 0 });
  }
  function P(_) {
    let M = d.location.origin !== "null" ? d.location.origin : d.location.href,
      H = typeof _ == "string" ? _ : U0(_);
    return (
      (H = H.replace(/ $/, "%20")),
      Te(
        M,
        "No window.location.(origin|href) available to create URL for href: " +
          H
      ),
      new URL(H, M)
    );
  }
  let S = {
    get action() {
      return p;
    },
    get location() {
      return l(d, h);
    },
    listen(_) {
      if (y) throw new Error("A history only accepts one active listener");
      return (
        d.addEventListener(u0, g),
        (y = _),
        () => {
          d.removeEventListener(u0, g), (y = null);
        }
      );
    },
    createHref(_) {
      return s(d, _);
    },
    createURL: P,
    encodeLocation(_) {
      let M = P(_);
      return { pathname: M.pathname, search: M.search, hash: M.hash };
    },
    push: b,
    replace: R,
    go(_) {
      return h.go(_);
    },
  };
  return S;
}
var d0;
(function (l) {
  (l.data = "data"),
    (l.deferred = "deferred"),
    (l.redirect = "redirect"),
    (l.error = "error");
})(d0 || (d0 = {}));
function nu(l, s, a) {
  return a === void 0 && (a = "/"), lu(l, s, a);
}
function lu(l, s, a, c) {
  let d = typeof s == "string" ? ar(s) : s,
    m = W0(d.pathname || "/", a);
  if (m == null) return null;
  let h = H0(l);
  iu(h);
  let p = null;
  for (let y = 0; p == null && y < h.length; ++y) {
    let w = xu(m);
    p = pu(h[y], w);
  }
  return p;
}
function H0(l, s, a, c) {
  s === void 0 && (s = []), a === void 0 && (a = []), c === void 0 && (c = "");
  let d = (m, h, p) => {
    let y = {
      relativePath: p === void 0 ? m.path || "" : p,
      caseSensitive: m.caseSensitive === !0,
      childrenIndex: h,
      route: m,
    };
    y.relativePath.startsWith("/") &&
      (Te(
        y.relativePath.startsWith(c),
        'Absolute route path "' +
          y.relativePath +
          '" nested under path ' +
          ('"' + c + '" is not valid. An absolute child route path ') +
          "must start with the combined path of all its parent routes."
      ),
      (y.relativePath = y.relativePath.slice(c.length)));
    let w = D1([c, y.relativePath]),
      E = a.concat(y);
    m.children &&
      m.children.length > 0 &&
      (Te(
        m.index !== !0,
        "Index routes must not have child routes. Please remove " +
          ('all child routes from route path "' + w + '".')
      ),
      H0(m.children, s, E, w)),
      !(m.path == null && !m.index) &&
        s.push({ path: w, score: fu(w, m.index), routesMeta: E });
  };
  return (
    l.forEach((m, h) => {
      var p;
      if (m.path === "" || !((p = m.path) != null && p.includes("?"))) d(m, h);
      else for (let y of Z0(m.path)) d(m, h, y);
    }),
    s
  );
}
function Z0(l) {
  let s = l.split("/");
  if (s.length === 0) return [];
  let [a, ...c] = s,
    d = a.endsWith("?"),
    m = a.replace(/\?$/, "");
  if (c.length === 0) return d ? [m, ""] : [m];
  let h = Z0(c.join("/")),
    p = [];
  return (
    p.push(...h.map((y) => (y === "" ? m : [m, y].join("/")))),
    d && p.push(...h),
    p.map((y) => (l.startsWith("/") && y === "" ? "/" : y))
  );
}
function iu(l) {
  l.sort((s, a) =>
    s.score !== a.score
      ? a.score - s.score
      : mu(
          s.routesMeta.map((c) => c.childrenIndex),
          a.routesMeta.map((c) => c.childrenIndex)
        )
  );
}
const su = /^:[\w-]+$/,
  ou = 3,
  au = 2,
  uu = 1,
  cu = 10,
  du = -2,
  f0 = (l) => l === "*";
function fu(l, s) {
  let a = l.split("/"),
    c = a.length;
  return (
    a.some(f0) && (c += du),
    s && (c += au),
    a
      .filter((d) => !f0(d))
      .reduce((d, m) => d + (su.test(m) ? ou : m === "" ? uu : cu), c)
  );
}
function mu(l, s) {
  return l.length === s.length && l.slice(0, -1).every((c, d) => c === s[d])
    ? l[l.length - 1] - s[s.length - 1]
    : 0;
}
function pu(l, s, a) {
  let { routesMeta: c } = l,
    d = {},
    m = "/",
    h = [];
  for (let p = 0; p < c.length; ++p) {
    let y = c[p],
      w = p === c.length - 1,
      E = m === "/" ? s : s.slice(m.length) || "/",
      g = hu(
        { path: y.relativePath, caseSensitive: y.caseSensitive, end: w },
        E
      ),
      b = y.route;
    if (!g) return null;
    Object.assign(d, g.params),
      h.push({
        params: d,
        pathname: D1([m, g.pathname]),
        pathnameBase: Eu(D1([m, g.pathnameBase])),
        route: b,
      }),
      g.pathnameBase !== "/" && (m = D1([m, g.pathnameBase]));
  }
  return h;
}
function hu(l, s) {
  typeof l == "string" && (l = { path: l, caseSensitive: !1, end: !0 });
  let [a, c] = Cu(l.path, l.caseSensitive, l.end),
    d = s.match(a);
  if (!d) return null;
  let m = d[0],
    h = m.replace(/(.)\/+$/, "$1"),
    p = d.slice(1);
  return {
    params: c.reduce((w, E, g) => {
      let { paramName: b, isOptional: R } = E;
      if (b === "*") {
        let S = p[g] || "";
        h = m.slice(0, m.length - S.length).replace(/(.)\/+$/, "$1");
      }
      const P = p[g];
      return (
        R && !P ? (w[b] = void 0) : (w[b] = (P || "").replace(/%2F/g, "/")), w
      );
    }, {}),
    pathname: m,
    pathnameBase: h,
    pattern: l,
  };
}
function Cu(l, s, a) {
  s === void 0 && (s = !1),
    a === void 0 && (a = !0),
    V0(
      l === "*" || !l.endsWith("*") || l.endsWith("/*"),
      'Route path "' +
        l +
        '" will be treated as if it were ' +
        ('"' + l.replace(/\*$/, "/*") + '" because the `*` character must ') +
        "always follow a `/` in the pattern. To get rid of this warning, " +
        ('please change the route path to "' + l.replace(/\*$/, "/*") + '".')
    );
  let c = [],
    d =
      "^" +
      l
        .replace(/\/*\*?$/, "")
        .replace(/^\/*/, "/")
        .replace(/[\\.*+^${}|()[\]]/g, "\\$&")
        .replace(
          /\/:([\w-]+)(\?)?/g,
          (h, p, y) => (
            c.push({ paramName: p, isOptional: y != null }),
            y ? "/?([^\\/]+)?" : "/([^\\/]+)"
          )
        );
  return (
    l.endsWith("*")
      ? (c.push({ paramName: "*" }),
        (d += l === "*" || l === "/*" ? "(.*)$" : "(?:\\/(.+)|\\/*)$"))
      : a
      ? (d += "\\/*$")
      : l !== "" && l !== "/" && (d += "(?:(?=\\/|$))"),
    [new RegExp(d, s ? void 0 : "i"), c]
  );
}
function xu(l) {
  try {
    return l
      .split("/")
      .map((s) => decodeURIComponent(s).replace(/\//g, "%2F"))
      .join("/");
  } catch (s) {
    return (
      V0(
        !1,
        'The URL path "' +
          l +
          '" could not be decoded because it is is a malformed URL segment. This is probably due to a bad percent ' +
          ("encoding (" + s + ").")
      ),
      l
    );
  }
}
function W0(l, s) {
  if (s === "/") return l;
  if (!l.toLowerCase().startsWith(s.toLowerCase())) return null;
  let a = s.endsWith("/") ? s.length - 1 : s.length,
    c = l.charAt(a);
  return c && c !== "/" ? null : l.slice(a) || "/";
}
function gu(l, s) {
  s === void 0 && (s = "/");
  let {
    pathname: a,
    search: c = "",
    hash: d = "",
  } = typeof l == "string" ? ar(l) : l;
  return {
    pathname: a ? (a.startsWith("/") ? a : vu(a, s)) : s,
    search: Lu(c),
    hash: Su(d),
  };
}
function vu(l, s) {
  let a = s.replace(/\/+$/, "").split("/");
  return (
    l.split("/").forEach((d) => {
      d === ".." ? a.length > 1 && a.pop() : d !== "." && a.push(d);
    }),
    a.length > 1 ? a.join("/") : "/"
  );
}
function Di(l, s, a, c) {
  return (
    "Cannot include a '" +
    l +
    "' character in a manually specified " +
    ("`to." +
      s +
      "` field [" +
      JSON.stringify(c) +
      "].  Please separate it out to the ") +
    ("`to." + a + "` field. Alternatively you may provide the full path as ") +
    'a string in <Link to="..."> and the router will parse it for you.'
  );
}
function wu(l) {
  return l.filter(
    (s, a) => a === 0 || (s.route.path && s.route.path.length > 0)
  );
}
function yu(l, s) {
  let a = wu(l);
  return s
    ? a.map((c, d) => (d === a.length - 1 ? c.pathname : c.pathnameBase))
    : a.map((c) => c.pathnameBase);
}
function ju(l, s, a, c) {
  c === void 0 && (c = !1);
  let d;
  typeof l == "string"
    ? (d = ar(l))
    : ((d = Xr({}, l)),
      Te(
        !d.pathname || !d.pathname.includes("?"),
        Di("?", "pathname", "search", d)
      ),
      Te(
        !d.pathname || !d.pathname.includes("#"),
        Di("#", "pathname", "hash", d)
      ),
      Te(!d.search || !d.search.includes("#"), Di("#", "search", "hash", d)));
  let m = l === "" || d.pathname === "",
    h = m ? "/" : d.pathname,
    p;
  if (h == null) p = a;
  else {
    let g = s.length - 1;
    if (!c && h.startsWith("..")) {
      let b = h.split("/");
      for (; b[0] === ".."; ) b.shift(), (g -= 1);
      d.pathname = b.join("/");
    }
    p = g >= 0 ? s[g] : "/";
  }
  let y = gu(d, p),
    w = h && h !== "/" && h.endsWith("/"),
    E = (m || h === ".") && a.endsWith("/");
  return !y.pathname.endsWith("/") && (w || E) && (y.pathname += "/"), y;
}
const D1 = (l) => l.join("/").replace(/\/\/+/g, "/"),
  Eu = (l) => l.replace(/\/+$/, "").replace(/^\/*/, "/"),
  Lu = (l) => (!l || l === "?" ? "" : l.startsWith("?") ? l : "?" + l),
  Su = (l) => (!l || l === "#" ? "" : l.startsWith("#") ? l : "#" + l);
function Nu(l) {
  return (
    l != null &&
    typeof l.status == "number" &&
    typeof l.statusText == "string" &&
    typeof l.internal == "boolean" &&
    "data" in l
  );
}
const $0 = ["post", "put", "patch", "delete"];
new Set($0);
const bu = ["get", ...$0];
new Set(bu);
/**
 * React Router v6.30.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */ function Jr() {
  return (
    (Jr = Object.assign
      ? Object.assign.bind()
      : function (l) {
          for (var s = 1; s < arguments.length; s++) {
            var a = arguments[s];
            for (var c in a)
              Object.prototype.hasOwnProperty.call(a, c) && (l[c] = a[c]);
          }
          return l;
        }),
    Jr.apply(this, arguments)
  );
}
const Yi = C.createContext(null),
  ku = C.createContext(null),
  Ll = C.createContext(null),
  Sl = C.createContext(null),
  ur = C.createContext({ outlet: null, matches: [], isDataRoute: !1 }),
  G0 = C.createContext(null);
function Nl() {
  return C.useContext(Sl) != null;
}
function Xi() {
  return Nl() || Te(!1), C.useContext(Sl).location;
}
function K0(l) {
  C.useContext(Ll).static || C.useLayoutEffect(l);
}
function bl() {
  let { isDataRoute: l } = C.useContext(ur);
  return l ? Vu() : Du();
}
function Du() {
  Nl() || Te(!1);
  let l = C.useContext(Yi),
    { basename: s, future: a, navigator: c } = C.useContext(Ll),
    { matches: d } = C.useContext(ur),
    { pathname: m } = Xi(),
    h = JSON.stringify(yu(d, a.v7_relativeSplatPath)),
    p = C.useRef(!1);
  return (
    K0(() => {
      p.current = !0;
    }),
    C.useCallback(
      function (w, E) {
        if ((E === void 0 && (E = {}), !p.current)) return;
        if (typeof w == "number") {
          c.go(w);
          return;
        }
        let g = ju(w, JSON.parse(h), m, E.relative === "path");
        l == null &&
          s !== "/" &&
          (g.pathname = g.pathname === "/" ? s : D1([s, g.pathname])),
          (E.replace ? c.replace : c.push)(g, E.state, E);
      },
      [s, c, h, m, l]
    )
  );
}
function _u(l, s) {
  return Ru(l, s);
}
function Ru(l, s, a, c) {
  Nl() || Te(!1);
  let { navigator: d, static: m } = C.useContext(Ll),
    { matches: h } = C.useContext(ur),
    p = h[h.length - 1],
    y = p ? p.params : {};
  p && p.pathname;
  let w = p ? p.pathnameBase : "/";
  p && p.route;
  let E = Xi(),
    g;
  if (s) {
    var b;
    let M = typeof s == "string" ? ar(s) : s;
    w === "/" || ((b = M.pathname) != null && b.startsWith(w)) || Te(!1),
      (g = M);
  } else g = E;
  let R = g.pathname || "/",
    P = R;
  if (w !== "/") {
    let M = w.replace(/^\//, "").split("/");
    P = "/" + R.replace(/^\//, "").split("/").slice(M.length).join("/");
  }
  let S = nu(l, { pathname: P }),
    _ = Iu(
      S &&
        S.map((M) =>
          Object.assign({}, M, {
            params: Object.assign({}, y, M.params),
            pathname: D1([
              w,
              d.encodeLocation
                ? d.encodeLocation(M.pathname).pathname
                : M.pathname,
            ]),
            pathnameBase:
              M.pathnameBase === "/"
                ? w
                : D1([
                    w,
                    d.encodeLocation
                      ? d.encodeLocation(M.pathnameBase).pathname
                      : M.pathnameBase,
                  ]),
          })
        ),
      h,
      a,
      c
    );
  return s && _
    ? C.createElement(
        Sl.Provider,
        {
          value: {
            location: Jr(
              {
                pathname: "/",
                search: "",
                hash: "",
                state: null,
                key: "default",
              },
              g
            ),
            navigationType: o1.Pop,
          },
        },
        _
      )
    : _;
}
function Mu() {
  let l = Fu(),
    s = Nu(l)
      ? l.status + " " + l.statusText
      : l instanceof Error
      ? l.message
      : JSON.stringify(l),
    a = l instanceof Error ? l.stack : null,
    d = { padding: "0.5rem", backgroundColor: "rgba(200,200,200, 0.5)" };
  return C.createElement(
    C.Fragment,
    null,
    C.createElement("h2", null, "Unexpected Application Error!"),
    C.createElement("h3", { style: { fontStyle: "italic" } }, s),
    a ? C.createElement("pre", { style: d }, a) : null,
    null
  );
}
const Pu = C.createElement(Mu, null);
class Ou extends C.Component {
  constructor(s) {
    super(s),
      (this.state = {
        location: s.location,
        revalidation: s.revalidation,
        error: s.error,
      });
  }
  static getDerivedStateFromError(s) {
    return { error: s };
  }
  static getDerivedStateFromProps(s, a) {
    return a.location !== s.location ||
      (a.revalidation !== "idle" && s.revalidation === "idle")
      ? { error: s.error, location: s.location, revalidation: s.revalidation }
      : {
          error: s.error !== void 0 ? s.error : a.error,
          location: a.location,
          revalidation: s.revalidation || a.revalidation,
        };
  }
  componentDidCatch(s, a) {
    console.error(
      "React Router caught the following error during render",
      s,
      a
    );
  }
  render() {
    return this.state.error !== void 0
      ? C.createElement(
          ur.Provider,
          { value: this.props.routeContext },
          C.createElement(G0.Provider, {
            value: this.state.error,
            children: this.props.component,
          })
        )
      : this.props.children;
  }
}
function Tu(l) {
  let { routeContext: s, match: a, children: c } = l,
    d = C.useContext(Yi);
  return (
    d &&
      d.static &&
      d.staticContext &&
      (a.route.errorElement || a.route.ErrorBoundary) &&
      (d.staticContext._deepestRenderedBoundaryId = a.route.id),
    C.createElement(ur.Provider, { value: s }, c)
  );
}
function Iu(l, s, a, c) {
  var d;
  if (
    (s === void 0 && (s = []),
    a === void 0 && (a = null),
    c === void 0 && (c = null),
    l == null)
  ) {
    var m;
    if (!a) return null;
    if (a.errors) l = a.matches;
    else if (
      (m = c) != null &&
      m.v7_partialHydration &&
      s.length === 0 &&
      !a.initialized &&
      a.matches.length > 0
    )
      l = a.matches;
    else return null;
  }
  let h = l,
    p = (d = a) == null ? void 0 : d.errors;
  if (p != null) {
    let E = h.findIndex(
      (g) => g.route.id && (p == null ? void 0 : p[g.route.id]) !== void 0
    );
    E >= 0 || Te(!1), (h = h.slice(0, Math.min(h.length, E + 1)));
  }
  let y = !1,
    w = -1;
  if (a && c && c.v7_partialHydration)
    for (let E = 0; E < h.length; E++) {
      let g = h[E];
      if (
        ((g.route.HydrateFallback || g.route.hydrateFallbackElement) && (w = E),
        g.route.id)
      ) {
        let { loaderData: b, errors: R } = a,
          P =
            g.route.loader &&
            b[g.route.id] === void 0 &&
            (!R || R[g.route.id] === void 0);
        if (g.route.lazy || P) {
          (y = !0), w >= 0 ? (h = h.slice(0, w + 1)) : (h = [h[0]]);
          break;
        }
      }
    }
  return h.reduceRight((E, g, b) => {
    let R,
      P = !1,
      S = null,
      _ = null;
    a &&
      ((R = p && g.route.id ? p[g.route.id] : void 0),
      (S = g.route.errorElement || Pu),
      y &&
        (w < 0 && b === 0
          ? (Uu("route-fallback"), (P = !0), (_ = null))
          : w === b &&
            ((P = !0), (_ = g.route.hydrateFallbackElement || null))));
    let M = s.concat(h.slice(0, b + 1)),
      H = () => {
        let V;
        return (
          R
            ? (V = S)
            : P
            ? (V = _)
            : g.route.Component
            ? (V = C.createElement(g.route.Component, null))
            : g.route.element
            ? (V = g.route.element)
            : (V = E),
          C.createElement(Tu, {
            match: g,
            routeContext: { outlet: E, matches: M, isDataRoute: a != null },
            children: V,
          })
        );
      };
    return a && (g.route.ErrorBoundary || g.route.errorElement || b === 0)
      ? C.createElement(Ou, {
          location: a.location,
          revalidation: a.revalidation,
          component: S,
          error: R,
          children: H(),
          routeContext: { outlet: null, matches: M, isDataRoute: !0 },
        })
      : H();
  }, null);
}
var Q0 = (function (l) {
    return (
      (l.UseBlocker = "useBlocker"),
      (l.UseRevalidator = "useRevalidator"),
      (l.UseNavigateStable = "useNavigate"),
      l
    );
  })(Q0 || {}),
  Y0 = (function (l) {
    return (
      (l.UseBlocker = "useBlocker"),
      (l.UseLoaderData = "useLoaderData"),
      (l.UseActionData = "useActionData"),
      (l.UseRouteError = "useRouteError"),
      (l.UseNavigation = "useNavigation"),
      (l.UseRouteLoaderData = "useRouteLoaderData"),
      (l.UseMatches = "useMatches"),
      (l.UseRevalidator = "useRevalidator"),
      (l.UseNavigateStable = "useNavigate"),
      (l.UseRouteId = "useRouteId"),
      l
    );
  })(Y0 || {});
function Au(l) {
  let s = C.useContext(Yi);
  return s || Te(!1), s;
}
function Bu(l) {
  let s = C.useContext(ku);
  return s || Te(!1), s;
}
function zu(l) {
  let s = C.useContext(ur);
  return s || Te(!1), s;
}
function X0(l) {
  let s = zu(),
    a = s.matches[s.matches.length - 1];
  return a.route.id || Te(!1), a.route.id;
}
function Fu() {
  var l;
  let s = C.useContext(G0),
    a = Bu(),
    c = X0();
  return s !== void 0 ? s : (l = a.errors) == null ? void 0 : l[c];
}
function Vu() {
  let { router: l } = Au(Q0.UseNavigateStable),
    s = X0(Y0.UseNavigateStable),
    a = C.useRef(!1);
  return (
    K0(() => {
      a.current = !0;
    }),
    C.useCallback(
      function (d, m) {
        m === void 0 && (m = {}),
          a.current &&
            (typeof d == "number"
              ? l.navigate(d)
              : l.navigate(d, Jr({ fromRouteId: s }, m)));
      },
      [l, s]
    )
  );
}
const m0 = {};
function Uu(l, s, a) {
  m0[l] || (m0[l] = !0);
}
function Hu(l, s) {
  l == null || l.v7_startTransition, l == null || l.v7_relativeSplatPath;
}
function i1(l) {
  Te(!1);
}
function Zu(l) {
  let {
    basename: s = "/",
    children: a = null,
    location: c,
    navigationType: d = o1.Pop,
    navigator: m,
    static: h = !1,
    future: p,
  } = l;
  Nl() && Te(!1);
  let y = s.replace(/^\/*/, "/"),
    w = C.useMemo(
      () => ({
        basename: y,
        navigator: m,
        static: h,
        future: Jr({ v7_relativeSplatPath: !1 }, p),
      }),
      [y, p, m, h]
    );
  typeof c == "string" && (c = ar(c));
  let {
      pathname: E = "/",
      search: g = "",
      hash: b = "",
      state: R = null,
      key: P = "default",
    } = c,
    S = C.useMemo(() => {
      let _ = W0(E, y);
      return _ == null
        ? null
        : {
            location: { pathname: _, search: g, hash: b, state: R, key: P },
            navigationType: d,
          };
    }, [y, E, g, b, R, P, d]);
  return S == null
    ? null
    : C.createElement(
        Ll.Provider,
        { value: w },
        C.createElement(Sl.Provider, { children: a, value: S })
      );
}
function Wu(l) {
  let { children: s, location: a } = l;
  return _u(Hi(s), a);
}
new Promise(() => {});
function Hi(l, s) {
  s === void 0 && (s = []);
  let a = [];
  return (
    C.Children.forEach(l, (c, d) => {
      if (!C.isValidElement(c)) return;
      let m = [...s, d];
      if (c.type === C.Fragment) {
        a.push.apply(a, Hi(c.props.children, m));
        return;
      }
      c.type !== i1 && Te(!1), !c.props.index || !c.props.children || Te(!1);
      let h = {
        id: c.props.id || m.join("-"),
        caseSensitive: c.props.caseSensitive,
        element: c.props.element,
        Component: c.props.Component,
        index: c.props.index,
        path: c.props.path,
        loader: c.props.loader,
        action: c.props.action,
        errorElement: c.props.errorElement,
        ErrorBoundary: c.props.ErrorBoundary,
        hasErrorBoundary:
          c.props.ErrorBoundary != null || c.props.errorElement != null,
        shouldRevalidate: c.props.shouldRevalidate,
        handle: c.props.handle,
        lazy: c.props.lazy,
      };
      c.props.children && (h.children = Hi(c.props.children, m)), a.push(h);
    }),
    a
  );
}
/**
 * React Router DOM v6.30.0
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */ const $u = "6";
try {
  window.__reactRouterVersion = $u;
} catch {}
const Gu = "startTransition",
  p0 = B0[Gu];
function Ku(l) {
  let { basename: s, children: a, future: c, window: d } = l,
    m = C.useRef();
  m.current == null && (m.current = eu({ window: d, v5Compat: !0 }));
  let h = m.current,
    [p, y] = C.useState({ action: h.action, location: h.location }),
    { v7_startTransition: w } = c || {},
    E = C.useCallback(
      (g) => {
        w && p0 ? p0(() => y(g)) : y(g);
      },
      [y, w]
    );
  return (
    C.useLayoutEffect(() => h.listen(E), [h, E]),
    C.useEffect(() => Hu(c), [c]),
    C.createElement(Zu, {
      basename: s,
      children: a,
      location: p.location,
      navigationType: p.action,
      navigator: h,
      future: c,
    })
  );
}
var h0;
(function (l) {
  (l.UseScrollRestoration = "useScrollRestoration"),
    (l.UseSubmit = "useSubmit"),
    (l.UseSubmitFetcher = "useSubmitFetcher"),
    (l.UseFetcher = "useFetcher"),
    (l.useViewTransitionState = "useViewTransitionState");
})(h0 || (h0 = {}));
var C0;
(function (l) {
  (l.UseFetcher = "useFetcher"),
    (l.UseFetchers = "useFetchers"),
    (l.UseScrollRestoration = "useScrollRestoration");
})(C0 || (C0 = {}));
const vl = () => !window.invokeNative,
  Qu = () => {},
  _1 = (l, s) => {
    const a = C.useRef(Qu);
    C.useEffect(() => {
      a.current = s;
    }, [s]),
      C.useEffect(() => {
        const c = (d) => {
          const { action: m, data: h } = d.data;
          a.current && m === l && a.current(h);
        };
        return (
          window.addEventListener("message", c),
          () => window.removeEventListener("message", c)
        );
      }, [l]);
  };
async function de(l, s, a) {
  const c = { method: "post", body: JSON.stringify(s) };
  if (vl() && a) return a;
  const d = window.GetParentResourceName
    ? window.GetParentResourceName()
    : "nui-frame-app";
  return await (await fetch(`https://${d}/${l}`, c)).json();
}
const Yu = {},
  x0 = (l) => {
    let s;
    const a = new Set(),
      c = (E, g) => {
        const b = typeof E == "function" ? E(s) : E;
        if (!Object.is(b, s)) {
          const R = s;
          (s =
            g ?? (typeof b != "object" || b === null)
              ? b
              : Object.assign({}, s, b)),
            a.forEach((P) => P(s, R));
        }
      },
      d = () => s,
      y = {
        setState: c,
        getState: d,
        getInitialState: () => w,
        subscribe: (E) => (a.add(E), () => a.delete(E)),
        destroy: () => {
          (Yu ? "production" : void 0) !== "production" &&
            console.warn(
              "[DEPRECATED] The `destroy` method will be unsupported in a future version. Instead use unsubscribe function returned by subscribe. Everything will be garbage-collected if store is garbage-collected."
            ),
            a.clear();
        },
      },
      w = (s = l(c, d, y));
    return y;
  },
  Xu = (l) => (l ? x0(l) : x0);
var _i = { exports: {} },
  Ri = {},
  Mi = { exports: {} },
  Pi = {};
/**
 * @license React
 * use-sync-external-store-shim.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var g0;
function Ju() {
  if (g0) return Pi;
  g0 = 1;
  var l = tn();
  function s(g, b) {
    return (g === b && (g !== 0 || 1 / g === 1 / b)) || (g !== g && b !== b);
  }
  var a = typeof Object.is == "function" ? Object.is : s,
    c = l.useState,
    d = l.useEffect,
    m = l.useLayoutEffect,
    h = l.useDebugValue;
  function p(g, b) {
    var R = b(),
      P = c({ inst: { value: R, getSnapshot: b } }),
      S = P[0].inst,
      _ = P[1];
    return (
      m(
        function () {
          (S.value = R), (S.getSnapshot = b), y(S) && _({ inst: S });
        },
        [g, R, b]
      ),
      d(
        function () {
          return (
            y(S) && _({ inst: S }),
            g(function () {
              y(S) && _({ inst: S });
            })
          );
        },
        [g]
      ),
      h(R),
      R
    );
  }
  function y(g) {
    var b = g.getSnapshot;
    g = g.value;
    try {
      var R = b();
      return !a(g, R);
    } catch {
      return !0;
    }
  }
  function w(g, b) {
    return b();
  }
  var E =
    typeof window > "u" ||
    typeof window.document > "u" ||
    typeof window.document.createElement > "u"
      ? w
      : p;
  return (
    (Pi.useSyncExternalStore =
      l.useSyncExternalStore !== void 0 ? l.useSyncExternalStore : E),
    Pi
  );
}
var v0;
function qu() {
  return v0 || ((v0 = 1), (Mi.exports = Ju())), Mi.exports;
}
/**
 * @license React
 * use-sync-external-store-shim/with-selector.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var w0;
function e6() {
  if (w0) return Ri;
  w0 = 1;
  var l = tn(),
    s = qu();
  function a(w, E) {
    return (w === E && (w !== 0 || 1 / w === 1 / E)) || (w !== w && E !== E);
  }
  var c = typeof Object.is == "function" ? Object.is : a,
    d = s.useSyncExternalStore,
    m = l.useRef,
    h = l.useEffect,
    p = l.useMemo,
    y = l.useDebugValue;
  return (
    (Ri.useSyncExternalStoreWithSelector = function (w, E, g, b, R) {
      var P = m(null);
      if (P.current === null) {
        var S = { hasValue: !1, value: null };
        P.current = S;
      } else S = P.current;
      P = p(
        function () {
          function M(re) {
            if (!H) {
              if (
                ((H = !0), (V = re), (re = b(re)), R !== void 0 && S.hasValue)
              ) {
                var Y = S.value;
                if (R(Y, re)) return (F = Y);
              }
              return (F = re);
            }
            if (((Y = F), c(V, re))) return Y;
            var fe = b(re);
            return R !== void 0 && R(Y, fe)
              ? ((V = re), Y)
              : ((V = re), (F = fe));
          }
          var H = !1,
            V,
            F,
            ee = g === void 0 ? null : g;
          return [
            function () {
              return M(E());
            },
            ee === null
              ? void 0
              : function () {
                  return M(ee());
                },
          ];
        },
        [E, g, b, R]
      );
      var _ = d(w, P[0], P[1]);
      return (
        h(
          function () {
            (S.hasValue = !0), (S.value = _);
          },
          [_]
        ),
        y(_),
        _
      );
    }),
    Ri
  );
}
var y0;
function t6() {
  return y0 || ((y0 = 1), (_i.exports = e6())), _i.exports;
}
var r6 = t6();
const n6 = El(r6),
  Ji = {},
  { useDebugValue: l6 } = _t,
  { useSyncExternalStoreWithSelector: i6 } = n6;
let j0 = !1;
const s6 = (l) => l;
function o6(l, s = s6, a) {
  (Ji ? "production" : void 0) !== "production" &&
    a &&
    !j0 &&
    (console.warn(
      "[DEPRECATED] Use `createWithEqualityFn` instead of `create` or use `useStoreWithEqualityFn` instead of `useStore`. They can be imported from 'zustand/traditional'. https://github.com/pmndrs/zustand/discussions/1937"
    ),
    (j0 = !0));
  const c = i6(
    l.subscribe,
    l.getState,
    l.getServerState || l.getInitialState,
    s,
    a
  );
  return l6(c), c;
}
const E0 = (l) => {
    (Ji ? "production" : void 0) !== "production" &&
      typeof l != "function" &&
      console.warn(
        "[DEPRECATED] Passing a vanilla store will be unsupported in a future version. Instead use `import { useStore } from 'zustand'`."
      );
    const s = typeof l == "function" ? Xu(l) : l,
      a = (c, d) => o6(s, c, d);
    return Object.assign(a, s), a;
  },
  a6 = (l) => (l ? E0(l) : E0);
var J0 = (l) => (
  (Ji ? "production" : void 0) !== "production" &&
    console.warn(
      "[DEPRECATED] Default export is deprecated. Instead use `import { create } from 'zustand'`."
    ),
  a6(l)
);
const Me = J0((l) => ({
  radio: 1,
  setRadio: (s) => l({ radio: s }),
  preset: { male: "", female: "" },
  setPreset: (s) => l({ preset: s }),
  openedModal: !1,
  setOpenedModal: (s) => l({ openedModal: s }),
  openedPermissionsModal: !1,
  setOpenedPermissionsModal: (s) => l({ openedPermissionsModal: s }),
  openedPartnerModal: !1,
  setOpenedPartnerModal: (s) => l({ openedPartnerModal: s }),
  partners: [],
  setPartners: (s) => l({ partners: s }),
  openedEditGoal: !1,
  setOpenedEditGoal: (s) => l({ openedEditGoal: s }),
  goals: { prize: "", my: [], faction: [], members: [] },
  setGoals: (s) => l({ goals: s }),
  openedNewGoal: !1,
  setOpenedNewGoal: (s) => l({ openedNewGoal: s }),
  typeNewGoal: "",
  setTypeNewGoal: (s) => l({ typeNewGoal: s }),
  contractModal: !1,
  setOpenedContractModal: (s) => l({ contractModal: s }),
  user_id: 0,
  setUserId: (s) => l({ user_id: s }),
  setCanWarn: (s) => l({ canWarn: s }),
  canWarn: !1,
  avatar: "",
  setAvatar: (s) => l({ avatar: s }),
  setWarnings: (s) => l({ warnings: s }),
  warnings: [],
  orgBalance: 0,
  setOrgBalance: (s) => l({ orgBalance: s }),
  playerBalance: 0,
  setPlayerBalance: (s) => l({ playerBalance: s }),
  name: "fivecommunity",
  setName: (s) => l({ name: s }),
  setWarningModalVisible: (s) => l({ warningModalVisible: s }),
  warningModalVisible: !1,
  logo: "",
  setLogo: (s) => l({ logo: s }),
  leader: "",
  members: 0,
  membersOnline: 0,
  goalReward: 0,
  setGoalReward: (s) => l({ goalReward: s }),
  setMembers: (s) => l({ members: s }),
  setMembersOnline: (s) => l({ membersOnline: s }),
  setleader: (s) => l({ leader: s }),
  orgName: "",
  setOrgName: (s) => l({ orgName: s }),
  permissionsModalVisible: !1,
  setPermissionsModalVisible: (s) => l({ permissionsModalVisible: s }),
  roleEdit: "",
  setRoleEdit: (s) => l({ roleEdit: s }),
  setPermissions: (s) => l({ permissions: s }),
  permissions: {
    name: !1,
    promote: !1,
    demote: !1,
    dismiss: !1,
    withdraw: !1,
    deposit: !1,
    message: !1,
    alerts: !1,
    invite: !1,
    leader: !1,
    chat: !1,
  },
  roles: [],
  setRoles: (s) => l({ roles: s }),
  discord: "",
  setDiscord: (s) => l({ discord: s }),
  serverIcon: "",
  setServerIcon: (s) => l({ serverIcon: s }),
  nextPayment: !1,
  setNextPayment: (s) => l({ nextPayment: s }),
  salary: 0,
  setSalary: (s) => l({ salary: s }),
  store: "",
  setStore: (s) => l({ store: s }),
  nextPaymentMax: 0,
  setNextPaymentMax: (s) => l({ nextPaymentMax: s }),
  setGoalModalVisible: (s) => l({ goalModalVisible: s }),
  goalModalVisible: !1,
  setConfigModalVisible: (s) => l({ configModalVisible: s }),
  configModalVisible: !1,
  update: (s) => l({ ...s }),
  max: 0,
  setMax: (s) => l({ max: s }),
  current: 0,
  setCurrent: (s) => l({ current: s }),
  title: "",
  setTitle: (s) => l({ title: s }),
  description: "",
  setDescription: (s) => l({ description: s }),
  index: null,
  setIndex: (s) => l({ index: s }),
  painelType: "legal",
  setPainelType: (s) => l({ painelType: s }),
  maxMembers: 0,
  setMaxMembers: (s) => l({ maxMembers: s }),
}));
J0((l) => ({
  modal: {
    time: 0,
    title: "",
    description: "",
    placeholder: "",
    save: (s) => {},
  },
  setModal: (s) => l({ modal: s }),
}));
const u6 = C.createContext(null),
  c6 = ({ children: l }) => {
    const s = bl(),
      [a, c] = C.useState(vl()),
      {
        setPainelType: d,
        setPreset: m,
        setRadio: h,
        setWarnings: p,
        setUserId: y,
        setMaxMembers: w,
        setAvatar: E,
        setOrgBalance: g,
        setWarningModalVisible: b,
        setConfigModalVisible: R,
        setGoalModalVisible: P,
        setServerIcon: S,
        setName: _,
        setPlayerBalance: M,
        setCanWarn: H,
        setDiscord: V,
        setLogo: F,
        setMembers: ee,
        setNextPaymentMax: re,
        setStore: Y,
        setMembersOnline: fe,
        setleader: Ie,
        setOrgName: be,
        setPermissions: xe,
        setRoles: _e,
        setNextPayment: Se,
        setSalary: Ue,
        setGoalReward: He,
      } = Me();
    function je() {
      de(
        "GetPainelInfos",
        {},
        {
          radio: 1336,
          user_id: 1337,
          preset: { male: "aa", female: "bbb" },
          avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
          orgBalance: 25e3,
          name: "fivecommunity",
          leader: "fivecommunity",
          serverIcon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
          orgName: "Turquia",
          members: 25,
          membersOnline: 10,
          salary: 5e3,
          nextPayment: 4e3,
          nextPaymentMax: 2e3,
          goalReward: 1e3,
          store: "https://discord.gg/fivecommunity",
          playerBalance: 1e5,
          type: "ilegal",
          roles: [
            { prefix: "Membro", group: "Membro", nivel: 2, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
            { prefix: "Líder", group: "Líder", nivel: 1, members: 23 },
          ],
          maxMembers: 50,
          discord: "https://discord.gg/fivecommunity",
          permissions: {
            name: !0,
            promote: !0,
            demote: !1,
            dismiss: !1,
            withdraw: !1,
            deposit: !1,
            message: !0,
            alerts: !0,
            invite: !1,
            chat: !0,
            leader: !0,
          },
          logo: "",
          canWarn: !0,
          warnings: [
            {
              author: "fivecommunity",
              author_id: 1337,
              message:
                "Recrutamento para a Polícia da Baixada RJ está oficialmente aberto! Interessados devem comparecer ao Departamento de Polícia 2 (DP2) para maiores informações e formalizar sua candidatura. Não se esqueçam de verificar o fardamento e o manual de conduta, que estão disponíveis no e-mail, na aba destinada ao conteúdo da corporação",
              author_avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
              date: "15/03/2024",
            },
            {
              author: "fivecommunity",
              author_id: 1337,
              author_avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
              message:
                "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
              date: "15/03/2024",
            },
            {
              author: "fivecommunity",
              author_id: 1337,
              author_avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
              message:
                "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
              date: "15/03/2024",
            },
            {
              author: "fivecommunity",
              author_id: 1337,
              author_avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
              message:
                "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
              date: "15/03/2024",
            },
            {
              author: "fivecommunity",
              author_id: 1337,
              author_avatar: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
              message:
                "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
              date: "15/03/2024",
            },
          ],
        }
      ).then((Q) => {
        h(Q.radio),
          E(Q.avatar),
          y(Q.user_id),
          g(Q.orgBalance),
          _(Q.name),
          F(Q.logo),
          H(Q.canWarn),
          M(Q.playerBalance),
          xe(Q.permissions),
          Ie(Q.leader),
          ee(Q.members),
          fe(Q.membersOnline),
          p(Q.warnings),
          be(Q.orgName),
          _e(Q.roles),
          S(Q.serverIcon),
          V(Q.discord),
          Se(Q.nextPayment),
          Ue(Q.salary),
          Y(Q.store),
          re(Q.nextPaymentMax),
          He(Q.goalReward),
          m(Q.preset),
          w(Q.maxMembers),
          d(Q.type);
      });
    }
    return (
      C.useEffect(() => {
        vl() && je();
      }, []),
      _1("open", () => {
        c(!0), s("/"), P(!1), b(!1), R(!1), je();
      }),
      _1("UpdatePermissions", xe),
      _1("close", () => c(!1)),
      C.useEffect(() => {
        if (!a) return;
        const Q = (z) => {
          if (z.code === "Escape") {
            if (vl()) return c(!1);
            c(!1), de("close");
          }
        };
        return (
          window.addEventListener("keydown", Q),
          () => window.removeEventListener("keydown", Q)
        );
      }, [a]),
      i.jsx(u6.Provider, { value: {}, children: a && l })
    );
  };
function d6() {
  const { user_id: l, name: s, avatar: a } = Me();
  return i.jsxs("div", {
    className: "mx-auto flex flex-col items-center gap-5",
    children: [
      i.jsxs("div", {
        className:
          "size-[7.5rem] rounded-full border border-primary shadow-[0_0_14px_0] shadow-primary/45 relative",
        children: [
          i.jsx("span", {
            className:
              "absolute left-1/2 -translate-x-1/2 -bottom-1 px-3.5 h-[1.125rem] rounded-md bg-primary shadow-[0_0_14px_0] shadow-primary/45 text-[#151515] font-bold text-[.625rem]",
            children: "PREMIUM",
          }),
          i.jsx("img", {
            src: a,
            alt: "avatar",
            className: "w-full h-full object-cover rounded-full",
          }),
        ],
      }),
      i.jsxs("div", {
        className: "flex flex-col items-center gap-[.5625rem]",
        children: [
          i.jsx("span", {
            className:
              "text-white font-bold text-[1.4375rem] leading-[1.0625rem]",
            children: s,
          }),
          i.jsxs("span", {
            className: "text-white/60 font-semibold text-sm leading-[.625rem]",
            children: ["#", l],
          }),
        ],
      }),
    ],
  });
}
function q0(l) {
  var s,
    a,
    c = "";
  if (typeof l == "string" || typeof l == "number") c += l;
  else if (typeof l == "object")
    if (Array.isArray(l)) {
      var d = l.length;
      for (s = 0; s < d; s++)
        l[s] && (a = q0(l[s])) && (c && (c += " "), (c += a));
    } else for (a in l) l[a] && (c && (c += " "), (c += a));
  return c;
}
function ie() {
  for (var l, s, a = 0, c = "", d = arguments.length; a < d; a++)
    (l = arguments[a]) && (s = q0(l)) && (c && (c += " "), (c += s));
  return c;
}
function nt(l, s, { checkForDefaultPrevented: a = !0 } = {}) {
  return function (d) {
    if ((l == null || l(d), a === !1 || !d.defaultPrevented))
      return s == null ? void 0 : s(d);
  };
}
function L0(l, s) {
  if (typeof l == "function") return l(s);
  l != null && (l.current = s);
}
function ea(...l) {
  return (s) => {
    let a = !1;
    const c = l.map((d) => {
      const m = L0(d, s);
      return !a && typeof m == "function" && (a = !0), m;
    });
    if (a)
      return () => {
        for (let d = 0; d < c.length; d++) {
          const m = c[d];
          typeof m == "function" ? m() : L0(l[d], null);
        }
      };
  };
}
function lt(...l) {
  return C.useCallback(ea(...l), l);
}
function f6(l, s) {
  const a = C.createContext(s),
    c = (m) => {
      const { children: h, ...p } = m,
        y = C.useMemo(() => p, Object.values(p));
      return i.jsx(a.Provider, { value: y, children: h });
    };
  c.displayName = l + "Provider";
  function d(m) {
    const h = C.useContext(a);
    if (h) return h;
    if (s !== void 0) return s;
    throw new Error(`\`${m}\` must be used within \`${l}\``);
  }
  return [c, d];
}
function qi(l, s = []) {
  let a = [];
  function c(m, h) {
    const p = C.createContext(h),
      y = a.length;
    a = [...a, h];
    const w = (g) => {
      var M;
      const { scope: b, children: R, ...P } = g,
        S = ((M = b == null ? void 0 : b[l]) == null ? void 0 : M[y]) || p,
        _ = C.useMemo(() => P, Object.values(P));
      return i.jsx(S.Provider, { value: _, children: R });
    };
    w.displayName = m + "Provider";
    function E(g, b) {
      var S;
      const R = ((S = b == null ? void 0 : b[l]) == null ? void 0 : S[y]) || p,
        P = C.useContext(R);
      if (P) return P;
      if (h !== void 0) return h;
      throw new Error(`\`${g}\` must be used within \`${m}\``);
    }
    return [w, E];
  }
  const d = () => {
    const m = a.map((h) => C.createContext(h));
    return function (p) {
      const y = (p == null ? void 0 : p[l]) || m;
      return C.useMemo(() => ({ [`__scope${l}`]: { ...p, [l]: y } }), [p, y]);
    };
  };
  return (d.scopeName = l), [c, m6(d, ...s)];
}
function m6(...l) {
  const s = l[0];
  if (l.length === 1) return s;
  const a = () => {
    const c = l.map((d) => ({ useScope: d(), scopeName: d.scopeName }));
    return function (m) {
      const h = c.reduce((p, { useScope: y, scopeName: w }) => {
        const g = y(m)[`__scope${w}`];
        return { ...p, ...g };
      }, {});
      return C.useMemo(() => ({ [`__scope${s.scopeName}`]: h }), [h]);
    };
  };
  return (a.scopeName = s.scopeName), a;
}
var qr =
    globalThis != null && globalThis.document ? C.useLayoutEffect : () => {},
  p6 = B0.useId || (() => {}),
  h6 = 0;
function Oi(l) {
  const [s, a] = C.useState(p6());
  return (
    qr(() => {
      a((c) => c ?? String(h6++));
    }, [l]),
    l || (s ? `radix-${s}` : "")
  );
}
function R1(l) {
  const s = C.useRef(l);
  return (
    C.useEffect(() => {
      s.current = l;
    }),
    C.useMemo(
      () =>
        (...a) => {
          var c;
          return (c = s.current) == null ? void 0 : c.call(s, ...a);
        },
      []
    )
  );
}
function ta({ prop: l, defaultProp: s, onChange: a = () => {} }) {
  const [c, d] = C6({ defaultProp: s, onChange: a }),
    m = l !== void 0,
    h = m ? l : c,
    p = R1(a),
    y = C.useCallback(
      (w) => {
        if (m) {
          const g = typeof w == "function" ? w(l) : w;
          g !== l && p(g);
        } else d(w);
      },
      [m, l, d, p]
    );
  return [h, y];
}
function C6({ defaultProp: l, onChange: s }) {
  const a = C.useState(l),
    [c] = a,
    d = C.useRef(c),
    m = R1(s);
  return (
    C.useEffect(() => {
      d.current !== c && (m(c), (d.current = c));
    }, [c, d, m]),
    a
  );
}
var en = C.forwardRef((l, s) => {
  const { children: a, ...c } = l,
    d = C.Children.toArray(a),
    m = d.find(g6);
  if (m) {
    const h = m.props.children,
      p = d.map((y) =>
        y === m
          ? C.Children.count(h) > 1
            ? C.Children.only(null)
            : C.isValidElement(h)
            ? h.props.children
            : null
          : y
      );
    return i.jsx(Zi, {
      ...c,
      ref: s,
      children: C.isValidElement(h) ? C.cloneElement(h, void 0, p) : null,
    });
  }
  return i.jsx(Zi, { ...c, ref: s, children: a });
});
en.displayName = "Slot";
var Zi = C.forwardRef((l, s) => {
  const { children: a, ...c } = l;
  if (C.isValidElement(a)) {
    const d = w6(a),
      m = v6(c, a.props);
    return (
      a.type !== C.Fragment && (m.ref = s ? ea(s, d) : d), C.cloneElement(a, m)
    );
  }
  return C.Children.count(a) > 1 ? C.Children.only(null) : null;
});
Zi.displayName = "SlotClone";
var x6 = ({ children: l }) => i.jsx(i.Fragment, { children: l });
function g6(l) {
  return C.isValidElement(l) && l.type === x6;
}
function v6(l, s) {
  const a = { ...s };
  for (const c in s) {
    const d = l[c],
      m = s[c];
    /^on[A-Z]/.test(c)
      ? d && m
        ? (a[c] = (...p) => {
            m(...p), d(...p);
          })
        : d && (a[c] = d)
      : c === "style"
      ? (a[c] = { ...d, ...m })
      : c === "className" && (a[c] = [d, m].filter(Boolean).join(" "));
  }
  return { ...l, ...a };
}
function w6(l) {
  var c, d;
  let s =
      (c = Object.getOwnPropertyDescriptor(l.props, "ref")) == null
        ? void 0
        : c.get,
    a = s && "isReactWarning" in s && s.isReactWarning;
  return a
    ? l.ref
    : ((s =
        (d = Object.getOwnPropertyDescriptor(l, "ref")) == null
          ? void 0
          : d.get),
      (a = s && "isReactWarning" in s && s.isReactWarning),
      a ? l.props.ref : l.props.ref || l.ref);
}
var y6 = [
    "a",
    "button",
    "div",
    "form",
    "h2",
    "h3",
    "img",
    "input",
    "label",
    "li",
    "nav",
    "ol",
    "p",
    "span",
    "svg",
    "ul",
  ],
  ct = y6.reduce((l, s) => {
    const a = C.forwardRef((c, d) => {
      const { asChild: m, ...h } = c,
        p = m ? en : s;
      return (
        typeof window < "u" && (window[Symbol.for("radix-ui")] = !0),
        i.jsx(p, { ...h, ref: d })
      );
    });
    return (a.displayName = `Primitive.${s}`), { ...l, [s]: a };
  }, {});
function j6(l, s) {
  l && F0.flushSync(() => l.dispatchEvent(s));
}
function E6(l, s = globalThis == null ? void 0 : globalThis.document) {
  const a = R1(l);
  C.useEffect(() => {
    const c = (d) => {
      d.key === "Escape" && a(d);
    };
    return (
      s.addEventListener("keydown", c, { capture: !0 }),
      () => s.removeEventListener("keydown", c, { capture: !0 })
    );
  }, [a, s]);
}
var L6 = "DismissableLayer",
  Wi = "dismissableLayer.update",
  S6 = "dismissableLayer.pointerDownOutside",
  N6 = "dismissableLayer.focusOutside",
  S0,
  ra = C.createContext({
    layers: new Set(),
    layersWithOutsidePointerEventsDisabled: new Set(),
    branches: new Set(),
  }),
  na = C.forwardRef((l, s) => {
    const {
        disableOutsidePointerEvents: a = !1,
        onEscapeKeyDown: c,
        onPointerDownOutside: d,
        onFocusOutside: m,
        onInteractOutside: h,
        onDismiss: p,
        ...y
      } = l,
      w = C.useContext(ra),
      [E, g] = C.useState(null),
      b =
        (E == null ? void 0 : E.ownerDocument) ??
        (globalThis == null ? void 0 : globalThis.document),
      [, R] = C.useState({}),
      P = lt(s, (Y) => g(Y)),
      S = Array.from(w.layers),
      [_] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1),
      M = S.indexOf(_),
      H = E ? S.indexOf(E) : -1,
      V = w.layersWithOutsidePointerEventsDisabled.size > 0,
      F = H >= M,
      ee = D6((Y) => {
        const fe = Y.target,
          Ie = [...w.branches].some((be) => be.contains(fe));
        !F ||
          Ie ||
          (d == null || d(Y),
          h == null || h(Y),
          Y.defaultPrevented || p == null || p());
      }, b),
      re = _6((Y) => {
        const fe = Y.target;
        [...w.branches].some((be) => be.contains(fe)) ||
          (m == null || m(Y),
          h == null || h(Y),
          Y.defaultPrevented || p == null || p());
      }, b);
    return (
      E6((Y) => {
        H === w.layers.size - 1 &&
          (c == null || c(Y),
          !Y.defaultPrevented && p && (Y.preventDefault(), p()));
      }, b),
      C.useEffect(() => {
        if (E)
          return (
            a &&
              (w.layersWithOutsidePointerEventsDisabled.size === 0 &&
                ((S0 = b.body.style.pointerEvents),
                (b.body.style.pointerEvents = "none")),
              w.layersWithOutsidePointerEventsDisabled.add(E)),
            w.layers.add(E),
            N0(),
            () => {
              a &&
                w.layersWithOutsidePointerEventsDisabled.size === 1 &&
                (b.body.style.pointerEvents = S0);
            }
          );
      }, [E, b, a, w]),
      C.useEffect(
        () => () => {
          E &&
            (w.layers.delete(E),
            w.layersWithOutsidePointerEventsDisabled.delete(E),
            N0());
        },
        [E, w]
      ),
      C.useEffect(() => {
        const Y = () => R({});
        return (
          document.addEventListener(Wi, Y),
          () => document.removeEventListener(Wi, Y)
        );
      }, []),
      i.jsx(ct.div, {
        ...y,
        ref: P,
        style: {
          pointerEvents: V ? (F ? "auto" : "none") : void 0,
          ...l.style,
        },
        onFocusCapture: nt(l.onFocusCapture, re.onFocusCapture),
        onBlurCapture: nt(l.onBlurCapture, re.onBlurCapture),
        onPointerDownCapture: nt(
          l.onPointerDownCapture,
          ee.onPointerDownCapture
        ),
      })
    );
  });
na.displayName = L6;
var b6 = "DismissableLayerBranch",
  k6 = C.forwardRef((l, s) => {
    const a = C.useContext(ra),
      c = C.useRef(null),
      d = lt(s, c);
    return (
      C.useEffect(() => {
        const m = c.current;
        if (m)
          return (
            a.branches.add(m),
            () => {
              a.branches.delete(m);
            }
          );
      }, [a.branches]),
      i.jsx(ct.div, { ...l, ref: d })
    );
  });
k6.displayName = b6;
function D6(l, s = globalThis == null ? void 0 : globalThis.document) {
  const a = R1(l),
    c = C.useRef(!1),
    d = C.useRef(() => {});
  return (
    C.useEffect(() => {
      const m = (p) => {
          if (p.target && !c.current) {
            let y = function () {
              la(S6, a, w, { discrete: !0 });
            };
            const w = { originalEvent: p };
            p.pointerType === "touch"
              ? (s.removeEventListener("click", d.current),
                (d.current = y),
                s.addEventListener("click", d.current, { once: !0 }))
              : y();
          } else s.removeEventListener("click", d.current);
          c.current = !1;
        },
        h = window.setTimeout(() => {
          s.addEventListener("pointerdown", m);
        }, 0);
      return () => {
        window.clearTimeout(h),
          s.removeEventListener("pointerdown", m),
          s.removeEventListener("click", d.current);
      };
    }, [s, a]),
    { onPointerDownCapture: () => (c.current = !0) }
  );
}
function _6(l, s = globalThis == null ? void 0 : globalThis.document) {
  const a = R1(l),
    c = C.useRef(!1);
  return (
    C.useEffect(() => {
      const d = (m) => {
        m.target &&
          !c.current &&
          la(N6, a, { originalEvent: m }, { discrete: !1 });
      };
      return (
        s.addEventListener("focusin", d),
        () => s.removeEventListener("focusin", d)
      );
    }, [s, a]),
    {
      onFocusCapture: () => (c.current = !0),
      onBlurCapture: () => (c.current = !1),
    }
  );
}
function N0() {
  const l = new CustomEvent(Wi);
  document.dispatchEvent(l);
}
function la(l, s, a, { discrete: c }) {
  const d = a.originalEvent.target,
    m = new CustomEvent(l, { bubbles: !1, cancelable: !0, detail: a });
  s && d.addEventListener(l, s, { once: !0 }),
    c ? j6(d, m) : d.dispatchEvent(m);
}
var Ti = "focusScope.autoFocusOnMount",
  Ii = "focusScope.autoFocusOnUnmount",
  b0 = { bubbles: !1, cancelable: !0 },
  R6 = "FocusScope",
  ia = C.forwardRef((l, s) => {
    const {
        loop: a = !1,
        trapped: c = !1,
        onMountAutoFocus: d,
        onUnmountAutoFocus: m,
        ...h
      } = l,
      [p, y] = C.useState(null),
      w = R1(d),
      E = R1(m),
      g = C.useRef(null),
      b = lt(s, (S) => y(S)),
      R = C.useRef({
        paused: !1,
        pause() {
          this.paused = !0;
        },
        resume() {
          this.paused = !1;
        },
      }).current;
    C.useEffect(() => {
      if (c) {
        let S = function (V) {
            if (R.paused || !p) return;
            const F = V.target;
            p.contains(F) ? (g.current = F) : s1(g.current, { select: !0 });
          },
          _ = function (V) {
            if (R.paused || !p) return;
            const F = V.relatedTarget;
            F !== null && (p.contains(F) || s1(g.current, { select: !0 }));
          },
          M = function (V) {
            if (document.activeElement === document.body)
              for (const ee of V) ee.removedNodes.length > 0 && s1(p);
          };
        document.addEventListener("focusin", S),
          document.addEventListener("focusout", _);
        const H = new MutationObserver(M);
        return (
          p && H.observe(p, { childList: !0, subtree: !0 }),
          () => {
            document.removeEventListener("focusin", S),
              document.removeEventListener("focusout", _),
              H.disconnect();
          }
        );
      }
    }, [c, p, R.paused]),
      C.useEffect(() => {
        if (p) {
          D0.add(R);
          const S = document.activeElement;
          if (!p.contains(S)) {
            const M = new CustomEvent(Ti, b0);
            p.addEventListener(Ti, w),
              p.dispatchEvent(M),
              M.defaultPrevented ||
                (M6(A6(sa(p)), { select: !0 }),
                document.activeElement === S && s1(p));
          }
          return () => {
            p.removeEventListener(Ti, w),
              setTimeout(() => {
                const M = new CustomEvent(Ii, b0);
                p.addEventListener(Ii, E),
                  p.dispatchEvent(M),
                  M.defaultPrevented || s1(S ?? document.body, { select: !0 }),
                  p.removeEventListener(Ii, E),
                  D0.remove(R);
              }, 0);
          };
        }
      }, [p, w, E, R]);
    const P = C.useCallback(
      (S) => {
        if ((!a && !c) || R.paused) return;
        const _ = S.key === "Tab" && !S.altKey && !S.ctrlKey && !S.metaKey,
          M = document.activeElement;
        if (_ && M) {
          const H = S.currentTarget,
            [V, F] = P6(H);
          V && F
            ? !S.shiftKey && M === F
              ? (S.preventDefault(), a && s1(V, { select: !0 }))
              : S.shiftKey &&
                M === V &&
                (S.preventDefault(), a && s1(F, { select: !0 }))
            : M === H && S.preventDefault();
        }
      },
      [a, c, R.paused]
    );
    return i.jsx(ct.div, { tabIndex: -1, ...h, ref: b, onKeyDown: P });
  });
ia.displayName = R6;
function M6(l, { select: s = !1 } = {}) {
  const a = document.activeElement;
  for (const c of l)
    if ((s1(c, { select: s }), document.activeElement !== a)) return;
}
function P6(l) {
  const s = sa(l),
    a = k0(s, l),
    c = k0(s.reverse(), l);
  return [a, c];
}
function sa(l) {
  const s = [],
    a = document.createTreeWalker(l, NodeFilter.SHOW_ELEMENT, {
      acceptNode: (c) => {
        const d = c.tagName === "INPUT" && c.type === "hidden";
        return c.disabled || c.hidden || d
          ? NodeFilter.FILTER_SKIP
          : c.tabIndex >= 0
          ? NodeFilter.FILTER_ACCEPT
          : NodeFilter.FILTER_SKIP;
      },
    });
  for (; a.nextNode(); ) s.push(a.currentNode);
  return s;
}
function k0(l, s) {
  for (const a of l) if (!O6(a, { upTo: s })) return a;
}
function O6(l, { upTo: s }) {
  if (getComputedStyle(l).visibility === "hidden") return !0;
  for (; l; ) {
    if (s !== void 0 && l === s) return !1;
    if (getComputedStyle(l).display === "none") return !0;
    l = l.parentElement;
  }
  return !1;
}
function T6(l) {
  return l instanceof HTMLInputElement && "select" in l;
}
function s1(l, { select: s = !1 } = {}) {
  if (l && l.focus) {
    const a = document.activeElement;
    l.focus({ preventScroll: !0 }), l !== a && T6(l) && s && l.select();
  }
}
var D0 = I6();
function I6() {
  let l = [];
  return {
    add(s) {
      const a = l[0];
      s !== a && (a == null || a.pause()), (l = _0(l, s)), l.unshift(s);
    },
    remove(s) {
      var a;
      (l = _0(l, s)), (a = l[0]) == null || a.resume();
    },
  };
}
function _0(l, s) {
  const a = [...l],
    c = a.indexOf(s);
  return c !== -1 && a.splice(c, 1), a;
}
function A6(l) {
  return l.filter((s) => s.tagName !== "A");
}
var B6 = "Portal",
  oa = C.forwardRef((l, s) => {
    var p;
    const { container: a, ...c } = l,
      [d, m] = C.useState(!1);
    qr(() => m(!0), []);
    const h =
      a ||
      (d &&
        ((p = globalThis == null ? void 0 : globalThis.document) == null
          ? void 0
          : p.body));
    return h ? q4.createPortal(i.jsx(ct.div, { ...c, ref: s }), h) : null;
  });
oa.displayName = B6;
function z6(l, s) {
  return C.useReducer((a, c) => s[a][c] ?? a, l);
}
var kl = (l) => {
  const { present: s, children: a } = l,
    c = F6(s),
    d =
      typeof a == "function" ? a({ present: c.isPresent }) : C.Children.only(a),
    m = lt(c.ref, V6(d));
  return typeof a == "function" || c.isPresent
    ? C.cloneElement(d, { ref: m })
    : null;
};
kl.displayName = "Presence";
function F6(l) {
  const [s, a] = C.useState(),
    c = C.useRef({}),
    d = C.useRef(l),
    m = C.useRef("none"),
    h = l ? "mounted" : "unmounted",
    [p, y] = z6(h, {
      mounted: { UNMOUNT: "unmounted", ANIMATION_OUT: "unmountSuspended" },
      unmountSuspended: { MOUNT: "mounted", ANIMATION_END: "unmounted" },
      unmounted: { MOUNT: "mounted" },
    });
  return (
    C.useEffect(() => {
      const w = pl(c.current);
      m.current = p === "mounted" ? w : "none";
    }, [p]),
    qr(() => {
      const w = c.current,
        E = d.current;
      if (E !== l) {
        const b = m.current,
          R = pl(w);
        l
          ? y("MOUNT")
          : R === "none" || (w == null ? void 0 : w.display) === "none"
          ? y("UNMOUNT")
          : y(E && b !== R ? "ANIMATION_OUT" : "UNMOUNT"),
          (d.current = l);
      }
    }, [l, y]),
    qr(() => {
      if (s) {
        let w;
        const E = s.ownerDocument.defaultView ?? window,
          g = (R) => {
            const S = pl(c.current).includes(R.animationName);
            if (R.target === s && S && (y("ANIMATION_END"), !d.current)) {
              const _ = s.style.animationFillMode;
              (s.style.animationFillMode = "forwards"),
                (w = E.setTimeout(() => {
                  s.style.animationFillMode === "forwards" &&
                    (s.style.animationFillMode = _);
                }));
            }
          },
          b = (R) => {
            R.target === s && (m.current = pl(c.current));
          };
        return (
          s.addEventListener("animationstart", b),
          s.addEventListener("animationcancel", g),
          s.addEventListener("animationend", g),
          () => {
            E.clearTimeout(w),
              s.removeEventListener("animationstart", b),
              s.removeEventListener("animationcancel", g),
              s.removeEventListener("animationend", g);
          }
        );
      } else y("ANIMATION_END");
    }, [s, y]),
    {
      isPresent: ["mounted", "unmountSuspended"].includes(p),
      ref: C.useCallback((w) => {
        w && (c.current = getComputedStyle(w)), a(w);
      }, []),
    }
  );
}
function pl(l) {
  return (l == null ? void 0 : l.animationName) || "none";
}
function V6(l) {
  var c, d;
  let s =
      (c = Object.getOwnPropertyDescriptor(l.props, "ref")) == null
        ? void 0
        : c.get,
    a = s && "isReactWarning" in s && s.isReactWarning;
  return a
    ? l.ref
    : ((s =
        (d = Object.getOwnPropertyDescriptor(l, "ref")) == null
          ? void 0
          : d.get),
      (a = s && "isReactWarning" in s && s.isReactWarning),
      a ? l.props.ref : l.props.ref || l.ref);
}
var Ai = 0;
function U6() {
  C.useEffect(() => {
    const l = document.querySelectorAll("[data-radix-focus-guard]");
    return (
      document.body.insertAdjacentElement("afterbegin", l[0] ?? R0()),
      document.body.insertAdjacentElement("beforeend", l[1] ?? R0()),
      Ai++,
      () => {
        Ai === 1 &&
          document
            .querySelectorAll("[data-radix-focus-guard]")
            .forEach((s) => s.remove()),
          Ai--;
      }
    );
  }, []);
}
function R0() {
  const l = document.createElement("span");
  return (
    l.setAttribute("data-radix-focus-guard", ""),
    (l.tabIndex = 0),
    (l.style.outline = "none"),
    (l.style.opacity = "0"),
    (l.style.position = "fixed"),
    (l.style.pointerEvents = "none"),
    l
  );
}
var Rt = function () {
  return (
    (Rt =
      Object.assign ||
      function (s) {
        for (var a, c = 1, d = arguments.length; c < d; c++) {
          a = arguments[c];
          for (var m in a)
            Object.prototype.hasOwnProperty.call(a, m) && (s[m] = a[m]);
        }
        return s;
      }),
    Rt.apply(this, arguments)
  );
};
function aa(l, s) {
  var a = {};
  for (var c in l)
    Object.prototype.hasOwnProperty.call(l, c) &&
      s.indexOf(c) < 0 &&
      (a[c] = l[c]);
  if (l != null && typeof Object.getOwnPropertySymbols == "function")
    for (var d = 0, c = Object.getOwnPropertySymbols(l); d < c.length; d++)
      s.indexOf(c[d]) < 0 &&
        Object.prototype.propertyIsEnumerable.call(l, c[d]) &&
        (a[c[d]] = l[c[d]]);
  return a;
}
function H6(l, s, a) {
  if (a || arguments.length === 2)
    for (var c = 0, d = s.length, m; c < d; c++)
      (m || !(c in s)) &&
        (m || (m = Array.prototype.slice.call(s, 0, c)), (m[c] = s[c]));
  return l.concat(m || Array.prototype.slice.call(s));
}
var wl = "right-scroll-bar-position",
  yl = "width-before-scroll-bar",
  Z6 = "with-scroll-bars-hidden",
  W6 = "--removed-body-scroll-bar-size";
function Bi(l, s) {
  return typeof l == "function" ? l(s) : l && (l.current = s), l;
}
function $6(l, s) {
  var a = C.useState(function () {
    return {
      value: l,
      callback: s,
      facade: {
        get current() {
          return a.value;
        },
        set current(c) {
          var d = a.value;
          d !== c && ((a.value = c), a.callback(c, d));
        },
      },
    };
  })[0];
  return (a.callback = s), a.facade;
}
var G6 = typeof window < "u" ? C.useLayoutEffect : C.useEffect,
  M0 = new WeakMap();
function K6(l, s) {
  var a = $6(null, function (c) {
    return l.forEach(function (d) {
      return Bi(d, c);
    });
  });
  return (
    G6(
      function () {
        var c = M0.get(a);
        if (c) {
          var d = new Set(c),
            m = new Set(l),
            h = a.current;
          d.forEach(function (p) {
            m.has(p) || Bi(p, null);
          }),
            m.forEach(function (p) {
              d.has(p) || Bi(p, h);
            });
        }
        M0.set(a, l);
      },
      [l]
    ),
    a
  );
}
function Q6(l) {
  return l;
}
function Y6(l, s) {
  s === void 0 && (s = Q6);
  var a = [],
    c = !1,
    d = {
      read: function () {
        if (c)
          throw new Error(
            "Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`."
          );
        return a.length ? a[a.length - 1] : l;
      },
      useMedium: function (m) {
        var h = s(m, c);
        return (
          a.push(h),
          function () {
            a = a.filter(function (p) {
              return p !== h;
            });
          }
        );
      },
      assignSyncMedium: function (m) {
        for (c = !0; a.length; ) {
          var h = a;
          (a = []), h.forEach(m);
        }
        a = {
          push: function (p) {
            return m(p);
          },
          filter: function () {
            return a;
          },
        };
      },
      assignMedium: function (m) {
        c = !0;
        var h = [];
        if (a.length) {
          var p = a;
          (a = []), p.forEach(m), (h = a);
        }
        var y = function () {
            var E = h;
            (h = []), E.forEach(m);
          },
          w = function () {
            return Promise.resolve().then(y);
          };
        w(),
          (a = {
            push: function (E) {
              h.push(E), w();
            },
            filter: function (E) {
              return (h = h.filter(E)), a;
            },
          });
      },
    };
  return d;
}
function X6(l) {
  l === void 0 && (l = {});
  var s = Y6(null);
  return (s.options = Rt({ async: !0, ssr: !1 }, l)), s;
}
var ua = function (l) {
  var s = l.sideCar,
    a = aa(l, ["sideCar"]);
  if (!s)
    throw new Error(
      "Sidecar: please provide `sideCar` property to import the right car"
    );
  var c = s.read();
  if (!c) throw new Error("Sidecar medium not found");
  return C.createElement(c, Rt({}, a));
};
ua.isSideCarExport = !0;
function J6(l, s) {
  return l.useMedium(s), ua;
}
var ca = X6(),
  zi = function () {},
  Dl = C.forwardRef(function (l, s) {
    var a = C.useRef(null),
      c = C.useState({
        onScrollCapture: zi,
        onWheelCapture: zi,
        onTouchMoveCapture: zi,
      }),
      d = c[0],
      m = c[1],
      h = l.forwardProps,
      p = l.children,
      y = l.className,
      w = l.removeScrollBar,
      E = l.enabled,
      g = l.shards,
      b = l.sideCar,
      R = l.noIsolation,
      P = l.inert,
      S = l.allowPinchZoom,
      _ = l.as,
      M = _ === void 0 ? "div" : _,
      H = l.gapMode,
      V = aa(l, [
        "forwardProps",
        "children",
        "className",
        "removeScrollBar",
        "enabled",
        "shards",
        "sideCar",
        "noIsolation",
        "inert",
        "allowPinchZoom",
        "as",
        "gapMode",
      ]),
      F = b,
      ee = K6([a, s]),
      re = Rt(Rt({}, V), d);
    return C.createElement(
      C.Fragment,
      null,
      E &&
        C.createElement(F, {
          sideCar: ca,
          removeScrollBar: w,
          shards: g,
          noIsolation: R,
          inert: P,
          setCallbacks: m,
          allowPinchZoom: !!S,
          lockRef: a,
          gapMode: H,
        }),
      h
        ? C.cloneElement(C.Children.only(p), Rt(Rt({}, re), { ref: ee }))
        : C.createElement(M, Rt({}, re, { className: y, ref: ee }), p)
    );
  });
Dl.defaultProps = { enabled: !0, removeScrollBar: !0, inert: !1 };
Dl.classNames = { fullWidth: yl, zeroRight: wl };
var q6 = function () {
  if (typeof __webpack_nonce__ < "u") return __webpack_nonce__;
};
function e8() {
  if (!document) return null;
  var l = document.createElement("style");
  l.type = "text/css";
  var s = q6();
  return s && l.setAttribute("nonce", s), l;
}
function t8(l, s) {
  l.styleSheet
    ? (l.styleSheet.cssText = s)
    : l.appendChild(document.createTextNode(s));
}
function r8(l) {
  var s = document.head || document.getElementsByTagName("head")[0];
  s.appendChild(l);
}
var n8 = function () {
    var l = 0,
      s = null;
    return {
      add: function (a) {
        l == 0 && (s = e8()) && (t8(s, a), r8(s)), l++;
      },
      remove: function () {
        l--,
          !l && s && (s.parentNode && s.parentNode.removeChild(s), (s = null));
      },
    };
  },
  l8 = function () {
    var l = n8();
    return function (s, a) {
      C.useEffect(
        function () {
          return (
            l.add(s),
            function () {
              l.remove();
            }
          );
        },
        [s && a]
      );
    };
  },
  da = function () {
    var l = l8(),
      s = function (a) {
        var c = a.styles,
          d = a.dynamic;
        return l(c, d), null;
      };
    return s;
  },
  i8 = { left: 0, top: 0, right: 0, gap: 0 },
  Fi = function (l) {
    return parseInt(l || "", 10) || 0;
  },
  s8 = function (l) {
    var s = window.getComputedStyle(document.body),
      a = s[l === "padding" ? "paddingLeft" : "marginLeft"],
      c = s[l === "padding" ? "paddingTop" : "marginTop"],
      d = s[l === "padding" ? "paddingRight" : "marginRight"];
    return [Fi(a), Fi(c), Fi(d)];
  },
  o8 = function (l) {
    if ((l === void 0 && (l = "margin"), typeof window > "u")) return i8;
    var s = s8(l),
      a = document.documentElement.clientWidth,
      c = window.innerWidth;
    return {
      left: s[0],
      top: s[1],
      right: s[2],
      gap: Math.max(0, c - a + s[2] - s[0]),
    };
  },
  a8 = da(),
  or = "data-scroll-locked",
  u8 = function (l, s, a, c) {
    var d = l.left,
      m = l.top,
      h = l.right,
      p = l.gap;
    return (
      a === void 0 && (a = "margin"),
      `
  .`
        .concat(
          Z6,
          ` {
   overflow: hidden `
        )
        .concat(
          c,
          `;
   padding-right: `
        )
        .concat(p, "px ")
        .concat(
          c,
          `;
  }
  body[`
        )
        .concat(
          or,
          `] {
    overflow: hidden `
        )
        .concat(
          c,
          `;
    overscroll-behavior: contain;
    `
        )
        .concat(
          [
            s && "position: relative ".concat(c, ";"),
            a === "margin" &&
              `
    padding-left: `
                .concat(
                  d,
                  `px;
    padding-top: `
                )
                .concat(
                  m,
                  `px;
    padding-right: `
                )
                .concat(
                  h,
                  `px;
    margin-left:0;
    margin-top:0;
    margin-right: `
                )
                .concat(p, "px ")
                .concat(
                  c,
                  `;
    `
                ),
            a === "padding" &&
              "padding-right: ".concat(p, "px ").concat(c, ";"),
          ]
            .filter(Boolean)
            .join(""),
          `
  }
  
  .`
        )
        .concat(
          wl,
          ` {
    right: `
        )
        .concat(p, "px ")
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(
          yl,
          ` {
    margin-right: `
        )
        .concat(p, "px ")
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(wl, " .")
        .concat(
          wl,
          ` {
    right: 0 `
        )
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(yl, " .")
        .concat(
          yl,
          ` {
    margin-right: 0 `
        )
        .concat(
          c,
          `;
  }
  
  body[`
        )
        .concat(
          or,
          `] {
    `
        )
        .concat(W6, ": ")
        .concat(
          p,
          `px;
  }
`
        )
    );
  },
  P0 = function () {
    var l = parseInt(document.body.getAttribute(or) || "0", 10);
    return isFinite(l) ? l : 0;
  },
  c8 = function () {
    C.useEffect(function () {
      return (
        document.body.setAttribute(or, (P0() + 1).toString()),
        function () {
          var l = P0() - 1;
          l <= 0
            ? document.body.removeAttribute(or)
            : document.body.setAttribute(or, l.toString());
        }
      );
    }, []);
  },
  d8 = function (l) {
    var s = l.noRelative,
      a = l.noImportant,
      c = l.gapMode,
      d = c === void 0 ? "margin" : c;
    c8();
    var m = C.useMemo(
      function () {
        return o8(d);
      },
      [d]
    );
    return C.createElement(a8, { styles: u8(m, !s, d, a ? "" : "!important") });
  },
  $i = !1;
if (typeof window < "u")
  try {
    var hl = Object.defineProperty({}, "passive", {
      get: function () {
        return ($i = !0), !0;
      },
    });
    window.addEventListener("test", hl, hl),
      window.removeEventListener("test", hl, hl);
  } catch {
    $i = !1;
  }
var lr = $i ? { passive: !1 } : !1,
  f8 = function (l) {
    return l.tagName === "TEXTAREA";
  },
  fa = function (l, s) {
    if (!(l instanceof Element)) return !1;
    var a = window.getComputedStyle(l);
    return (
      a[s] !== "hidden" &&
      !(a.overflowY === a.overflowX && !f8(l) && a[s] === "visible")
    );
  },
  m8 = function (l) {
    return fa(l, "overflowY");
  },
  p8 = function (l) {
    return fa(l, "overflowX");
  },
  O0 = function (l, s) {
    var a = s.ownerDocument,
      c = s;
    do {
      typeof ShadowRoot < "u" && c instanceof ShadowRoot && (c = c.host);
      var d = ma(l, c);
      if (d) {
        var m = pa(l, c),
          h = m[1],
          p = m[2];
        if (h > p) return !0;
      }
      c = c.parentNode;
    } while (c && c !== a.body);
    return !1;
  },
  h8 = function (l) {
    var s = l.scrollTop,
      a = l.scrollHeight,
      c = l.clientHeight;
    return [s, a, c];
  },
  C8 = function (l) {
    var s = l.scrollLeft,
      a = l.scrollWidth,
      c = l.clientWidth;
    return [s, a, c];
  },
  ma = function (l, s) {
    return l === "v" ? m8(s) : p8(s);
  },
  pa = function (l, s) {
    return l === "v" ? h8(s) : C8(s);
  },
  x8 = function (l, s) {
    return l === "h" && s === "rtl" ? -1 : 1;
  },
  g8 = function (l, s, a, c, d) {
    var m = x8(l, window.getComputedStyle(s).direction),
      h = m * c,
      p = a.target,
      y = s.contains(p),
      w = !1,
      E = h > 0,
      g = 0,
      b = 0;
    do {
      var R = pa(l, p),
        P = R[0],
        S = R[1],
        _ = R[2],
        M = S - _ - m * P;
      (P || M) && ma(l, p) && ((g += M), (b += P)),
        p instanceof ShadowRoot ? (p = p.host) : (p = p.parentNode);
    } while ((!y && p !== document.body) || (y && (s.contains(p) || s === p)));
    return ((E && Math.abs(g) < 1) || (!E && Math.abs(b) < 1)) && (w = !0), w;
  },
  Cl = function (l) {
    return "changedTouches" in l
      ? [l.changedTouches[0].clientX, l.changedTouches[0].clientY]
      : [0, 0];
  },
  T0 = function (l) {
    return [l.deltaX, l.deltaY];
  },
  I0 = function (l) {
    return l && "current" in l ? l.current : l;
  },
  v8 = function (l, s) {
    return l[0] === s[0] && l[1] === s[1];
  },
  w8 = function (l) {
    return `
  .block-interactivity-`
      .concat(
        l,
        ` {pointer-events: none;}
  .allow-interactivity-`
      )
      .concat(
        l,
        ` {pointer-events: all;}
`
      );
  },
  y8 = 0,
  ir = [];
function j8(l) {
  var s = C.useRef([]),
    a = C.useRef([0, 0]),
    c = C.useRef(),
    d = C.useState(y8++)[0],
    m = C.useState(da)[0],
    h = C.useRef(l);
  C.useEffect(
    function () {
      h.current = l;
    },
    [l]
  ),
    C.useEffect(
      function () {
        if (l.inert) {
          document.body.classList.add("block-interactivity-".concat(d));
          var S = H6([l.lockRef.current], (l.shards || []).map(I0), !0).filter(
            Boolean
          );
          return (
            S.forEach(function (_) {
              return _.classList.add("allow-interactivity-".concat(d));
            }),
            function () {
              document.body.classList.remove("block-interactivity-".concat(d)),
                S.forEach(function (_) {
                  return _.classList.remove("allow-interactivity-".concat(d));
                });
            }
          );
        }
      },
      [l.inert, l.lockRef.current, l.shards]
    );
  var p = C.useCallback(function (S, _) {
      if (
        ("touches" in S && S.touches.length === 2) ||
        (S.type === "wheel" && S.ctrlKey)
      )
        return !h.current.allowPinchZoom;
      var M = Cl(S),
        H = a.current,
        V = "deltaX" in S ? S.deltaX : H[0] - M[0],
        F = "deltaY" in S ? S.deltaY : H[1] - M[1],
        ee,
        re = S.target,
        Y = Math.abs(V) > Math.abs(F) ? "h" : "v";
      if ("touches" in S && Y === "h" && re.type === "range") return !1;
      var fe = O0(Y, re);
      if (!fe) return !0;
      if (
        (fe ? (ee = Y) : ((ee = Y === "v" ? "h" : "v"), (fe = O0(Y, re))), !fe)
      )
        return !1;
      if (
        (!c.current && "changedTouches" in S && (V || F) && (c.current = ee),
        !ee)
      )
        return !0;
      var Ie = c.current || ee;
      return g8(Ie, _, S, Ie === "h" ? V : F);
    }, []),
    y = C.useCallback(function (S) {
      var _ = S;
      if (!(!ir.length || ir[ir.length - 1] !== m)) {
        var M = "deltaY" in _ ? T0(_) : Cl(_),
          H = s.current.filter(function (ee) {
            return (
              ee.name === _.type &&
              (ee.target === _.target || _.target === ee.shadowParent) &&
              v8(ee.delta, M)
            );
          })[0];
        if (H && H.should) {
          _.cancelable && _.preventDefault();
          return;
        }
        if (!H) {
          var V = (h.current.shards || [])
              .map(I0)
              .filter(Boolean)
              .filter(function (ee) {
                return ee.contains(_.target);
              }),
            F = V.length > 0 ? p(_, V[0]) : !h.current.noIsolation;
          F && _.cancelable && _.preventDefault();
        }
      }
    }, []),
    w = C.useCallback(function (S, _, M, H) {
      var V = { name: S, delta: _, target: M, should: H, shadowParent: E8(M) };
      s.current.push(V),
        setTimeout(function () {
          s.current = s.current.filter(function (F) {
            return F !== V;
          });
        }, 1);
    }, []),
    E = C.useCallback(function (S) {
      (a.current = Cl(S)), (c.current = void 0);
    }, []),
    g = C.useCallback(function (S) {
      w(S.type, T0(S), S.target, p(S, l.lockRef.current));
    }, []),
    b = C.useCallback(function (S) {
      w(S.type, Cl(S), S.target, p(S, l.lockRef.current));
    }, []);
  C.useEffect(function () {
    return (
      ir.push(m),
      l.setCallbacks({
        onScrollCapture: g,
        onWheelCapture: g,
        onTouchMoveCapture: b,
      }),
      document.addEventListener("wheel", y, lr),
      document.addEventListener("touchmove", y, lr),
      document.addEventListener("touchstart", E, lr),
      function () {
        (ir = ir.filter(function (S) {
          return S !== m;
        })),
          document.removeEventListener("wheel", y, lr),
          document.removeEventListener("touchmove", y, lr),
          document.removeEventListener("touchstart", E, lr);
      }
    );
  }, []);
  var R = l.removeScrollBar,
    P = l.inert;
  return C.createElement(
    C.Fragment,
    null,
    P ? C.createElement(m, { styles: w8(d) }) : null,
    R ? C.createElement(d8, { gapMode: l.gapMode }) : null
  );
}
function E8(l) {
  for (var s = null; l !== null; )
    l instanceof ShadowRoot && ((s = l.host), (l = l.host)), (l = l.parentNode);
  return s;
}
const L8 = J6(ca, j8);
var ha = C.forwardRef(function (l, s) {
  return C.createElement(Dl, Rt({}, l, { ref: s, sideCar: L8 }));
});
ha.classNames = Dl.classNames;
var S8 = function (l) {
    if (typeof document > "u") return null;
    var s = Array.isArray(l) ? l[0] : l;
    return s.ownerDocument.body;
  },
  sr = new WeakMap(),
  xl = new WeakMap(),
  gl = {},
  Vi = 0,
  Ca = function (l) {
    return l && (l.host || Ca(l.parentNode));
  },
  N8 = function (l, s) {
    return s
      .map(function (a) {
        if (l.contains(a)) return a;
        var c = Ca(a);
        return c && l.contains(c)
          ? c
          : (console.error(
              "aria-hidden",
              a,
              "in not contained inside",
              l,
              ". Doing nothing"
            ),
            null);
      })
      .filter(function (a) {
        return !!a;
      });
  },
  b8 = function (l, s, a, c) {
    var d = N8(s, Array.isArray(l) ? l : [l]);
    gl[a] || (gl[a] = new WeakMap());
    var m = gl[a],
      h = [],
      p = new Set(),
      y = new Set(d),
      w = function (g) {
        !g || p.has(g) || (p.add(g), w(g.parentNode));
      };
    d.forEach(w);
    var E = function (g) {
      !g ||
        y.has(g) ||
        Array.prototype.forEach.call(g.children, function (b) {
          if (p.has(b)) E(b);
          else
            try {
              var R = b.getAttribute(c),
                P = R !== null && R !== "false",
                S = (sr.get(b) || 0) + 1,
                _ = (m.get(b) || 0) + 1;
              sr.set(b, S),
                m.set(b, _),
                h.push(b),
                S === 1 && P && xl.set(b, !0),
                _ === 1 && b.setAttribute(a, "true"),
                P || b.setAttribute(c, "true");
            } catch (M) {
              console.error("aria-hidden: cannot operate on ", b, M);
            }
        });
    };
    return (
      E(s),
      p.clear(),
      Vi++,
      function () {
        h.forEach(function (g) {
          var b = sr.get(g) - 1,
            R = m.get(g) - 1;
          sr.set(g, b),
            m.set(g, R),
            b || (xl.has(g) || g.removeAttribute(c), xl.delete(g)),
            R || g.removeAttribute(a);
        }),
          Vi--,
          Vi ||
            ((sr = new WeakMap()),
            (sr = new WeakMap()),
            (xl = new WeakMap()),
            (gl = {}));
      }
    );
  },
  k8 = function (l, s, a) {
    a === void 0 && (a = "data-aria-hidden");
    var c = Array.from(Array.isArray(l) ? l : [l]),
      d = S8(l);
    return d
      ? (c.push.apply(c, Array.from(d.querySelectorAll("[aria-live]"))),
        b8(c, d, a, "aria-hidden"))
      : function () {
          return null;
        };
  },
  e3 = "Dialog",
  [xa, A7] = qi(e3),
  [D8, Lt] = xa(e3),
  ga = (l) => {
    const {
        __scopeDialog: s,
        children: a,
        open: c,
        defaultOpen: d,
        onOpenChange: m,
        modal: h = !0,
      } = l,
      p = C.useRef(null),
      y = C.useRef(null),
      [w = !1, E] = ta({ prop: c, defaultProp: d, onChange: m });
    return i.jsx(D8, {
      scope: s,
      triggerRef: p,
      contentRef: y,
      contentId: Oi(),
      titleId: Oi(),
      descriptionId: Oi(),
      open: w,
      onOpenChange: E,
      onOpenToggle: C.useCallback(() => E((g) => !g), [E]),
      modal: h,
      children: a,
    });
  };
ga.displayName = e3;
var va = "DialogTrigger",
  wa = C.forwardRef((l, s) => {
    const { __scopeDialog: a, ...c } = l,
      d = Lt(va, a),
      m = lt(s, d.triggerRef);
    return i.jsx(ct.button, {
      type: "button",
      "aria-haspopup": "dialog",
      "aria-expanded": d.open,
      "aria-controls": d.contentId,
      "data-state": n3(d.open),
      ...c,
      ref: m,
      onClick: nt(l.onClick, d.onOpenToggle),
    });
  });
wa.displayName = va;
var t3 = "DialogPortal",
  [_8, ya] = xa(t3, { forceMount: void 0 }),
  ja = (l) => {
    const { __scopeDialog: s, forceMount: a, children: c, container: d } = l,
      m = Lt(t3, s);
    return i.jsx(_8, {
      scope: s,
      forceMount: a,
      children: C.Children.map(c, (h) =>
        i.jsx(kl, {
          present: a || m.open,
          children: i.jsx(oa, { asChild: !0, container: d, children: h }),
        })
      ),
    });
  };
ja.displayName = t3;
var jl = "DialogOverlay",
  Ea = C.forwardRef((l, s) => {
    const a = ya(jl, l.__scopeDialog),
      { forceMount: c = a.forceMount, ...d } = l,
      m = Lt(jl, l.__scopeDialog);
    return m.modal
      ? i.jsx(kl, {
          present: c || m.open,
          children: i.jsx(R8, { ...d, ref: s }),
        })
      : null;
  });
Ea.displayName = jl;
var R8 = C.forwardRef((l, s) => {
    const { __scopeDialog: a, ...c } = l,
      d = Lt(jl, a);
    return i.jsx(ha, {
      as: en,
      allowPinchZoom: !0,
      shards: [d.contentRef],
      children: i.jsx(ct.div, {
        "data-state": n3(d.open),
        ...c,
        ref: s,
        style: { pointerEvents: "auto", ...c.style },
      }),
    });
  }),
  M1 = "DialogContent",
  La = C.forwardRef((l, s) => {
    const a = ya(M1, l.__scopeDialog),
      { forceMount: c = a.forceMount, ...d } = l,
      m = Lt(M1, l.__scopeDialog);
    return i.jsx(kl, {
      present: c || m.open,
      children: m.modal
        ? i.jsx(M8, { ...d, ref: s })
        : i.jsx(P8, { ...d, ref: s }),
    });
  });
La.displayName = M1;
var M8 = C.forwardRef((l, s) => {
    const a = Lt(M1, l.__scopeDialog),
      c = C.useRef(null),
      d = lt(s, a.contentRef, c);
    return (
      C.useEffect(() => {
        const m = c.current;
        if (m) return k8(m);
      }, []),
      i.jsx(Sa, {
        ...l,
        ref: d,
        trapFocus: a.open,
        disableOutsidePointerEvents: !0,
        onCloseAutoFocus: nt(l.onCloseAutoFocus, (m) => {
          var h;
          m.preventDefault(), (h = a.triggerRef.current) == null || h.focus();
        }),
        onPointerDownOutside: nt(l.onPointerDownOutside, (m) => {
          const h = m.detail.originalEvent,
            p = h.button === 0 && h.ctrlKey === !0;
          (h.button === 2 || p) && m.preventDefault();
        }),
        onFocusOutside: nt(l.onFocusOutside, (m) => m.preventDefault()),
      })
    );
  }),
  P8 = C.forwardRef((l, s) => {
    const a = Lt(M1, l.__scopeDialog),
      c = C.useRef(!1),
      d = C.useRef(!1);
    return i.jsx(Sa, {
      ...l,
      ref: s,
      trapFocus: !1,
      disableOutsidePointerEvents: !1,
      onCloseAutoFocus: (m) => {
        var h, p;
        (h = l.onCloseAutoFocus) == null || h.call(l, m),
          m.defaultPrevented ||
            (c.current || (p = a.triggerRef.current) == null || p.focus(),
            m.preventDefault()),
          (c.current = !1),
          (d.current = !1);
      },
      onInteractOutside: (m) => {
        var y, w;
        (y = l.onInteractOutside) == null || y.call(l, m),
          m.defaultPrevented ||
            ((c.current = !0),
            m.detail.originalEvent.type === "pointerdown" && (d.current = !0));
        const h = m.target;
        ((w = a.triggerRef.current) == null ? void 0 : w.contains(h)) &&
          m.preventDefault(),
          m.detail.originalEvent.type === "focusin" &&
            d.current &&
            m.preventDefault();
      },
    });
  }),
  Sa = C.forwardRef((l, s) => {
    const {
        __scopeDialog: a,
        trapFocus: c,
        onOpenAutoFocus: d,
        onCloseAutoFocus: m,
        ...h
      } = l,
      p = Lt(M1, a),
      y = C.useRef(null),
      w = lt(s, y);
    return (
      U6(),
      i.jsxs(i.Fragment, {
        children: [
          i.jsx(ia, {
            asChild: !0,
            loop: !0,
            trapped: c,
            onMountAutoFocus: d,
            onUnmountAutoFocus: m,
            children: i.jsx(na, {
              role: "dialog",
              id: p.contentId,
              "aria-describedby": p.descriptionId,
              "aria-labelledby": p.titleId,
              "data-state": n3(p.open),
              ...h,
              ref: w,
              onDismiss: () => p.onOpenChange(!1),
            }),
          }),
          i.jsxs(i.Fragment, {
            children: [
              i.jsx(O8, { titleId: p.titleId }),
              i.jsx(I8, { contentRef: y, descriptionId: p.descriptionId }),
            ],
          }),
        ],
      })
    );
  }),
  r3 = "DialogTitle",
  Na = C.forwardRef((l, s) => {
    const { __scopeDialog: a, ...c } = l,
      d = Lt(r3, a);
    return i.jsx(ct.h2, { id: d.titleId, ...c, ref: s });
  });
Na.displayName = r3;
var ba = "DialogDescription",
  ka = C.forwardRef((l, s) => {
    const { __scopeDialog: a, ...c } = l,
      d = Lt(ba, a);
    return i.jsx(ct.p, { id: d.descriptionId, ...c, ref: s });
  });
ka.displayName = ba;
var Da = "DialogClose",
  _a = C.forwardRef((l, s) => {
    const { __scopeDialog: a, ...c } = l,
      d = Lt(Da, a);
    return i.jsx(ct.button, {
      type: "button",
      ...c,
      ref: s,
      onClick: nt(l.onClick, () => d.onOpenChange(!1)),
    });
  });
_a.displayName = Da;
function n3(l) {
  return l ? "open" : "closed";
}
var Ra = "DialogTitleWarning",
  [B7, Ma] = f6(Ra, { contentName: M1, titleName: r3, docsSlug: "dialog" }),
  O8 = ({ titleId: l }) => {
    const s = Ma(Ra),
      a = `\`${s.contentName}\` requires a \`${s.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${s.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${s.docsSlug}`;
    return (
      C.useEffect(() => {
        l && (document.getElementById(l) || console.error(a));
      }, [a, l]),
      null
    );
  },
  T8 = "DialogDescriptionWarning",
  I8 = ({ contentRef: l, descriptionId: s }) => {
    const c = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${
      Ma(T8).contentName
    }}.`;
    return (
      C.useEffect(() => {
        var m;
        const d =
          (m = l.current) == null ? void 0 : m.getAttribute("aria-describedby");
        s && d && (document.getElementById(s) || console.warn(c));
      }, [c, l, s]),
      null
    );
  },
  a1 = ga,
  u1 = wa,
  c1 = ja,
  d1 = Ea,
  f1 = La,
  m1 = Na,
  p1 = ka,
  Ke = _a;
function A8() {
  const l = C.useRef(null),
    s = () => {
      var c;
      const a = (c = l.current) == null ? void 0 : c.value;
      de("ContractMember", { id: Number(a) });
    };
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "h-[2.8125rem] transition-all duration-300 hover:!bg-primary hover:text-black text-white font-bold w-[13.125rem] border border-white/10 bg-white/5 rounded-md hover:bg-white/10",
          children: "CONTRATAR",
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_375_1049)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M32.9971 34.5549V33.4206C34.4661 32.5667 35.6633 30.4396 35.6633 28.3111C35.6633 24.8942 35.6633 22.1236 31.664 22.1236C27.6647 22.1236 27.6647 24.8942 27.6647 28.3111C27.6647 30.4396 28.8618 32.5667 30.3309 33.4206V34.5549C25.809 34.9358 22.3323 37.2279 22.3323 39.9986H40.9956C40.9956 37.2279 37.5189 34.9358 32.9971 34.5549Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("path", {
                    d: "M23.8148 35.0857C24.9666 34.3089 26.3997 33.719 27.9767 33.3587C27.6558 32.9657 27.3732 32.5411 27.1329 32.091C26.5061 30.936 26.1731 29.6361 26.165 28.3125C26.165 26.4645 26.165 24.7183 26.8023 23.2896C27.4208 21.9036 28.5339 21.0442 30.119 20.7225C29.7671 19.0794 28.8286 18 26.3317 18C22.3324 18 22.3324 20.7706 22.3324 24.1875C22.3324 26.316 23.5295 28.4431 24.9986 29.297V30.4314C20.4767 30.8122 17 33.1044 17 35.875H22.811C23.1131 35.5972 23.4477 35.3346 23.8148 35.0871V35.0857Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_375_1049",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "NOVO MEMBRO",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: l,
                type: "number",
                placeholder: "Passaporte do jogador",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: s,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "ADICIONAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function B8() {
  const { pathname: l } = Xi(),
    s = bl(),
    { discord: a } = Me();
  return i.jsxs("aside", {
    className:
      "w-[20.625rem] h-full flex-none p-[1.875rem] flex flex-col border-r border-white/10",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.13) 100%), #101010",
    },
    children: [
      i.jsx(d6, {}),
      i.jsxs("div", {
        className: "w-[16.875rem] flex flex-col gap-3 mt-[2.1875rem]",
        children: [
          i.jsx("span", {
            className:
              "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
            children: "GERAL",
          }),
          i.jsxs("div", {
            className: "w-full flex flex-col gap-1.5",
            children: [
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/" && "!text-[#1E1E1E]"
                    ),
                    width: "18",
                    height: "16",
                    viewBox: "0 0 18 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M14.625 5.09786V0.571429H11.8125V2.65893L9 0L0 8.57143H2.25V16H7.3125V10.2857H10.6875V16H15.75V8.57143H18L14.625 5.09786Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/" && "!text-[#1E1E1E]"
                    ),
                    children: "INÍCIO",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/ranking" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/ranking"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/ranking" && "!text-[#1E1E1E]"
                    ),
                    width: "16",
                    height: "16",
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M8.00679 0.00010192C6.39226 0.00010192 4.93117 0.0969851 3.85691 0.257019C3.31986 0.337019 2.88143 0.430607 2.55148 0.546786C2.3865 0.604875 2.24815 0.666191 2.12778 0.7538C2.01315 0.837265 1.89235 0.969851 1.88103 1.15295H1.85447C1.85447 1.49537 1.86729 1.8331 1.89214 2.16571H0.974934C0.970686 1.89558 0.97504 1.62483 0.988245 1.35467L0.0390329 1.14133C-0.263446 4.76501 1.20753 8.29194 3.91455 10.8037L4.46877 9.79835C4.32125 9.68111 4.17771 9.55932 4.03838 9.43317C4.24769 9.22332 4.47611 9.03184 4.72095 8.86101C5.19775 9.30847 5.71866 9.66152 6.27204 9.90237C7.05493 10.5051 6.55713 10.9 5.44008 11.1338C7.52398 11.4939 6.81893 13.249 4.94002 14.2697C4.86425 14.2789 4.78934 14.2875 4.71769 14.2973C4.29119 14.3556 3.94322 14.4233 3.67664 14.5096C3.54335 14.5527 3.43031 14.5979 3.32594 14.6678C3.22151 14.7376 3.09137 14.8616 3.09137 15.0552C3.09137 15.2489 3.22154 15.3718 3.32594 15.4416C3.43031 15.5114 3.54332 15.5567 3.67664 15.5998C3.94322 15.6861 4.29123 15.7538 4.71769 15.8121C5.57068 15.9289 6.72799 16 8.00679 16C9.28561 16 10.4429 15.9289 11.2959 15.8121C11.7224 15.7538 12.0704 15.6861 12.337 15.5998C12.4702 15.5567 12.5833 15.5114 12.6876 15.4417C12.792 15.3719 12.9222 15.2489 12.9222 15.0553C12.9222 14.8616 12.792 14.7376 12.6876 14.6678C12.5833 14.5979 12.4703 14.5527 12.3369 14.5096C12.0704 14.4233 11.7224 14.3556 11.2958 14.2973C11.2246 14.2875 11.15 14.2788 11.0746 14.2697C9.19554 13.249 8.49053 11.4939 10.5745 11.1338C9.45692 10.8999 8.95909 10.5046 9.74368 9.90135C10.3009 9.65846 10.8251 9.30161 11.3046 8.84929C11.54 9.01143 11.7592 9.19028 11.9585 9.3833C11.8127 9.52583 11.6625 9.66423 11.5082 9.79832L12.0813 10.8036C14.8823 8.3593 16.1949 4.70495 15.9766 1.12211L15.0087 1.39285C15.0246 1.65136 15.0313 1.90886 15.0286 2.16567H14.1225C14.1476 1.82862 14.1602 1.4908 14.1601 1.15288H14.1336C14.1221 0.969784 14.0003 0.837198 13.8857 0.753733C13.7653 0.666089 13.6269 0.604841 13.462 0.546752C13.132 0.430505 12.6936 0.336917 12.1565 0.256917C11.0823 0.0969172 9.62122 0 8.00662 0L8.00679 0.00010192ZM8.00679 0.634938C9.59361 0.634938 11.0311 0.73189 12.0549 0.884382C12.5668 0.960645 12.9775 1.05192 13.2342 1.14235C13.271 1.15533 13.2971 1.16783 13.3272 1.18057C13.2971 1.19331 13.2712 1.20577 13.2342 1.21879C12.9775 1.30921 12.5667 1.40155 12.0549 1.47781C11.0311 1.63034 9.59361 1.72729 8.00679 1.72729C6.42005 1.72729 4.98253 1.6303 3.95873 1.47777C3.44681 1.40151 3.03614 1.30918 2.7794 1.21875C2.74223 1.20564 2.71674 1.19334 2.68647 1.18054C2.71667 1.16776 2.7423 1.1554 2.7794 1.14232C3.03614 1.05189 3.44684 0.960577 3.95876 0.884348C4.98253 0.731822 6.42002 0.634938 8.00679 0.634938ZM1.02365 3.07652H1.99169C2.27693 5.04265 2.99111 6.7735 3.98089 8.04467C3.73399 8.23966 3.50625 8.45123 3.30159 8.67951C1.93335 7.10138 1.21135 5.12462 1.02365 3.07652ZM14.023 3.07652H14.9789C14.7812 5.10227 13.9962 7.02227 12.6755 8.60732C12.4808 8.39974 12.2696 8.207 12.0438 8.03085C13.0284 6.76104 13.7386 5.03552 14.023 3.07655V3.07652Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/ranking" && "!text-[#1E1E1E]"
                    ),
                    children: "RANKING",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/goals" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/goals"),
                children: [
                  i.jsxs("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/goals" && "!text-[#1E1E1E]"
                    ),
                    width: "18",
                    height: "18",
                    viewBox: "0 0 18 18",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: [
                      i.jsx("path", {
                        d: "M14.5384 6.5383L12.0767 5.92294L11.4613 3.46147L13.923 1L14.5384 3.46147L17 4.07684L14.5384 6.5383Z",
                        fill: "currentColor",
                      }),
                      i.jsx("path", {
                        d: "M16.9754 9.63483C16.8539 11.1616 16.2966 12.6213 15.3699 13.8407C14.4431 15.0601 13.1857 15.9878 11.7472 16.5137C10.3087 17.0395 8.74938 17.1414 7.25462 16.8072C5.75987 16.473 4.39247 15.7168 3.31488 14.6284C2.23729 13.54 1.4948 12.1652 1.17563 10.6672C0.856458 9.1693 0.974019 7.61123 1.51434 6.17814C2.05467 4.74504 2.99505 3.49716 4.22376 2.58275C5.45247 1.66834 6.91786 1.12584 8.44584 1.01969M12.4337 10.3413C12.2114 10.9133 11.8501 11.4209 11.3823 11.8182C10.9145 12.2155 10.3551 12.49 9.75458 12.6167C9.15408 12.7435 8.53145 12.7186 7.94299 12.5443C7.35454 12.3699 6.81882 12.0517 6.38428 11.6183C5.94975 11.1849 5.6301 10.65 5.45425 10.0621C5.27839 9.4741 5.25188 8.85158 5.37711 8.25079C5.50233 7.65 5.77535 7.0899 6.17147 6.62114C6.56758 6.15238 7.0743 5.78974 7.64581 5.56602M8.9997 8.99977L12.0767 5.92294M12.0767 5.92294L14.5384 6.5383L17 4.07684L14.5384 3.46147L13.923 1L11.4613 3.46147L12.0767 5.92294Z",
                        stroke: "currentColor",
                        strokeWidth: "1.2",
                        strokeLinecap: "round",
                        strokeLinejoin: "round",
                      }),
                    ],
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/goals" && "!text-[#1E1E1E]"
                    ),
                    children: "METAS",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/bank" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/bank"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/bank" && "!text-[#1E1E1E]"
                    ),
                    width: "18",
                    height: "12",
                    viewBox: "0 0 18 12",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      "fill-rule": "evenodd",
                      "clip-rule": "evenodd",
                      d: "M1.35 0C0.991958 0 0.64858 0.135459 0.395406 0.376577C0.142232 0.617695 0 0.944722 0 1.28571V3H18V1.28571C18 0.944722 17.8578 0.617695 17.6046 0.376577C17.3514 0.135459 17.008 0 16.65 0H1.35ZM18 5.57143H0V10.7143C0 11.0553 0.142232 11.3823 0.395406 11.6234C0.64858 11.8645 0.991958 12 1.35 12H16.65C17.008 12 17.3514 11.8645 17.6046 11.6234C17.8578 11.3823 18 11.0553 18 10.7143V5.57143Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/bank" && "!text-[#1E1E1E]"
                    ),
                    children: "BANCO",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/members" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/members"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/members" && "!text-[#1E1E1E]"
                    ),
                    width: "16",
                    height: "16",
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M8 0C5.88624 0.0256476 3.86627 0.876737 2.3715 2.3715C0.876737 3.86627 0.0256476 5.88624 0 8C0.0256476 10.1138 0.876737 12.1337 2.3715 13.6285C3.86627 15.1233 5.88624 15.9744 8 16C10.1138 15.9744 12.1337 15.1233 13.6285 13.6285C15.1233 12.1337 15.9744 10.1138 16 8C15.9744 5.88624 15.1233 3.86627 13.6285 2.3715C12.1337 0.876737 10.1138 0.0256476 8 0ZM12.5714 8.57143H8.57143V12.5714H7.42857V8.57143H3.42857V7.42857H7.42857V3.42857H8.57143V7.42857H12.5714V8.57143Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/members" && "!text-[#1E1E1E]"
                    ),
                    children: "MEMBROS",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/chest" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => {
                  s("/chest");
                  de("OpenChest"); // Chamar o evento para abrir o baú
                },
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/chest" && "!text-[#1E1E1E]"
                    ),
                    width: "16",
                    height: "16",
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M14 4H2C0.89543 4 0 4.89543 0 6V14C0 15.1046 0.89543 16 2 16H14C15.1046 16 16 15.1046 16 14V6C16 4.89543 15.1046 4 14 4ZM2 6H14V14H2V6ZM8 8C8.55228 8 9 8.44772 9 9V11C9 11.5523 8.55228 12 8 12C7.44772 12 7 11.5523 7 11V9C7 8.44772 7.44772 8 8 8Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/chest" && "!text-[#1E1E1E]"
                    ),
                    children: "BAÚ",
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
      i.jsxs("div", {
        className: "w-[16.875rem] flex flex-col gap-3 mt-[2.1875rem]",
        children: [
          i.jsx("span", {
            className:
              "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
            children: "OUTROS",
          }),
          i.jsxs("div", {
            className: "w-full flex flex-col gap-1.5",
            children: [
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/partners" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/partners"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/partners" && "!text-[#1E1E1E]"
                    ),
                    width: "17",
                    height: "14",
                    viewBox: "0 0 17 14",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M17 3.66761e-05L14.0507 2.85992L16.8719 7.73906L17 7.57547V3.66761e-05ZM0 0.0417604V8.33119C0.16 8.35255 0.35225 8.36433 0.54625 8.36642C0.970179 8.37101 1.31961 8.34257 1.51589 8.32444L3.39643 3.43521L0 0.0417604ZM13.8984 3.88973L13.6469 4.05692C13.6416 4.06048 13.4554 4.17934 13.4008 4.21435L13.022 4.44994L13.0274 4.45324C12.8519 4.56542 12.8031 4.59698 12.6039 4.72406C12.5028 4.78853 12.5003 4.79004 12.4045 4.85121C11.6798 4.45097 10.8935 4.14334 9.97596 3.90144C8.82196 4.25967 7.59946 4.77804 6.37875 5.26441C6.88554 5.89144 7.44875 6.09562 8.01607 6.10292C8.67393 6.11136 9.34643 5.81743 9.80957 5.48811L10.0739 5.30023L10.3391 5.69398L14.4624 8.75188L16.0735 7.65147L13.8984 3.88973ZM3.87418 3.99028L2.25393 8.20254L2.84857 8.67236L3.94839 7.39148L4.0365 7.28891L4.16936 7.2804C4.22293 7.27695 4.27579 7.27536 4.32793 7.27563C4.69264 7.27805 5.01871 7.37529 5.26329 7.59708C5.44443 7.76119 5.56486 7.97968 5.63471 8.23267L5.71614 8.22745C6.14454 8.19993 6.5305 8.29076 6.81007 8.54414C7.08961 8.7976 7.22543 9.17983 7.25221 9.62008L7.25471 9.65971C7.48471 9.70433 7.69061 9.79739 7.85804 9.94917C8.13761 10.2026 8.27339 10.5847 8.30018 11.025L8.30721 11.1395C8.33004 11.1469 8.35266 11.155 8.37507 11.1636L8.44768 11.0589L8.64304 10.7772L8.7435 10.6322L9.00529 10.8239L11.1277 12.3775C11.3586 12.319 11.4962 12.2279 11.5727 12.1174C11.6494 12.0069 11.6882 11.8433 11.6664 11.5998L9.1215 9.72716L8.86014 9.53487L9.0455 9.26897L9.28371 8.92531L9.5455 9.11697L12.4146 11.217C12.6455 11.1585 12.7832 11.0675 12.8597 10.957C12.9363 10.8465 12.9751 10.6833 12.9535 10.4402L9.65354 8.03476L9.39139 7.84357L9.76332 7.30487L10.0256 7.49599L13.3261 9.90198C13.5571 9.84348 13.6949 9.75244 13.7715 9.64188C13.8483 9.53124 13.887 9.36753 13.8651 9.12354L9.92082 6.19848C9.39743 6.5173 8.72789 6.7727 8.00807 6.76346C7.16568 6.75263 6.26461 6.33903 5.60175 5.29377C5.57553 5.25243 5.55866 5.20559 5.55238 5.15668C5.54609 5.10776 5.55055 5.05802 5.56543 5.01111C5.58031 4.9642 5.60522 4.92131 5.63835 4.8856C5.67148 4.84988 5.71197 4.82224 5.75686 4.80472C6.22164 4.62326 6.69125 4.43152 7.16196 4.24128L3.87425 3.9905L3.87418 3.99028ZM4.33496 7.93953L2.63625 9.91783C2.66936 10.1654 2.74482 10.3194 2.8465 10.4115C2.94818 10.5037 3.10632 10.5614 3.3495 10.5643L5.04818 8.58612C5.01507 8.33853 4.93961 8.18448 4.83793 8.0923C4.73625 8.00012 4.57814 7.94243 4.33493 7.93957L4.33496 7.93953ZM5.88168 8.88667L3.96336 11.1207C3.99643 11.3683 4.07193 11.5224 4.17357 11.6146C4.27536 11.7067 4.43339 11.7644 4.67661 11.7672L6.59493 9.53322C6.56186 9.28559 6.48636 9.13161 6.38468 9.0394C6.283 8.94718 6.12493 8.88949 5.88171 8.88659L5.88168 8.88667ZM6.92954 10.2916L5.23096 12.2699C5.26407 12.5175 5.33954 12.6715 5.44121 12.7637C5.54293 12.8559 5.70104 12.9135 5.94421 12.9164L7.64286 10.9384C7.60975 10.6907 7.53429 10.5366 7.43261 10.4444C7.33093 10.3522 7.17282 10.2946 6.92961 10.2917L6.92954 10.2916ZM7.81175 11.7278L6.42625 13.3527C6.45929 13.6008 6.53475 13.755 6.63654 13.8472C6.73814 13.9393 6.89607 13.997 7.13893 14L8.5245 12.3751C8.49143 12.1271 8.41593 11.9729 8.31414 11.8806C8.21257 11.7885 8.05464 11.7308 7.81179 11.7278L7.81175 11.7278ZM9.07397 11.9036C9.13447 12.0731 9.16943 12.261 9.18161 12.4611L9.18989 12.597L8.89429 12.9437L9.84871 13.6423C10.0796 13.5838 10.2171 13.4927 10.2937 13.3823C10.3703 13.2718 10.4092 13.1084 10.3876 12.8651L9.074 11.9037L9.07397 11.9036Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/partners" && "!text-[#1E1E1E]"
                    ),
                    children: "PARCEIROS",
                  }),
                ],
              }),
              i.jsxs("button", {
                className: ie(
                  "w-full h-10 rounded-[.5625rem] px-3 flex items-center gap-[1.125rem] bg-white/5 border-[.05rem] border-white/[0.17] shadow-transparent shadow-[0_0_14px]",
                  l === "/settings" && "!bg-primary !shadow-primary/45"
                ),
                onClick: () => s("/settings"),
                children: [
                  i.jsx("svg", {
                    className: ie(
                      "w-[1.125rem] h-4 text-[#8D8D8D]/90",
                      l === "/settings" && "!text-[#1E1E1E]"
                    ),
                    width: "16",
                    height: "16",
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M8.9325 0.727012C8.6895 -0.242988 7.3125 -0.242988 7.0685 0.727012L6.9975 1.01301C6.95596 1.17922 6.87069 1.33128 6.75056 1.45342C6.63042 1.57556 6.47979 1.66332 6.31429 1.7076C6.14879 1.75189 5.97446 1.75107 5.80938 1.70525C5.6443 1.65943 5.49449 1.57026 5.3755 1.44701L5.1705 1.23601C4.4755 0.517012 3.2825 1.20601 3.5575 2.16701L3.6375 2.45101C3.68451 2.61556 3.68668 2.78968 3.64378 2.95534C3.60089 3.12101 3.51449 3.2722 3.39354 3.39326C3.27258 3.51431 3.12147 3.60084 2.95584 3.64387C2.79021 3.6869 2.61609 3.68488 2.4515 3.63801L2.1675 3.55701C1.2075 3.28201 0.5175 4.47501 1.2365 5.17001L1.4475 5.37501C1.57075 5.49401 1.65992 5.64381 1.70574 5.80889C1.75156 5.97397 1.75237 6.1483 1.70809 6.3138C1.66381 6.4793 1.57605 6.62993 1.45391 6.75007C1.33177 6.87021 1.17971 6.95547 1.0135 6.99701L0.7275 7.06801C-0.2425 7.31101 -0.2425 8.68801 0.7275 8.93201L1.0135 9.00301C1.17971 9.04455 1.33177 9.12982 1.45391 9.24995C1.57605 9.37009 1.66381 9.52072 1.70809 9.68622C1.75237 9.85172 1.75156 10.0261 1.70574 10.1911C1.65992 10.3562 1.57075 10.506 1.4475 10.625L1.2365 10.83C0.5175 11.525 1.2065 12.718 2.1675 12.443L2.4515 12.363C2.61615 12.3159 2.7904 12.3137 2.95618 12.3566C3.12197 12.3996 3.27325 12.4861 3.39434 12.6072C3.51544 12.7283 3.60193 12.8795 3.64486 13.0453C3.68779 13.2111 3.6856 13.3854 3.6385 13.55L3.5575 13.833C3.2825 14.793 4.4755 15.483 5.1705 14.764L5.3755 14.553C5.49449 14.4298 5.6443 14.3406 5.80938 14.2948C5.97446 14.2489 6.14879 14.2481 6.31429 14.2924C6.47979 14.3367 6.63042 14.4245 6.75056 14.5466C6.87069 14.6687 6.95596 14.8208 6.9975 14.987L7.0685 15.273C7.3115 16.243 8.6885 16.243 8.9325 15.273L9.0035 14.987C9.04504 14.8208 9.13031 14.6687 9.25044 14.5466C9.37058 14.4245 9.52121 14.3367 9.68671 14.2924C9.85221 14.2481 10.0265 14.2489 10.1916 14.2948C10.3567 14.3406 10.5065 14.4298 10.6255 14.553L10.8305 14.764C11.5255 15.483 12.7185 14.794 12.4435 13.833L12.3635 13.549C12.3164 13.3844 12.3142 13.2101 12.3571 13.0443C12.4001 12.8785 12.4866 12.7273 12.6077 12.6062C12.7288 12.4851 12.88 12.3986 13.0458 12.3556C13.2116 12.3127 13.3859 12.3149 13.5505 12.362L13.8335 12.443C14.7935 12.718 15.4835 11.525 14.7645 10.83L14.5535 10.625C14.4302 10.506 14.3411 10.3562 14.2953 10.1911C14.2494 10.0261 14.2486 9.85172 14.2929 9.68622C14.3372 9.52072 14.425 9.37009 14.5471 9.24995C14.6692 9.12982 14.8213 9.04455 14.9875 9.00301L15.2735 8.93201C16.2435 8.68901 16.2435 7.31201 15.2735 7.06801L14.9875 6.99701C14.8213 6.95547 14.6692 6.87021 14.5471 6.75007C14.425 6.62993 14.3372 6.4793 14.2929 6.3138C14.2486 6.1483 14.2494 5.97397 14.2953 5.80889C14.3411 5.64381 14.4302 5.49401 14.5535 5.37501L14.7645 5.17001C15.4835 4.47501 14.7945 3.28201 13.8335 3.55701L13.5495 3.63701C13.385 3.68402 13.2108 3.68619 13.0452 3.6433C12.8795 3.6004 12.7283 3.51401 12.6073 3.39305C12.4862 3.27209 12.3997 3.12098 12.3566 2.95535C12.3136 2.78972 12.3156 2.6156 12.3625 2.45101L12.4435 2.16701C12.7185 1.20701 11.5255 0.517012 10.8305 1.23601L10.6255 1.44701C10.5065 1.57026 10.3567 1.65943 10.1916 1.70525C10.0265 1.75107 9.85221 1.75189 9.68671 1.7076C9.52121 1.66332 9.37058 1.57556 9.25044 1.45342C9.13031 1.33128 9.04504 1.17922 9.0035 1.01301L8.9325 0.727012ZM8.0005 12.997C7.33827 13.0064 6.68078 12.884 6.06625 12.6371C5.45171 12.3901 4.89238 12.0235 4.42077 11.5585C3.94915 11.0935 3.57466 10.5395 3.31905 9.92848C3.06344 9.3175 2.93181 8.66181 2.93181 7.99951C2.93181 7.33722 3.06344 6.68152 3.31905 6.07054C3.57466 5.45956 3.94915 4.90548 4.42077 4.44049C4.89238 3.9755 5.45171 3.60888 6.06625 3.36193C6.68078 3.11499 7.33827 2.99264 8.0005 3.00201C9.32605 3.00201 10.5973 3.52859 11.5346 4.46589C12.4719 5.4032 12.9985 6.67446 12.9985 8.00001C12.9985 9.32556 12.4719 10.5968 11.5346 11.5341C10.5973 12.4714 9.32605 12.998 8.0005 12.998V12.997Z",
                      fill: "currentColor",
                    }),
                  }),
                  i.jsx("span", {
                    className: ie(
                      "text-[#D9D9D9] font-bold text-[.8125rem] leading-[.5625rem]",
                      l === "/settings" && "!text-[#1E1E1E]"
                    ),
                    children: "CONFIGURAÇÕES",
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
      i.jsxs("div", {
        className: "flex flex-col gap-8 items-center mt-[2.31rem]",
        children: [
          i.jsxs("div", {
            className: "flex flex-col gap-2 items-center",
            children: [
              i.jsx("p", {
                className: "text-white text-sm font-bold",
                children: "CONVIDE PARA SUA FAC",
              }),
              i.jsx(A8, {}),
            ],
          }),
          i.jsxs("div", {
            className: "flex flex-col gap-1 items-center",
            children: [
              i.jsx("p", {
                className: "text-white text-sm font-bold",
                children: "DISCORD DO GRUPO",
              }),
              i.jsxs("svg", {
                onClick: () => window.invokeNative("openUrl", a),
                className: "cursor-pointer w-[13.125rem] h-[2.8125rem]",
                width: "210",
                height: "45",
                viewBox: "0 0 210 45",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M0 8C0 3.58172 3.58172 0 8 0H202C206.418 0 210 3.58172 210 8V37C210 41.4183 206.418 45 202 45H8C3.58172 45 0 41.4183 0 37V8Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M75.2144 28H71.1821V17.0909H75.2091C76.3206 17.0909 77.2776 17.3093 78.0802 17.7461C78.8863 18.1793 79.5077 18.8043 79.9445 19.6211C80.3813 20.4343 80.5997 21.4073 80.5997 22.5401C80.5997 23.6765 80.3813 24.6531 79.9445 25.4698C79.5113 26.2866 78.8916 26.9134 78.0855 27.3501C77.2794 27.7834 76.3224 28 75.2144 28ZM73.8188 25.7521H75.1132C75.724 25.7521 76.2407 25.6491 76.6633 25.4432C77.0894 25.2337 77.4108 24.8945 77.6274 24.4258C77.8476 23.9535 77.9577 23.3249 77.9577 22.5401C77.9577 21.7553 77.8476 21.1303 77.6274 20.6651C77.4072 20.1964 77.0823 19.859 76.6526 19.6531C76.2265 19.4435 75.7009 19.3388 75.0759 19.3388H73.8188V25.7521ZM84.7758 17.0909V28H82.1391V17.0909H84.7758ZM92.3278 20.3615C92.2923 19.9709 92.1342 19.6673 91.8537 19.4506C91.5767 19.2305 91.1808 19.1204 90.6658 19.1204C90.3249 19.1204 90.0408 19.1648 89.8136 19.2536C89.5863 19.3423 89.4158 19.4648 89.3022 19.6211C89.1886 19.7738 89.13 19.9496 89.1264 20.1484C89.1193 20.3118 89.1513 20.4556 89.2223 20.5799C89.2969 20.7042 89.4034 20.8143 89.5419 20.9102C89.6839 21.0025 89.8544 21.0842 90.0533 21.1552C90.2521 21.2262 90.4759 21.2884 90.7244 21.3416L91.6619 21.5547C92.2017 21.6719 92.6776 21.8281 93.0895 22.0234C93.505 22.2188 93.853 22.4513 94.1335 22.7212C94.4176 22.9911 94.6325 23.3018 94.7781 23.6534C94.9237 24.005 94.9982 24.3991 95.0018 24.8359C94.9982 25.5249 94.8242 26.1161 94.4798 26.6097C94.1353 27.1033 93.6399 27.4815 92.9936 27.7443C92.3509 28.0071 91.5749 28.1385 90.6658 28.1385C89.7532 28.1385 88.9577 28.0018 88.2795 27.7283C87.6012 27.4549 87.0739 27.0394 86.6974 26.4819C86.321 25.9244 86.1275 25.2195 86.1168 24.3672H88.6417C88.663 24.7188 88.7571 25.0117 88.924 25.2461C89.0909 25.4805 89.32 25.658 89.6112 25.7788C89.9059 25.8995 90.2468 25.9599 90.6339 25.9599C90.989 25.9599 91.2908 25.9119 91.5394 25.8161C91.7915 25.7202 91.9851 25.587 92.12 25.4165C92.255 25.2461 92.3242 25.0508 92.3278 24.8306C92.3242 24.6246 92.2603 24.4489 92.136 24.3033C92.0117 24.1541 91.82 24.0263 91.5607 23.9197C91.305 23.8097 90.9783 23.7085 90.5806 23.6161L89.4407 23.3498C88.4961 23.1332 87.7521 22.7834 87.2088 22.3004C86.6655 21.8139 86.3956 21.157 86.3991 20.3295C86.3956 19.6548 86.5767 19.0636 86.9425 18.5558C87.3082 18.0479 87.8143 17.652 88.4606 17.3679C89.1069 17.0838 89.8438 16.9418 90.6712 16.9418C91.5163 16.9418 92.2496 17.0856 92.8711 17.3732C93.4961 17.6573 93.9808 18.0568 94.3253 18.5717C94.6697 19.0866 94.8455 19.6832 94.8526 20.3615H92.3278ZM106.236 21.0433H103.572C103.537 20.7699 103.464 20.5231 103.354 20.3029C103.244 20.0827 103.098 19.8945 102.917 19.7383C102.736 19.582 102.521 19.4631 102.273 19.3814C102.028 19.2962 101.756 19.2536 101.458 19.2536C100.929 19.2536 100.472 19.3832 100.089 19.6424C99.7088 19.9016 99.4158 20.2763 99.2099 20.7663C99.0075 21.2564 98.9062 21.8494 98.9062 22.5455C98.9062 23.2699 99.0092 23.8771 99.2152 24.3672C99.4247 24.8537 99.7177 25.2212 100.094 25.4698C100.474 25.7148 100.923 25.8374 101.442 25.8374C101.733 25.8374 101.998 25.8001 102.235 25.7255C102.477 25.6509 102.688 25.5426 102.869 25.4006C103.054 25.255 103.205 25.0792 103.322 24.8732C103.443 24.6637 103.526 24.4276 103.572 24.1648L106.236 24.1808C106.19 24.6637 106.049 25.1396 105.815 25.6083C105.584 26.0771 105.266 26.505 104.862 26.892C104.457 27.2756 103.963 27.581 103.381 27.8082C102.802 28.0355 102.138 28.1491 101.388 28.1491C100.401 28.1491 99.517 27.9325 98.7358 27.4993C97.9581 27.0625 97.3438 26.4268 96.8928 25.5923C96.4418 24.7578 96.2163 23.7422 96.2163 22.5455C96.2163 21.3452 96.4453 20.3278 96.9034 19.4933C97.3615 18.6587 97.9812 18.0249 98.7624 17.5916C99.5437 17.1584 100.419 16.9418 101.388 16.9418C102.049 16.9418 102.66 17.0341 103.221 17.2188C103.782 17.3999 104.276 17.6662 104.702 18.0178C105.128 18.3658 105.474 18.7937 105.74 19.3015C106.007 19.8093 106.172 20.3899 106.236 21.0433ZM118.041 22.5455C118.041 23.7457 117.81 24.7631 117.349 25.5977C116.887 26.4322 116.262 27.0661 115.474 27.4993C114.689 27.9325 113.808 28.1491 112.832 28.1491C111.851 28.1491 110.969 27.9308 110.184 27.494C109.399 27.0572 108.776 26.4233 108.315 25.5923C107.856 24.7578 107.627 23.7422 107.627 22.5455C107.627 21.3452 107.856 20.3278 108.315 19.4933C108.776 18.6587 109.399 18.0249 110.184 17.5916C110.969 17.1584 111.851 16.9418 112.832 16.9418C113.808 16.9418 114.689 17.1584 115.474 17.5916C116.262 18.0249 116.887 18.6587 117.349 19.4933C117.81 20.3278 118.041 21.3452 118.041 22.5455ZM115.346 22.5455C115.346 21.8352 115.245 21.2351 115.042 20.745C114.843 20.255 114.556 19.8839 114.179 19.6317C113.806 19.3796 113.357 19.2536 112.832 19.2536C112.31 19.2536 111.86 19.3796 111.484 19.6317C111.108 19.8839 110.818 20.255 110.616 20.745C110.417 21.2351 110.317 21.8352 110.317 22.5455C110.317 23.2557 110.417 23.8558 110.616 24.3459C110.818 24.8359 111.108 25.207 111.484 25.4592C111.86 25.7113 112.31 25.8374 112.832 25.8374C113.357 25.8374 113.806 25.7113 114.179 25.4592C114.556 25.207 114.843 24.8359 115.042 24.3459C115.245 23.8558 115.346 23.2557 115.346 22.5455ZM119.581 28V17.0909H124.087C124.904 17.0909 125.609 17.2383 126.202 17.533C126.798 17.8242 127.258 18.2433 127.581 18.7901C127.904 19.3335 128.066 19.978 128.066 20.7237C128.066 21.4801 127.901 22.1229 127.571 22.652C127.24 23.1776 126.772 23.5788 126.164 23.8558C125.557 24.1293 124.838 24.266 124.007 24.266H121.157V22.1886H123.517C123.915 22.1886 124.247 22.1371 124.513 22.0341C124.783 21.9276 124.987 21.7678 125.126 21.5547C125.264 21.3381 125.333 21.0611 125.333 20.7237C125.333 20.3864 125.264 20.1076 125.126 19.8874C124.987 19.6637 124.783 19.4968 124.513 19.3867C124.243 19.2731 123.911 19.2163 123.517 19.2163H122.217V28H119.581ZM125.722 23.0142L128.439 28H125.562L122.899 23.0142H125.722ZM133.544 28H129.512V17.0909H133.539C134.651 17.0909 135.608 17.3093 136.41 17.7461C137.216 18.1793 137.838 18.8043 138.275 19.6211C138.711 20.4343 138.93 21.4073 138.93 22.5401C138.93 23.6765 138.711 24.6531 138.275 25.4698C137.841 26.2866 137.222 26.9134 136.416 27.3501C135.609 27.7834 134.652 28 133.544 28ZM132.149 25.7521H133.443C134.054 25.7521 134.571 25.6491 134.993 25.4432C135.419 25.2337 135.741 24.8945 135.957 24.4258C136.178 23.9535 136.288 23.3249 136.288 22.5401C136.288 21.7553 136.178 21.1303 135.957 20.6651C135.737 20.1964 135.412 19.859 134.983 19.6531C134.557 19.4435 134.031 19.3388 133.406 19.3388H132.149V25.7521Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("path", {
                    d: "M193.861 16.6637C192.698 16.1212 191.438 15.7275 190.125 15.5C190.102 15.5003 190.08 15.5098 190.064 15.5263C189.906 15.815 189.723 16.1912 189.6 16.48C188.208 16.2701 186.792 16.2701 185.4 16.48C185.278 16.1825 185.094 15.815 184.928 15.5263C184.919 15.5088 184.893 15.5 184.866 15.5C183.554 15.7275 182.303 16.1212 181.13 16.6637C181.121 16.6637 181.113 16.6725 181.104 16.6812C178.724 20.2425 178.068 23.7075 178.391 27.1375C178.391 27.155 178.4 27.1725 178.418 27.1813C179.993 28.3363 181.506 29.0363 183.003 29.5C183.029 29.5087 183.055 29.5 183.064 29.4825C183.414 29.0012 183.729 28.4937 184 27.96C184.018 27.925 184 27.89 183.965 27.8812C183.466 27.6887 182.994 27.4613 182.53 27.1988C182.495 27.1813 182.495 27.1287 182.521 27.1025C182.618 27.0325 182.714 26.9538 182.81 26.8837C182.828 26.8663 182.854 26.8663 182.871 26.875C185.881 28.2487 189.128 28.2487 192.103 26.875C192.12 26.8663 192.146 26.8663 192.164 26.8837C192.26 26.9625 192.356 27.0325 192.453 27.1112C192.488 27.1375 192.488 27.19 192.444 27.2075C191.989 27.4787 191.508 27.6975 191.009 27.89C190.974 27.8988 190.965 27.9425 190.974 27.9688C191.254 28.5025 191.569 29.01 191.91 29.4913C191.936 29.5 191.963 29.5087 191.989 29.5C193.494 29.0363 195.008 28.3363 196.583 27.1813C196.6 27.1725 196.609 27.155 196.609 27.1375C196.994 23.1737 195.97 19.735 193.896 16.6812C193.888 16.6725 193.879 16.6637 193.861 16.6637ZM184.455 25.0462C183.554 25.0462 182.801 24.215 182.801 23.1912C182.801 22.1675 183.536 21.3363 184.455 21.3363C185.383 21.3363 186.118 22.1762 186.109 23.1912C186.109 24.215 185.374 25.0462 184.455 25.0462ZM190.554 25.0462C189.653 25.0462 188.9 24.215 188.9 23.1912C188.9 22.1675 189.635 21.3363 190.554 21.3363C191.481 21.3363 192.216 22.1762 192.208 23.1912C192.208 24.215 191.481 25.0462 190.554 25.0462Z",
                    fill: "#1E1E1E",
                  }),
                ],
              }),
              i.jsx("p", {
                className: "text-white/50 text-xs font-bold mt-3",
                children: "CLIQUE PARA SER REDIRECIONADO",
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function z8({ children: l }) {
  const {
    update: s,
    orgName: a,
    membersOnline: c,
    orgBalance: d,
    members: m,
    maxMembers: h,
  } = Me();
  return (
    _1("UpdateWarnings", (p) => s({ warnings: p })),
    i.jsxs("div", {
      className:
        "absolute left-1/2 -translate-x-1/2 top-1/2 -translate-y-1/2 w-[100rem] h-[55.625rem] flex-none rounded-[1.0625rem] border border-white/30 flex overflow-hidden",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.13) 100%), #101010",
      },
      children: [
        i.jsx(B8, {}),
        i.jsxs("div", {
          className:
            "w-[79.375rem] h-[55.625rem] flex-shrink-0 p-[1.875rem] pb-5 flex flex-col gap-2.5",
          children: [
            i.jsxs("div", {
              className: "w-full flex items-center gap-2.5",
              children: [
                i.jsxs("div", {
                  className:
                    "flex-none w-[26.875rem] h-[6.3125rem] px-5 flex items-center justify-between rounded-xl bg-white/5 border-[0.8px] border-white/25",
                  children: [
                    i.jsxs("div", {
                      className: "flex items-center gap-3.5",
                      children: [
                        i.jsxs("svg", {
                          width: "58",
                          height: "59",
                          viewBox: "0 0 58 59",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M4.33013 35C2.36517 31.5966 2.36517 27.4034 4.33013 24L11.9019 10.8853C13.8669 7.48186 17.4983 5.38527 21.4282 5.38527L36.5718 5.38527C40.5017 5.38527 44.1331 7.48186 46.0981 10.8853L53.6699 24C55.6348 27.4034 55.6348 31.5966 53.6699 35L46.0981 48.1147C44.1331 51.5181 40.5017 53.6147 36.5718 53.6147L21.4282 53.6147C17.4983 53.6147 13.8669 51.5181 11.9019 48.1147L4.33013 35Z",
                              fill: "url(#paint0_radial_168_1508)",
                              "fill-opacity": "0.45",
                              stroke: "#FF0000",
                              "stroke-width": "2",
                            }),
                            i.jsx("path", {
                              d: "M8.88675 34.5C7.10042 31.406 7.10042 27.594 8.88675 24.5L14.6132 14.5814C16.3996 11.4874 19.7008 9.58142 23.2735 9.58142L34.7265 9.58142C38.2992 9.58142 41.6004 11.4874 43.3868 14.5814L49.1132 24.5C50.8996 27.594 50.8996 31.406 49.1132 34.5L43.3868 44.4186C41.6004 47.5126 38.2992 49.4186 34.7265 49.4186L23.2735 49.4186C19.7008 49.4186 16.3996 47.5126 14.6132 44.4186L8.88675 34.5Z",
                              fill: "#FF0000",
                            }),
                            i.jsx("path", {
                              d: "M33.3326 34.5564V33.422C34.8017 32.5682 35.9988 30.441 35.9988 28.3125C35.9988 24.8957 35.9988 22.125 31.9995 22.125C28.0003 22.125 28.0003 24.8957 28.0003 28.3125C28.0003 30.441 29.1974 32.5682 30.6664 33.422V34.5564C26.1446 34.9373 22.6679 37.2294 22.6679 40H41.3312C41.3312 37.2294 37.8545 34.9373 33.3326 34.5564Z",
                              fill: "#1E1E1E",
                            }),
                            i.jsx("path", {
                              d: "M24.1504 35.0872C25.3022 34.3103 26.7352 33.7205 28.3123 33.3602C27.9914 32.9672 27.7087 32.5426 27.4684 32.0925C26.8417 30.9375 26.5087 29.6376 26.5006 28.314C26.5006 26.466 26.5006 24.7197 27.1378 23.2911C27.7564 21.9051 28.8695 21.0457 30.4546 20.724C30.1026 19.0808 29.1641 18.0015 26.6672 18.0015C22.668 18.0015 22.668 20.7721 22.668 24.189C22.668 26.3175 23.8651 28.4446 25.3341 29.2985V30.4328C20.8123 30.8137 17.3356 33.1058 17.3356 35.8765H23.1465C23.4487 35.5987 23.7833 35.3361 24.1504 35.0886V35.0872Z",
                              fill: "#1E1E1E",
                            }),
                            i.jsx("defs", {
                              children: i.jsxs("radialGradient", {
                                id: "paint0_radial_168_1508",
                                cx: "0",
                                cy: "0",
                                r: "1",
                                gradientUnits: "userSpaceOnUse",
                                gradientTransform:
                                  "translate(29 0.417151) rotate(90) scale(64.4007 657.175)",
                                children: [
                                  i.jsx("stop", {}),
                                  i.jsx("stop", {
                                    offset: "1",
                                    "stop-opacity": "0",
                                  }),
                                ],
                              }),
                            }),
                          ],
                        }),
                        i.jsxs("div", {
                          className: "flex flex-col gap-2",
                          children: [
                            i.jsx("p", {
                              className:
                                "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                              children: "Organizações",
                            }),
                            i.jsx("span", {
                              className:
                                "text-white text-[1.6875rem] font-bold leading-[1.25rem]",
                              children: a,
                            }),
                          ],
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className:
                        "rounded-lg bg-white/[0.13] border-[0.8px] border-white/[0.17] px-2.5 h-8 flex items-center justify-center gap-[.3125rem]",
                      children: [
                        i.jsxs("svg", {
                          width: "18",
                          height: "17",
                          viewBox: "0 0 18 17",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M11.9994 12.7935V11.917C13.1013 11.2572 13.9991 9.61348 13.9991 7.96873C13.9991 5.32842 13.9991 3.18748 10.9996 3.18748C8.00016 3.18748 8.00016 5.32842 8.00016 7.96873C8.00016 9.61348 8.898 11.2572 9.9998 11.917V12.7935C6.6084 13.0879 4.00087 14.859 4.00087 17H17.9984C17.9984 14.859 15.3908 13.0879 11.9994 12.7935Z",
                              fill: "#D9D9D9",
                              "fill-opacity": "0.7",
                            }),
                            i.jsx("path", {
                              d: "M5.11292 13.2038C5.97677 12.6035 7.05158 12.1477 8.23437 11.8693C7.9937 11.5656 7.78171 11.2375 7.60148 10.8897C7.1314 9.99722 6.88168 8.99274 6.87561 7.96997C6.87561 6.54197 6.87561 5.1926 7.35352 4.08866C7.81744 3.01766 8.65229 2.3536 9.84108 2.10497C9.57713 0.835283 8.87325 0.0012207 7.00059 0.0012207C4.00112 0.0012207 4.00112 2.14216 4.00112 4.78247C4.00112 6.42722 4.89896 8.07091 6.00076 8.73072V9.60728C2.60937 9.9016 0.00183105 11.6728 0.00183105 13.8137H4.36006C4.58668 13.5991 4.83764 13.3962 5.11292 13.2049V13.2038Z",
                              fill: "#D9D9D9",
                              "fill-opacity": "0.7",
                            }),
                          ],
                        }),
                        i.jsxs("span", {
                          className: "text-[#D9D9D9] text-[.6875rem] font-bold",
                          children: [m, "/", h],
                        }),
                      ],
                    }),
                  ],
                }),
                i.jsx("div", {
                  className:
                    "flex-1 h-[6.3125rem] px-5 flex items-center justify-between rounded-xl bg-white/5 border-[0.8px] border-white/25",
                  children: i.jsxs("div", {
                    className: "flex items-center gap-3.5",
                    children: [
                      i.jsxs("svg", {
                        width: "58",
                        height: "59",
                        viewBox: "0 0 58 59",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg",
                        children: [
                          i.jsx("path", {
                            d: "M4.33013 35C2.36517 31.5966 2.36517 27.4034 4.33013 24L11.9019 10.8853C13.8669 7.48186 17.4983 5.38527 21.4282 5.38527L36.5718 5.38527C40.5017 5.38527 44.1331 7.48186 46.0981 10.8853L53.6699 24C55.6348 27.4034 55.6348 31.5966 53.6699 35L46.0981 48.1147C44.1331 51.5181 40.5017 53.6147 36.5718 53.6147L21.4282 53.6147C17.4983 53.6147 13.8669 51.5181 11.9019 48.1147L4.33013 35Z",
                            fill: "url(#paint0_radial_168_609)",
                            "fill-opacity": "0.45",
                            stroke: "#FF0000",
                            "stroke-width": "2",
                          }),
                          i.jsx("path", {
                            d: "M8.88675 34.5C7.10042 31.406 7.10042 27.594 8.88675 24.5L14.6132 14.5814C16.3996 11.4874 19.7008 9.58142 23.2735 9.58142L34.7265 9.58142C38.2992 9.58142 41.6004 11.4874 43.3868 14.5814L49.1132 24.5C50.8996 27.594 50.8996 31.406 49.1132 34.5L43.3868 44.4186C41.6004 47.5126 38.2992 49.4186 34.7265 49.4186L23.2735 49.4186C19.7008 49.4186 16.3996 47.5126 14.6132 44.4186L8.88675 34.5Z",
                            fill: "#FF0000",
                          }),
                          i.jsx("path", {
                            d: "M29.5 33.6667C28.9271 33.6667 28.4368 33.4628 28.0292 33.0552C27.6215 32.6476 27.4174 32.1569 27.4167 31.5833C27.416 31.0097 27.6201 30.5194 28.0292 30.1125C28.4382 29.7056 28.9285 29.5014 29.5 29.5C30.0715 29.4986 30.5622 29.7028 30.9719 30.1125C31.3816 30.5222 31.5854 31.0125 31.5833 31.5833C31.5812 32.1542 31.3774 32.6448 30.9719 33.0552C30.5663 33.4656 30.0757 33.6694 29.5 33.6667ZM24.6823 24.2917H34.3177L35.6458 21.6354C35.8194 21.2882 35.8062 20.9497 35.6062 20.6198C35.4062 20.2899 35.1069 20.125 34.7083 20.125H24.2917C23.8924 20.125 23.5931 20.2899 23.3937 20.6198C23.1944 20.9497 23.1812 21.2882 23.3542 21.6354L24.6823 24.2917ZM25.75 38.875H33.25C34.8125 38.875 36.1406 38.3326 37.2344 37.2479C38.3281 36.1632 38.875 34.8306 38.875 33.25C38.875 32.5903 38.7622 31.9479 38.5365 31.3229C38.3108 30.6979 37.9896 30.1337 37.5729 29.6302L34.8646 26.375H24.1354L21.4271 29.6302C21.0104 30.1337 20.6892 30.6979 20.4635 31.3229C20.2378 31.9479 20.125 32.5903 20.125 33.25C20.125 34.8299 20.6677 36.1625 21.7531 37.2479C22.8385 38.3333 24.1708 38.8757 25.75 38.875Z",
                            fill: "#1E1E1E",
                          }),
                          i.jsx("defs", {
                            children: i.jsxs("radialGradient", {
                              id: "paint0_radial_168_609",
                              cx: "0",
                              cy: "0",
                              r: "1",
                              gradientUnits: "userSpaceOnUse",
                              gradientTransform:
                                "translate(29 0.417151) rotate(90) scale(64.4007 657.175)",
                              children: [
                                i.jsx("stop", {}),
                                i.jsx("stop", {
                                  offset: "1",
                                  "stop-opacity": "0",
                                }),
                              ],
                            }),
                          }),
                        ],
                      }),
                      i.jsxs("div", {
                        className: "flex flex-col gap-2",
                        children: [
                          i.jsx("p", {
                            className:
                              "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                            children: "SALDO DA FACÇÃO",
                          }),
                          i.jsx("span", {
                            className:
                              "text-white text-[1.6875rem] font-bold leading-[1.25rem]",
                            children: d.toLocaleString("pt-br", {
                              style: "currency",
                              currency: "BRL",
                            }),
                          }),
                        ],
                      }),
                    ],
                  }),
                }),
                i.jsx("div", {
                  className:
                    "flex-1 h-[6.3125rem] px-5 flex items-center justify-between rounded-xl bg-white/5 border-[0.8px] border-white/25",
                  children: i.jsxs("div", {
                    className: "flex items-center gap-3.5",
                    children: [
                      i.jsxs("svg", {
                        width: "58",
                        height: "59",
                        viewBox: "0 0 58 59",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg",
                        children: [
                          i.jsx("path", {
                            d: "M4.33013 35C2.36517 31.5966 2.36517 27.4034 4.33013 24L11.9019 10.8853C13.8669 7.48186 17.4983 5.38527 21.4282 5.38527L36.5718 5.38527C40.5017 5.38527 44.1331 7.48186 46.0981 10.8853L53.6699 24C55.6348 27.4034 55.6348 31.5966 53.6699 35L46.0981 48.1147C44.1331 51.5181 40.5017 53.6147 36.5718 53.6147L21.4282 53.6147C17.4983 53.6147 13.8669 51.5181 11.9019 48.1147L4.33013 35Z",
                            fill: "url(#paint0_radial_168_1508)",
                            "fill-opacity": "0.45",
                            stroke: "#FF0000",
                            "stroke-width": "2",
                          }),
                          i.jsx("path", {
                            d: "M8.88675 34.5C7.10042 31.406 7.10042 27.594 8.88675 24.5L14.6132 14.5814C16.3996 11.4874 19.7008 9.58142 23.2735 9.58142L34.7265 9.58142C38.2992 9.58142 41.6004 11.4874 43.3868 14.5814L49.1132 24.5C50.8996 27.594 50.8996 31.406 49.1132 34.5L43.3868 44.4186C41.6004 47.5126 38.2992 49.4186 34.7265 49.4186L23.2735 49.4186C19.7008 49.4186 16.3996 47.5126 14.6132 44.4186L8.88675 34.5Z",
                            fill: "#FF0000",
                          }),
                          i.jsx("path", {
                            d: "M33.3326 34.5564V33.422C34.8017 32.5682 35.9988 30.441 35.9988 28.3125C35.9988 24.8957 35.9988 22.125 31.9995 22.125C28.0003 22.125 28.0003 24.8957 28.0003 28.3125C28.0003 30.441 29.1974 32.5682 30.6664 33.422V34.5564C26.1446 34.9373 22.6679 37.2294 22.6679 40H41.3312C41.3312 37.2294 37.8545 34.9373 33.3326 34.5564Z",
                            fill: "#1E1E1E",
                          }),
                          i.jsx("path", {
                            d: "M24.1504 35.0872C25.3022 34.3103 26.7352 33.7205 28.3123 33.3602C27.9914 32.9672 27.7087 32.5426 27.4684 32.0925C26.8417 30.9375 26.5087 29.6376 26.5006 28.314C26.5006 26.466 26.5006 24.7197 27.1378 23.2911C27.7564 21.9051 28.8695 21.0457 30.4546 20.724C30.1026 19.0808 29.1641 18.0015 26.6672 18.0015C22.668 18.0015 22.668 20.7721 22.668 24.189C22.668 26.3175 23.8651 28.4446 25.3341 29.2985V30.4328C20.8123 30.8137 17.3356 33.1058 17.3356 35.8765H23.1465C23.4487 35.5987 23.7833 35.3361 24.1504 35.0886V35.0872Z",
                            fill: "#1E1E1E",
                          }),
                          i.jsx("defs", {
                            children: i.jsxs("radialGradient", {
                              id: "paint0_radial_168_1508",
                              cx: "0",
                              cy: "0",
                              r: "1",
                              gradientUnits: "userSpaceOnUse",
                              gradientTransform:
                                "translate(29 0.417151) rotate(90) scale(64.4007 657.175)",
                              children: [
                                i.jsx("stop", {}),
                                i.jsx("stop", {
                                  offset: "1",
                                  "stop-opacity": "0",
                                }),
                              ],
                            }),
                          }),
                        ],
                      }),
                      i.jsxs("div", {
                        className: "flex flex-col gap-2",
                        children: [
                          i.jsx("p", {
                            className:
                              "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                            children: "Membros online",
                          }),
                          i.jsx("span", {
                            className:
                              "text-white text-[1.6875rem] font-bold leading-[1.25rem]",
                            children: c,
                          }),
                        ],
                      }),
                    ],
                  }),
                }),
              ],
            }),
            i.jsx("div", {
              className: "w-full h-full overflow-hidden",
              children: l,
            }),
          ],
        }),
      ],
    })
  );
}
function Pa(l, [s, a]) {
  return Math.min(a, Math.max(s, l));
}
var F8 = C.createContext(void 0);
function V8(l) {
  const s = C.useContext(F8);
  return l || s || "ltr";
}
function U8(l) {
  const s = C.useRef({ value: l, previous: l });
  return C.useMemo(
    () => (
      s.current.value !== l &&
        ((s.current.previous = s.current.value), (s.current.value = l)),
      s.current.previous
    ),
    [l]
  );
}
function H8(l) {
  const [s, a] = C.useState(void 0);
  return (
    qr(() => {
      if (l) {
        a({ width: l.offsetWidth, height: l.offsetHeight });
        const c = new ResizeObserver((d) => {
          if (!Array.isArray(d) || !d.length) return;
          const m = d[0];
          let h, p;
          if ("borderBoxSize" in m) {
            const y = m.borderBoxSize,
              w = Array.isArray(y) ? y[0] : y;
            (h = w.inlineSize), (p = w.blockSize);
          } else (h = l.offsetWidth), (p = l.offsetHeight);
          a({ width: h, height: p });
        });
        return c.observe(l, { box: "border-box" }), () => c.unobserve(l);
      } else a(void 0);
    }, [l]),
    s
  );
}
function Z8(l) {
  const s = l + "CollectionProvider",
    [a, c] = qi(s),
    [d, m] = a(s, { collectionRef: { current: null }, itemMap: new Map() }),
    h = (R) => {
      const { scope: P, children: S } = R,
        _ = _t.useRef(null),
        M = _t.useRef(new Map()).current;
      return i.jsx(d, { scope: P, itemMap: M, collectionRef: _, children: S });
    };
  h.displayName = s;
  const p = l + "CollectionSlot",
    y = _t.forwardRef((R, P) => {
      const { scope: S, children: _ } = R,
        M = m(p, S),
        H = lt(P, M.collectionRef);
      return i.jsx(en, { ref: H, children: _ });
    });
  y.displayName = p;
  const w = l + "CollectionItemSlot",
    E = "data-radix-collection-item",
    g = _t.forwardRef((R, P) => {
      const { scope: S, children: _, ...M } = R,
        H = _t.useRef(null),
        V = lt(P, H),
        F = m(w, S);
      return (
        _t.useEffect(
          () => (
            F.itemMap.set(H, { ref: H, ...M }), () => void F.itemMap.delete(H)
          )
        ),
        i.jsx(en, { [E]: "", ref: V, children: _ })
      );
    });
  g.displayName = w;
  function b(R) {
    const P = m(l + "CollectionConsumer", R);
    return _t.useCallback(() => {
      const _ = P.collectionRef.current;
      if (!_) return [];
      const M = Array.from(_.querySelectorAll(`[${E}]`));
      return Array.from(P.itemMap.values()).sort(
        (F, ee) => M.indexOf(F.ref.current) - M.indexOf(ee.ref.current)
      );
    }, [P.collectionRef, P.itemMap]);
  }
  return [{ Provider: h, Slot: y, ItemSlot: g }, b, c];
}
var Oa = ["PageUp", "PageDown"],
  Ta = ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"],
  Ia = {
    "from-left": ["Home", "PageDown", "ArrowDown", "ArrowLeft"],
    "from-right": ["Home", "PageDown", "ArrowDown", "ArrowRight"],
    "from-bottom": ["Home", "PageDown", "ArrowDown", "ArrowLeft"],
    "from-top": ["Home", "PageDown", "ArrowUp", "ArrowLeft"],
  },
  cr = "Slider",
  [Gi, W8, $8] = Z8(cr),
  [Aa, z7] = qi(cr, [$8]),
  [G8, _l] = Aa(cr),
  Ba = C.forwardRef((l, s) => {
    const {
        name: a,
        min: c = 0,
        max: d = 100,
        step: m = 1,
        orientation: h = "horizontal",
        disabled: p = !1,
        minStepsBetweenThumbs: y = 0,
        defaultValue: w = [c],
        value: E,
        onValueChange: g = () => {},
        onValueCommit: b = () => {},
        inverted: R = !1,
        form: P,
        ...S
      } = l,
      _ = C.useRef(new Set()),
      M = C.useRef(0),
      V = h === "horizontal" ? K8 : Q8,
      [F = [], ee] = ta({
        prop: E,
        defaultProp: w,
        onChange: (xe) => {
          var Se;
          (Se = [..._.current][M.current]) == null || Se.focus(), g(xe);
        },
      }),
      re = C.useRef(F);
    function Y(xe) {
      const _e = e7(F, xe);
      be(xe, _e);
    }
    function fe(xe) {
      be(xe, M.current);
    }
    function Ie() {
      const xe = re.current[M.current];
      F[M.current] !== xe && b(F);
    }
    function be(xe, _e, { commit: Se } = { commit: !1 }) {
      const Ue = l7(m),
        He = i7(Math.round((xe - c) / m) * m + c, Ue),
        je = Pa(He, [c, d]);
      ee((Q = []) => {
        const z = J8(Q, je, _e);
        if (n7(z, y * m)) {
          M.current = z.indexOf(je);
          const X = String(z) !== String(Q);
          return X && Se && b(z), X ? z : Q;
        } else return Q;
      });
    }
    return i.jsx(G8, {
      scope: l.__scopeSlider,
      name: a,
      disabled: p,
      min: c,
      max: d,
      valueIndexToChangeRef: M,
      thumbs: _.current,
      values: F,
      orientation: h,
      form: P,
      children: i.jsx(Gi.Provider, {
        scope: l.__scopeSlider,
        children: i.jsx(Gi.Slot, {
          scope: l.__scopeSlider,
          children: i.jsx(V, {
            "aria-disabled": p,
            "data-disabled": p ? "" : void 0,
            ...S,
            ref: s,
            onPointerDown: nt(S.onPointerDown, () => {
              p || (re.current = F);
            }),
            min: c,
            max: d,
            inverted: R,
            onSlideStart: p ? void 0 : Y,
            onSlideMove: p ? void 0 : fe,
            onSlideEnd: p ? void 0 : Ie,
            onHomeKeyDown: () => !p && be(c, 0, { commit: !0 }),
            onEndKeyDown: () => !p && be(d, F.length - 1, { commit: !0 }),
            onStepKeyDown: ({ event: xe, direction: _e }) => {
              if (!p) {
                const He =
                    Oa.includes(xe.key) || (xe.shiftKey && Ta.includes(xe.key))
                      ? 10
                      : 1,
                  je = M.current,
                  Q = F[je],
                  z = m * He * _e;
                be(Q + z, je, { commit: !0 });
              }
            },
          }),
        }),
      }),
    });
  });
Ba.displayName = cr;
var [za, Fa] = Aa(cr, {
    startEdge: "left",
    endEdge: "right",
    size: "width",
    direction: 1,
  }),
  K8 = C.forwardRef((l, s) => {
    const {
        min: a,
        max: c,
        dir: d,
        inverted: m,
        onSlideStart: h,
        onSlideMove: p,
        onSlideEnd: y,
        onStepKeyDown: w,
        ...E
      } = l,
      [g, b] = C.useState(null),
      R = lt(s, (V) => b(V)),
      P = C.useRef(void 0),
      S = V8(d),
      _ = S === "ltr",
      M = (_ && !m) || (!_ && m);
    function H(V) {
      const F = P.current || g.getBoundingClientRect(),
        ee = [0, F.width],
        Y = l3(ee, M ? [a, c] : [c, a]);
      return (P.current = F), Y(V - F.left);
    }
    return i.jsx(za, {
      scope: l.__scopeSlider,
      startEdge: M ? "left" : "right",
      endEdge: M ? "right" : "left",
      direction: M ? 1 : -1,
      size: "width",
      children: i.jsx(Va, {
        dir: S,
        "data-orientation": "horizontal",
        ...E,
        ref: R,
        style: {
          ...E.style,
          "--radix-slider-thumb-transform": "translateX(-50%)",
        },
        onSlideStart: (V) => {
          const F = H(V.clientX);
          h == null || h(F);
        },
        onSlideMove: (V) => {
          const F = H(V.clientX);
          p == null || p(F);
        },
        onSlideEnd: () => {
          (P.current = void 0), y == null || y();
        },
        onStepKeyDown: (V) => {
          const ee = Ia[M ? "from-left" : "from-right"].includes(V.key);
          w == null || w({ event: V, direction: ee ? -1 : 1 });
        },
      }),
    });
  }),
  Q8 = C.forwardRef((l, s) => {
    const {
        min: a,
        max: c,
        inverted: d,
        onSlideStart: m,
        onSlideMove: h,
        onSlideEnd: p,
        onStepKeyDown: y,
        ...w
      } = l,
      E = C.useRef(null),
      g = lt(s, E),
      b = C.useRef(void 0),
      R = !d;
    function P(S) {
      const _ = b.current || E.current.getBoundingClientRect(),
        M = [0, _.height],
        V = l3(M, R ? [c, a] : [a, c]);
      return (b.current = _), V(S - _.top);
    }
    return i.jsx(za, {
      scope: l.__scopeSlider,
      startEdge: R ? "bottom" : "top",
      endEdge: R ? "top" : "bottom",
      size: "height",
      direction: R ? 1 : -1,
      children: i.jsx(Va, {
        "data-orientation": "vertical",
        ...w,
        ref: g,
        style: {
          ...w.style,
          "--radix-slider-thumb-transform": "translateY(50%)",
        },
        onSlideStart: (S) => {
          const _ = P(S.clientY);
          m == null || m(_);
        },
        onSlideMove: (S) => {
          const _ = P(S.clientY);
          h == null || h(_);
        },
        onSlideEnd: () => {
          (b.current = void 0), p == null || p();
        },
        onStepKeyDown: (S) => {
          const M = Ia[R ? "from-bottom" : "from-top"].includes(S.key);
          y == null || y({ event: S, direction: M ? -1 : 1 });
        },
      }),
    });
  }),
  Va = C.forwardRef((l, s) => {
    const {
        __scopeSlider: a,
        onSlideStart: c,
        onSlideMove: d,
        onSlideEnd: m,
        onHomeKeyDown: h,
        onEndKeyDown: p,
        onStepKeyDown: y,
        ...w
      } = l,
      E = _l(cr, a);
    return i.jsx(ct.span, {
      ...w,
      ref: s,
      onKeyDown: nt(l.onKeyDown, (g) => {
        g.key === "Home"
          ? (h(g), g.preventDefault())
          : g.key === "End"
          ? (p(g), g.preventDefault())
          : Oa.concat(Ta).includes(g.key) && (y(g), g.preventDefault());
      }),
      onPointerDown: nt(l.onPointerDown, (g) => {
        const b = g.target;
        b.setPointerCapture(g.pointerId),
          g.preventDefault(),
          E.thumbs.has(b) ? b.focus() : c(g);
      }),
      onPointerMove: nt(l.onPointerMove, (g) => {
        g.target.hasPointerCapture(g.pointerId) && d(g);
      }),
      onPointerUp: nt(l.onPointerUp, (g) => {
        const b = g.target;
        b.hasPointerCapture(g.pointerId) &&
          (b.releasePointerCapture(g.pointerId), m(g));
      }),
    });
  }),
  Ua = "SliderTrack",
  Ha = C.forwardRef((l, s) => {
    const { __scopeSlider: a, ...c } = l,
      d = _l(Ua, a);
    return i.jsx(ct.span, {
      "data-disabled": d.disabled ? "" : void 0,
      "data-orientation": d.orientation,
      ...c,
      ref: s,
    });
  });
Ha.displayName = Ua;
var Ki = "SliderRange",
  Za = C.forwardRef((l, s) => {
    const { __scopeSlider: a, ...c } = l,
      d = _l(Ki, a),
      m = Fa(Ki, a),
      h = C.useRef(null),
      p = lt(s, h),
      y = d.values.length,
      w = d.values.map((b) => $a(b, d.min, d.max)),
      E = y > 1 ? Math.min(...w) : 0,
      g = 100 - Math.max(...w);
    return i.jsx(ct.span, {
      "data-orientation": d.orientation,
      "data-disabled": d.disabled ? "" : void 0,
      ...c,
      ref: p,
      style: { ...l.style, [m.startEdge]: E + "%", [m.endEdge]: g + "%" },
    });
  });
Za.displayName = Ki;
var Qi = "SliderThumb",
  Wa = C.forwardRef((l, s) => {
    const a = W8(l.__scopeSlider),
      [c, d] = C.useState(null),
      m = lt(s, (p) => d(p)),
      h = C.useMemo(
        () => (c ? a().findIndex((p) => p.ref.current === c) : -1),
        [a, c]
      );
    return i.jsx(Y8, { ...l, ref: m, index: h });
  }),
  Y8 = C.forwardRef((l, s) => {
    const { __scopeSlider: a, index: c, name: d, ...m } = l,
      h = _l(Qi, a),
      p = Fa(Qi, a),
      [y, w] = C.useState(null),
      E = lt(s, (H) => w(H)),
      g = y ? h.form || !!y.closest("form") : !0,
      b = H8(y),
      R = h.values[c],
      P = R === void 0 ? 0 : $a(R, h.min, h.max),
      S = q8(c, h.values.length),
      _ = b == null ? void 0 : b[p.size],
      M = _ ? t7(_, P, p.direction) : 0;
    return (
      C.useEffect(() => {
        if (y)
          return (
            h.thumbs.add(y),
            () => {
              h.thumbs.delete(y);
            }
          );
      }, [y, h.thumbs]),
      i.jsxs("span", {
        style: {
          transform: "var(--radix-slider-thumb-transform)",
          position: "absolute",
          [p.startEdge]: `calc(${P}% + ${M}px)`,
        },
        children: [
          i.jsx(Gi.ItemSlot, {
            scope: l.__scopeSlider,
            children: i.jsx(ct.span, {
              role: "slider",
              "aria-label": l["aria-label"] || S,
              "aria-valuemin": h.min,
              "aria-valuenow": R,
              "aria-valuemax": h.max,
              "aria-orientation": h.orientation,
              "data-orientation": h.orientation,
              "data-disabled": h.disabled ? "" : void 0,
              tabIndex: h.disabled ? void 0 : 0,
              ...m,
              ref: E,
              style: R === void 0 ? { display: "none" } : l.style,
              onFocus: nt(l.onFocus, () => {
                h.valueIndexToChangeRef.current = c;
              }),
            }),
          }),
          g &&
            i.jsx(
              X8,
              {
                name:
                  d ??
                  (h.name
                    ? h.name + (h.values.length > 1 ? "[]" : "")
                    : void 0),
                form: h.form,
                value: R,
              },
              c
            ),
        ],
      })
    );
  });
Wa.displayName = Qi;
var X8 = (l) => {
  const { value: s, ...a } = l,
    c = C.useRef(null),
    d = U8(s);
  return (
    C.useEffect(() => {
      const m = c.current,
        h = window.HTMLInputElement.prototype,
        y = Object.getOwnPropertyDescriptor(h, "value").set;
      if (d !== s && y) {
        const w = new Event("input", { bubbles: !0 });
        y.call(m, s), m.dispatchEvent(w);
      }
    }, [d, s]),
    i.jsx("input", {
      style: { display: "none" },
      ...a,
      ref: c,
      defaultValue: s,
    })
  );
};
function J8(l = [], s, a) {
  const c = [...l];
  return (c[a] = s), c.sort((d, m) => d - m);
}
function $a(l, s, a) {
  const m = (100 / (a - s)) * (l - s);
  return Pa(m, [0, 100]);
}
function q8(l, s) {
  return s > 2
    ? `Value ${l + 1} of ${s}`
    : s === 2
    ? ["Minimum", "Maximum"][l]
    : void 0;
}
function e7(l, s) {
  if (l.length === 1) return 0;
  const a = l.map((d) => Math.abs(d - s)),
    c = Math.min(...a);
  return a.indexOf(c);
}
function t7(l, s, a) {
  const c = l / 2,
    m = l3([0, 50], [0, c]);
  return (c - m(s) * a) * a;
}
function r7(l) {
  return l.slice(0, -1).map((s, a) => l[a + 1] - s);
}
function n7(l, s) {
  if (s > 0) {
    const a = r7(l);
    return Math.min(...a) >= s;
  }
  return !0;
}
function l3(l, s) {
  return (a) => {
    if (l[0] === l[1] || s[0] === s[1]) return s[0];
    const c = (s[1] - s[0]) / (l[1] - l[0]);
    return s[0] + c * (a - l[0]);
  };
}
function l7(l) {
  return (String(l).split(".")[1] || "").length;
}
function i7(l, s) {
  const a = Math.pow(10, s);
  return Math.round(l * a) / a;
}
var s7 = Ba,
  o7 = Ha,
  a7 = Za,
  u7 = Wa;
function c7() {
  const [l, s] = C.useState(0),
    [a, c] = C.useState({
      reward: 0,
      goalsCurrent: 0,
      goalsMax: 0,
      rewards: [],
    });
  C.useEffect(() => {
    de("GetGoalsDetails", null, {}).then(c);
  }, []);
  function d() {
    console.log("ClaimRewards clicked, quantity:", l, "rewards:", a.rewards);
    de("ClaimRewards", {
      rewards: a.rewards.map((m) => ({ ...m, amount: Math.min(l, m.max) })),
    }).then((result) => {
      console.log("ClaimRewards result:", result);
      if (result) {
        // Atualizar dados após resgate bem-sucedido
        de("GetGoalsDetails", null, {}).then(c);
      }
    }).catch((error) => {
      console.error("ClaimRewards error:", error);
    });
  }
  return i.jsxs("div", {
    className: "flex gap-2.5",
    children: [
      i.jsxs("div", {
        className:
          "w-[20rem] h-[16.25rem] flex flex-col justify-end items-center gap-3.5 pb-6 border-[.05rem] border-white/25 rounded-xl",
        style: {
          background:
            "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
        },
        children: [
          i.jsxs("div", {
            className: "w-[14.375rem] relative",
            children: [
              i.jsx("svg", {
                width: "230",
                height: "119",
                viewBox: "0 0 230 119",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: i.jsx("path", {
                  d: "M10.6023 107.737C12.4398 81.3238 24.2213 56.5885 43.5724 38.5166C62.9235 20.4446 88.4055 10.3797 114.883 10.3501C141.36 10.3205 166.865 20.3284 186.256 38.357C205.648 56.3856 217.485 81.0945 219.381 107.504",
                  stroke: "#FF0000",
                  "stroke-width": "20.7",
                  "stroke-linecap": "round",
                  "stroke-linejoin": "round",
                }),
              }),
              i.jsxs("div", {
                className:
                  "absolute left-1/2 -translate-x-1/2 top-[60%] -translate-y-1/2 flex flex-col items-center gap-[.5625rem]",
                children: [
                  i.jsx("p", {
                    className:
                      "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "META DIÁRIA",
                  }),
                  i.jsxs("span", {
                    className:
                      "text-white/70 font-extrabold text-[1.875rem] leading-[1.375rem]",
                    children: [
                      i.jsxs("b", {
                        className: "text-white",
                        children: [a.goalsCurrent, "/"],
                      }),
                      a.goalsMax,
                    ],
                  }),
                ],
              }),
            ],
          }),
          i.jsx("div", {
            className:
              "w-[14.375rem] h-px bg-gradient-to-r from-[#D9D9D9]/0 via-[#D9D9D9]/10 to-[#D9D9D9]/0",
          }),
          i.jsxs("div", {
            className: "flex flex-col items-center gap-4",
            children: [
              i.jsx("p", {
                className:
                  "text-white font-semibold text-xs leading-[.5625rem]",
                children: "Prêmio para completar",
              }),
              i.jsxs("div", {
                className:
                  "w-[11.1875rem] h-[2.375rem] rounded-[.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] flex items-center justify-center text-[#F2F2F2] font-bold text-base leading-[.75rem]",
                children: ["$", Number(a.reward).toLocaleString("en-US")],
              }),
            ],
          }),
        ],
      }),
      i.jsxs("div", {
        className:
          "w-[19.375rem] h-[16.25rem] flex flex-col justify-center items-center gap-3.5 border-[.05rem] border-white/25 rounded-xl",
        style: {
          background:
            "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
        },
        children: [
          i.jsx("div", {
            className: "flex items-center gap-[.4375rem]",
            children: a.rewards.map((m, h) =>
              i.jsxs(
                "div",
                {
                  className:
                    "h-full flex flex-col justify-start items-center gap-2",
                  children: [
                    i.jsx("div", {
                      className:
                        "size-[3.4375rem] flex justify-center items-center border-[.05rem] border-white/20 rounded-lg",
                      style: {
                        background:
                          "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                      },
                      children: i.jsx("img", { src: m.image, alt: "" }),
                    }),
                    i.jsxs("span", {
                      className:
                        "text-white font-semibold text-[.6875rem] leading-[.5rem]",
                      children: [Math.min(l, m.max), "/", m.max],
                    }),
                  ],
                },
                h
              )
            ),
          }),
          i.jsxs("div", {
            className: "flex flex-col items-center gap-2",
            children: [
              i.jsx("p", {
                className:
                  "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                children: "VOCÊ RECEBERÁ",
              }),
              i.jsxs("div", {
                className:
                  "w-[11.1875rem] h-[2.375rem] rounded-[.5625rem] border-[.05rem] border-white/[0.17] flex items-center justify-center text-[#F2F2F2] font-bold text-base leading-[.75rem]",
                style: {
                  background:
                    "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                },
                children: [
                  "$",
                  Math.floor(
                    Number(
                      (a.reward / a.rewards.reduce((m, h) => m + h.amount, 0)) *
                        a.rewards.reduce((m, h) => m + Math.min(l, h.max), 0)
                    ) || 0
                  ).toLocaleString("en-US"),
                ],
              }),
            ],
          }),
          i.jsxs("div", {
            className: "w-[11.1875rem] flex flex-col gap-[.5625rem]",
            children: [
              i.jsxs("div", {
                className: "flex flex-col gap-1",
                children: [
                  i.jsx("div", {
                    className: "text-center text-white/70 text-xs font-medium",
                    children: "Quantidade: " + l
                  }),
                  i.jsx(s7, {
                    defaultValue: [l],
                    onValueChange: (m) => s(m[0]),
                    max: a.rewards.reduce((m, h) => (m < h.max ? h.max : m), 0),
                    min: 0,
                    step: 1,
                    className: "relative flex h-[1.5rem] items-center",
                    children: i.jsxs(o7, {
                      className:
                        "relative h-[.375rem] flex-grow bg-white/10 rounded-sm",
                      children: [
                        i.jsx(a7, {
                          className:
                            "absolute h-full bg-primary rounded-sm shadow-[0_0_14px] shadow-primary/45",
                        }),
                        i.jsx(u7, {
                          className:
                            "block size-3 -mt-[.1875rem] rounded-full bg-white",
                        }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx("button", {
                onClick: d,
                className:
                  "w-full h-full bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                children: "RESGATAR (" + l + ")",
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function d7() {
  const l = bl(),
    [s, a] = C.useState([]);
  return (
    C.useEffect(() => {
      de("GetLeaders", null, [{ name: "Igor", user_id: 1 }]).then(a);
    }, []),
    i.jsx("div", {
      className:
        "w-full h-[11.4375rem] overflow-hidden flex-none px-[2.1875rem] py-[1.875rem] rounded-xl border-[.05rem] border-white/25 flex flex-col gap-5",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
      },
      children: i.jsxs("div", {
        className: "w-full flex flex-col gap-[.9375rem] overflow-hidden",
        children: [
          i.jsxs("div", {
            className: "w-full flex items-center justify-between",
            children: [
              i.jsx("span", {
                className: "text-white text-sm font-bold leading-[.625rem]",
                children: "Líderes",
              }),
              i.jsx("button", {
                onClick: () => l("/members"),
                className:
                  "w-20 h-5 flex items-center justify-center rounded-md shadow bg-primary text-[#1E1E1E] text-[.625rem] font-bold",
                children: "VER TODOS",
              }),
            ],
          }),
          i.jsx("div", {
            className: "w-full flex flex-col gap-2 overflow-y-auto",
            children: s.map((c) =>
              i.jsxs(
                "div",
                {
                  className: "w-full flex items-center gap-3",
                  children: [
                    i.jsxs("svg", {
                      width: "38",
                      height: "31",
                      className: "flex-none",
                      viewBox: "0 0 38 31",
                      fill: "none",
                      xmlns: "http://www.w3.org/2000/svg",
                      children: [
                        i.jsx("path", {
                          d: "M0 9C0 4.02944 4.02944 0 9 0H29C33.9706 0 38 4.02944 38 9V22C38 26.9706 33.9706 31 29 31H9C4.02944 31 0 26.9706 0 22V9Z",
                          fill: "white",
                          "fill-opacity": "0.05",
                        }),
                        i.jsx("path", {
                          d: "M0.4 9C0.4 4.25035 4.25035 0.4 9 0.4H29C33.7496 0.4 37.6 4.25035 37.6 9V22C37.6 26.7496 33.7496 30.6 29 30.6H9C4.25035 30.6 0.4 26.7496 0.4 22V9Z",
                          stroke: "white",
                          "stroke-opacity": "0.17",
                          "stroke-width": "0.8",
                        }),
                        i.jsx("path", {
                          d: "M19.6562 10.8125C20.0125 10.5938 20.25 10.1969 20.25 9.75C20.25 9.05937 19.6906 8.5 19 8.5C18.3094 8.5 17.75 9.05937 17.75 9.75C17.75 10.2 17.9875 10.5938 18.3438 10.8125L16.5531 14.3938C16.2687 14.9625 15.5312 15.125 15.0344 14.7281L12.25 12.5C12.4062 12.2906 12.5 12.0312 12.5 11.75C12.5 11.0594 11.9406 10.5 11.25 10.5C10.5594 10.5 10 11.0594 10 11.75C10 12.4406 10.5594 13 11.25 13H11.2719L12.7 20.8562C12.8719 21.8062 13.7 22.5 14.6687 22.5H23.3313C24.2969 22.5 25.125 21.8094 25.3 20.8562L26.7281 13H26.75C27.4406 13 28 12.4406 28 11.75C28 11.0594 27.4406 10.5 26.75 10.5C26.0594 10.5 25.5 11.0594 25.5 11.75C25.5 12.0312 25.5938 12.2906 25.75 12.5L22.9656 14.7281C22.4688 15.125 21.7312 14.9625 21.4469 14.3938L19.6562 10.8125Z",
                          fill: "#FF0000",
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className:
                        " h-[1.9375rem] flex-1 px-4 flex items-center gap-3 bg-white/5 border border-white/15 rounded-md",
                      children: [
                        i.jsx("span", {
                          className: "text-primary text-xs font-bold",
                          children: c.user_id,
                        }),
                        i.jsx("p", {
                          className: "text-white text-xs font-bold",
                          children: c.name,
                        }),
                      ],
                    }),
                  ],
                },
                c.user_id
              )
            ),
          }),
        ],
      }),
    })
  );
}
function k1({ status: l }) {
  return i.jsx(i.Fragment, {
    children:
      l === 1
        ? i.jsxs("svg", {
            width: "58",
            height: "58",
            viewBox: "0 0 58 58",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg",
            children: [
              i.jsx("path", {
                d: "M2.95892 25.3194L12.8122 8.253C14.1073 6.00985 16.5007 4.628 19.0909 4.628L38.7975 4.628C41.3877 4.628 43.7811 6.00984 45.0762 8.253L54.9295 25.3194C56.2246 27.5626 56.2246 30.3263 54.9295 32.5694L45.0762 49.6359C43.7811 51.879 41.3877 53.2609 38.7975 53.2609L19.0909 53.2609C16.5007 53.2609 14.1073 51.879 12.8122 49.6359L2.95892 32.5694C1.66383 30.3263 1.66383 27.5626 2.95892 25.3194Z",
                fill: "url(#paint0_radial_780_16)",
                "fill-opacity": "0.45",
                stroke: "#FF0000",
                "stroke-width": "1.5",
              }),
              i.jsx("path", {
                d: "M7.23244 31.4447C6.33927 29.8977 6.33927 27.9917 7.23244 26.4447L15.9234 11.3916C16.8165 9.84455 18.4672 8.89156 20.2535 8.89156L37.6354 8.89156C39.4217 8.89156 41.0724 9.84455 41.9655 11.3916L50.6565 26.4447C51.5496 27.9917 51.5496 29.8977 50.6565 31.4447L41.9655 46.4979C41.0724 48.0449 39.4217 48.9979 37.6354 48.9979L20.2535 48.9979C18.4672 48.9979 16.8165 48.0449 15.9234 46.4979L7.23244 31.4447Z",
                fill: "#FF0000",
              }),
              i.jsx("path", {
                d: "M21 29L26.3333 35L37 23",
                stroke: "#1E1E1E",
                "stroke-width": "1.33333",
                "stroke-linecap": "round",
                "stroke-linejoin": "round",
              }),
              i.jsx("defs", {
                children: i.jsxs("radialGradient", {
                  id: "paint0_radial_780_16",
                  cx: "0",
                  cy: "0",
                  r: "1",
                  gradientUnits: "userSpaceOnUse",
                  gradientTransform:
                    "translate(28.9442 -0.0824878) rotate(90) scale(64.2769 655.912)",
                  children: [
                    i.jsx("stop", {}),
                    i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                  ],
                }),
              }),
            ],
          })
        : l === 2
        ? i.jsxs("svg", {
            width: "59",
            height: "58",
            viewBox: "0 0 59 58",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg",
            children: [
              i.jsx("path", {
                d: "M3.84759 25.3194L13.7009 8.253C14.996 6.00985 17.3894 4.628 19.9796 4.628L39.6862 4.628C42.2764 4.628 44.6698 6.00984 45.9649 8.253L55.8182 25.3194C57.1133 27.5626 57.1133 30.3263 55.8182 32.5694L45.9649 49.6359C44.6698 51.879 42.2764 53.2609 39.6862 53.2609L19.9796 53.2609C17.3894 53.2609 14.996 51.879 13.7009 49.6359L3.84759 32.5694C2.55251 30.3263 2.5525 27.5626 3.84759 25.3194Z",
                stroke: "#CCCCCC",
                "stroke-opacity": "0.3",
                "stroke-width": "1.5",
              }),
              i.jsx("path", {
                d: "M8.12111 31.4447C7.22794 29.8977 7.22795 27.9917 8.12111 26.4447L16.8121 11.3916C17.7052 9.84455 19.3558 8.89156 21.1422 8.89156L38.5241 8.89156C40.3104 8.89156 41.961 9.84455 42.8542 11.3916L51.5451 26.4447C52.4383 27.9917 52.4383 29.8977 51.5451 31.4447L42.8542 46.4979C41.961 48.0449 40.3104 48.9979 38.5241 48.9979L21.1422 48.9979C19.3559 48.9979 17.7052 48.0449 16.8121 46.4979L8.12111 31.4447Z",
                fill: "#CCCCCC",
                "fill-opacity": "0.3",
              }),
              i.jsx("path", {
                "fill-rule": "evenodd",
                "clip-rule": "evenodd",
                d: "M29.8329 30.4792L35.9731 36.6194C36.1778 36.8171 36.452 36.9265 36.7366 36.924C37.0212 36.9216 37.2934 36.8074 37.4947 36.6062C37.6959 36.4049 37.81 36.1327 37.8125 35.8481C37.815 35.5635 37.7056 35.2893 37.5079 35.0846L31.3677 28.9445L37.5079 22.8043C37.7056 22.5996 37.815 22.3254 37.8125 22.0408C37.81 21.7562 37.6959 21.484 37.4947 21.2828C37.2934 21.0815 37.0212 20.9674 36.7366 20.9649C36.452 20.9624 36.1778 21.0718 35.9731 21.2695L29.8329 27.4097L23.6928 21.2695C23.4872 21.0767 23.2146 20.9714 22.9327 20.976C22.6508 20.9806 22.3818 21.0947 22.1826 21.2941C21.9833 21.4935 21.8694 21.7626 21.8651 22.0444C21.8607 22.3263 21.9661 22.5988 22.1591 22.8043L28.2982 28.9445L22.158 35.0846C22.0544 35.1847 21.9717 35.3045 21.9148 35.4369C21.8579 35.5694 21.828 35.7118 21.8267 35.8559C21.8254 36 21.8529 36.1429 21.9075 36.2763C21.9621 36.4097 22.0427 36.5309 22.1446 36.6328C22.2465 36.7347 22.3677 36.8153 22.5011 36.8699C22.6345 36.9245 22.7774 36.952 22.9215 36.9507C23.0656 36.9495 23.208 36.9195 23.3405 36.8626C23.4729 36.8057 23.5927 36.723 23.6928 36.6194L29.8329 30.4792Z",
                fill: "#CCCCCC",
              }),
            ],
          })
        : i.jsxs("svg", {
            width: "59",
            height: "58",
            viewBox: "0 0 59 58",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg",
            children: [
              i.jsx("path", {
                d: "M3.51263 25.3194L13.3659 8.253C14.661 6.00985 17.0545 4.628 19.6446 4.628L39.3513 4.628C41.9414 4.628 44.3349 6.00984 45.6299 8.253L55.4833 25.3194C56.7783 27.5626 56.7783 30.3263 55.4833 32.5694L45.6299 49.6359C44.3349 51.879 41.9414 53.2609 39.3513 53.2609L19.6446 53.2609C17.0545 53.2609 14.661 51.879 13.3659 49.6359L3.51263 32.5694C2.21754 30.3263 2.21754 27.5626 3.51263 25.3194Z",
                fill: "url(#paint0_radial_780_42)",
                "fill-opacity": "0.45",
                stroke: "#FFAA00",
                "stroke-width": "1.5",
              }),
              i.jsx("path", {
                d: "M7.78615 31.4447C6.89298 29.8977 6.89298 27.9917 7.78615 26.4447L16.4771 11.3916C17.3703 9.84455 19.0209 8.89156 20.8072 8.89156L38.1891 8.89156C39.9754 8.89156 41.6261 9.84455 42.5192 11.3916L51.2102 26.4447C52.1033 27.9917 52.1033 29.8977 51.2102 31.4447L42.5192 46.4979C41.6261 48.0449 39.9754 48.9979 38.1891 48.9979L20.8072 48.9979C19.0209 48.9979 17.3703 48.0449 16.4771 46.4979L7.78615 31.4447Z",
                fill: "#FFAA00",
              }),
              i.jsx("path", {
                d: "M41.0758 28.9449C41.0758 32.0155 39.856 34.9603 37.6848 37.1315C35.5135 39.3028 32.5687 40.5226 29.4981 40.5226C26.4275 40.5226 23.4827 39.3028 21.3114 37.1315C19.1402 34.9603 17.9204 32.0155 17.9204 28.9449C17.9204 25.8743 19.1402 22.9295 21.3114 20.7582C23.4827 18.587 26.4275 17.3672 29.4981 17.3672C32.5687 17.3672 35.5135 18.587 37.6848 20.7582C39.856 22.9295 41.0758 25.8743 41.0758 28.9449ZM29.4981 22.4324C29.4981 22.2405 29.4219 22.0565 29.2862 21.9208C29.1505 21.7851 28.9664 21.7088 28.7745 21.7088C28.5826 21.7088 28.3985 21.7851 28.2628 21.9208C28.1271 22.0565 28.0509 22.2405 28.0509 22.4324V30.3921C28.0509 30.5196 28.0847 30.6449 28.1487 30.7552C28.2128 30.8655 28.3048 30.9569 28.4156 31.0202L33.4808 33.9146C33.6471 34.0044 33.8418 34.0257 34.0235 33.9738C34.2052 33.922 34.3594 33.8011 34.4531 33.637C34.5469 33.473 34.5727 33.2788 34.5252 33.0959C34.4776 32.913 34.3604 32.756 34.1986 32.6584L29.4981 29.9724V22.4324Z",
                fill: "#1E1E1E",
              }),
              i.jsx("defs", {
                children: i.jsxs("radialGradient", {
                  id: "paint0_radial_780_42",
                  cx: "0",
                  cy: "0",
                  r: "1",
                  gradientUnits: "userSpaceOnUse",
                  gradientTransform:
                    "translate(29.4979 -0.0824878) rotate(90) scale(64.2769 655.912)",
                  children: [
                    i.jsx("stop", {}),
                    i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                  ],
                }),
              }),
            ],
          }),
  });
}
function f7() {
  const { user_id: l, name: s } = Me(),
    [a, c] = C.useState({ status: [1, 2], rankingPosition: 2 }),
    d = bl();

    C.useEffect(() => {
      (async () => {
        const dados = await de("MyGoalsInfos", null, {
          status: [1, 2],
          rankingPosition: 2
        });

        if (!dados) return;

        c({
          status: dados.status || [],
          rankingPosition: dados.rankingPosition || 0
        });
      })();
    }, []);

  return i.jsxs("div", {
    className:
      "w-full h-[16.25rem] px-[2.1875rem] py-[1.875rem] rounded-xl border-[.05rem] border-white/25 flex flex-col gap-5",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
    },
    children: [
      i.jsxs("div", {
        className: "w-full flex flex-col gap-[.9375rem]",
        children: [
          i.jsxs("div", {
            className: "w-full flex items-center justify-between",
            children: [
              i.jsx("span", {
                className: "text-white text-sm font-bold leading-[.625rem]",
                children: "RANKING",
              }),
              i.jsx("button", {
                onClick: () => d("/goals"),
                className:
                  "w-20 h-5 flex items-center justify-center rounded-md shadow bg-primary text-[#1E1E1E] text-[.625rem] font-bold",
                children: "VER TODOS",
              }),
            ],
          }),
          i.jsxs("div", {
            className: "w-full h-[1.9375rem] flex items-center gap-2",
            children: [
              i.jsx("div", {
                className:
                  "size-[2.375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                children: i.jsx("svg", {
                  className: "text-primary",
                  width: "18",
                  height: "19",
                  viewBox: "0 0 18 19",
                  fill: "none",
                  xmlns: "http://www.w3.org/2000/svg",
                  children: i.jsx("path", {
                    d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                    fill: "currentColor",
                  }),
                }),
              }),
              i.jsx("div", {
                className:
                  "w-full h-[2.375rem] flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                children: i.jsxs("div", {
                  className: "flex items-center gap-2.5",
                  children: [
                    i.jsxs("span", {
                      className:
                        "text-primary text-sm font-bold leading-[.625rem]",
                      children: [a.rankingPosition, "º"],
                    }),
                    i.jsx("span", {
                      className:
                        "text-white text-xs font-semibold leading-[.625rem]",
                      children: s,
                    }),
                  ],
                }),
              }),
            ],
          }),
        ],
      }),
      i.jsx("div", {
        className:
          "w-full h-px flex-none bg-gradient-to-r from-white/0 via-white/10 to-white/0",
      }),
      i.jsxs("div", {
        className: "w-full flex flex-col gap-5",
        children: [
          i.jsxs("div", {
            className: "text-white text-sm font-bold leading-[.625rem]",
            children: [
              "SEU DESEMPENHO ",
              i.jsx("b", {
                className: "text-[.6875rem] font-medium text-white/60",
                children: "(ENTREGA DE FARM)",
              }),
            ],
          }),
          i.jsxs("div", {
            className: "w-full flex justify-between",
            children: [
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "SEG",
                  }),
                  i.jsx(k1, { status: a.status[0] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "TER",
                  }),
                  i.jsx(k1, { status: a.status[1] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "QUA",
                  }),
                  i.jsx(k1, { status: a.status[2] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "QUI",
                  }),
                  i.jsx(k1, { status: a.status[3] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "SEX",
                  }),
                  i.jsx(k1, { status: a.status[4] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "SAB",
                  }),
                  i.jsx(k1, { status: a.status[5] }),
                ],
              }),
              i.jsxs("div", {
                className: "flex flex-col items-center gap-[.3125rem]",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 text-[.6875rem] font-semibold leading-[.5rem]",
                    children: "DOM",
                  }),
                  i.jsx(k1, { status: a.status[6] }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function m7() {
  var d, m, h, p, y, w, E, g, b, R, P, S;
  const [l, s] = C.useState([]),
    [a, c] = C.useState();
  return (
    C.useEffect(() => {
      (async () => {
        const M = await de("GetRanking", null, [
          { name: "fivecommunity", time: 35, player: !0, pos: 35 },
          { name: "João Silva", time: 437453745, player: !1 },
          { name: "Maria Santos", time: 3242, player: !1 },
          { name: "Pedro Oliveira", time: 422, player: !1 },
          { name: "Ana Costa", time: 600, player: !1 },
        ]);
        if (!M) return;
        const H = M.find((V) => V.player);
        s(M), c(H || { name: "Nome", time: 0, player: !0, pos: 999 });
      })();
    }, []),
    i.jsxs("div", {
      className:
        "w-[40rem] h-[18.125rem] flex flex-col gap-4 px-[1.875rem] pt-[1.875rem] pb-5 border-[.05rem] border-white/25 rounded-xl",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
      },
      children: [
        i.jsx("p", {
          className: "text-white text-base leading-[.75rem] font-extrabold",
          children: "RANKING",
        }),
        i.jsxs("div", {
          className: "flex flex-col gap-[.5625rem]",
          children: [
            i.jsxs("div", {
              className: "flex flex-col gap-3",
              children: [
                i.jsxs("div", {
                  className: "h-2 flex",
                  children: [
                    i.jsx("span", {
                      className:
                        "ml-1.5 w-[6.5rem] text-white/60 font-semibold text-[.6875rem] leading-[0.5rem]",
                      children: "POS",
                    }),
                    i.jsx("span", {
                      className:
                        "w-[21.75rem] text-white/60 font-semibold text-[.6875rem] leading-[0.5rem]",
                      children: "NOME",
                    }),
                    i.jsx("span", {
                      className:
                        "text-white/60 font-semibold text-[.6875rem] leading-[0.5rem]",
                      children: "TEMPO JOGADO",
                    }),
                  ],
                }),
                i.jsxs("div", {
                  className: "w-full flex flex-col gap-1.5",
                  children: [
                    i.jsxs("div", {
                      className: "w-full h-[1.9375rem] flex items-center gap-2",
                      children: [
                        i.jsx("div", {
                          className:
                            "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                          children: i.jsx("svg", {
                            width: "18",
                            height: "19",
                            viewBox: "0 0 18 19",
                            fill: "none",
                            xmlns: "http://www.w3.org/2000/svg",
                            children: i.jsx("path", {
                              d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                              fill: "#FF0000",
                            }),
                          }),
                        }),
                        i.jsxs("div", {
                          className:
                            "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                          children: [
                            i.jsxs("div", {
                              className: "flex items-center gap-2.5",
                              children: [
                                i.jsx("span", {
                                  className:
                                    "w-10 text-[#FF0000] text-sm font-bold leading-[.625rem]",
                                  children: "1º",
                                }),
                                i.jsx("span", {
                                  className:
                                    "text-white text-xs font-semibold leading-[.625rem]",
                                  children:
                                    (d = l[0]) == null ? void 0 : d.name,
                                }),
                              ],
                            }),
                            i.jsxs("div", {
                              className: "flex items-center gap-[.5625rem]",
                              children: [
                                i.jsxs("span", {
                                  className:
                                    "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                                  children: [
                                    Math.floor(
                                      ((m = l[0]) == null ? void 0 : m.time) /
                                        3600
                                    ),
                                    "h ",
                                    Math.floor(
                                      (((h = l[0]) == null ? void 0 : h.time) %
                                        3600) /
                                        60
                                    ),
                                    "min",
                                  ],
                                }),
                                i.jsxs("svg", {
                                  width: "15",
                                  height: "15",
                                  viewBox: "0 0 15 15",
                                  fill: "none",
                                  xmlns: "http://www.w3.org/2000/svg",
                                  children: [
                                    i.jsx("g", {
                                      "clip-path": "url(#clip0_172_2541)",
                                      children: i.jsx("path", {
                                        d: "M15 7.5C15 9.48912 14.2098 11.3968 12.8033 12.8033C11.3968 14.2098 9.48912 15 7.5 15C5.51088 15 3.60322 14.2098 2.1967 12.8033C0.790176 11.3968 0 9.48912 0 7.5C0 5.51088 0.790176 3.60322 2.1967 2.1967C3.60322 0.790176 5.51088 0 7.5 0C9.48912 0 11.3968 0.790176 12.8033 2.1967C14.2098 3.60322 15 5.51088 15 7.5ZM7.5 3.28125C7.5 3.15693 7.45061 3.0377 7.36271 2.94979C7.2748 2.86189 7.15557 2.8125 7.03125 2.8125C6.90693 2.8125 6.7877 2.86189 6.69979 2.94979C6.61189 3.0377 6.5625 3.15693 6.5625 3.28125V8.4375C6.56253 8.52012 6.58439 8.60127 6.62588 8.67273C6.66737 8.74418 6.72701 8.80339 6.79875 8.84437L10.08 10.7194C10.1877 10.7776 10.3139 10.7913 10.4315 10.7577C10.5492 10.7241 10.6491 10.6458 10.7099 10.5396C10.7706 10.4333 10.7873 10.3075 10.7565 10.189C10.7257 10.0706 10.6498 9.96885 10.545 9.90563L7.5 8.16562V3.28125Z",
                                        fill: "#FF0000",
                                      }),
                                    }),
                                    i.jsx("defs", {
                                      children: i.jsx("clipPath", {
                                        id: "clip0_172_2541",
                                        children: i.jsx("rect", {
                                          width: "15",
                                          height: "15",
                                          fill: "white",
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              ],
                            }),
                          ],
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className: "w-full h-[1.9375rem] flex items-center gap-2",
                      children: [
                        i.jsx("div", {
                          className:
                            "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                          children: i.jsx("svg", {
                            width: "18",
                            height: "19",
                            viewBox: "0 0 18 19",
                            fill: "none",
                            xmlns: "http://www.w3.org/2000/svg",
                            children: i.jsx("path", {
                              d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                              fill: "#BEBEBE",
                            }),
                          }),
                        }),
                        i.jsxs("div", {
                          className:
                            "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                          children: [
                            i.jsxs("div", {
                              className: "flex items-center gap-2.5",
                              children: [
                                i.jsx("span", {
                                  className:
                                    "w-10 text-[#BEBEBE] text-sm font-bold leading-[.625rem]",
                                  children: "2º",
                                }),
                                i.jsx("span", {
                                  className:
                                    "text-white text-xs font-semibold leading-[.625rem]",
                                  children:
                                    (p = l[1]) == null ? void 0 : p.name,
                                }),
                              ],
                            }),
                            i.jsxs("div", {
                              className: "flex items-center gap-[.5625rem]",
                              children: [
                                i.jsxs("span", {
                                  className:
                                    "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                                  children: [
                                    Math.floor(
                                      ((y = l[1]) == null ? void 0 : y.time) /
                                        3600
                                    ),
                                    "h ",
                                    Math.floor(
                                      (((w = l[1]) == null ? void 0 : w.time) %
                                        3600) /
                                        60
                                    ),
                                    "min",
                                  ],
                                }),
                                i.jsxs("svg", {
                                  width: "15",
                                  height: "15",
                                  viewBox: "0 0 15 15",
                                  fill: "none",
                                  xmlns: "http://www.w3.org/2000/svg",
                                  children: [
                                    i.jsx("g", {
                                      "clip-path": "url(#clip0_172_2541)",
                                      children: i.jsx("path", {
                                        d: "M15 7.5C15 9.48912 14.2098 11.3968 12.8033 12.8033C11.3968 14.2098 9.48912 15 7.5 15C5.51088 15 3.60322 14.2098 2.1967 12.8033C0.790176 11.3968 0 9.48912 0 7.5C0 5.51088 0.790176 3.60322 2.1967 2.1967C3.60322 0.790176 5.51088 0 7.5 0C9.48912 0 11.3968 0.790176 12.8033 2.1967C14.2098 3.60322 15 5.51088 15 7.5ZM7.5 3.28125C7.5 3.15693 7.45061 3.0377 7.36271 2.94979C7.2748 2.86189 7.15557 2.8125 7.03125 2.8125C6.90693 2.8125 6.7877 2.86189 6.69979 2.94979C6.61189 3.0377 6.5625 3.15693 6.5625 3.28125V8.4375C6.56253 8.52012 6.58439 8.60127 6.62588 8.67273C6.66737 8.74418 6.72701 8.80339 6.79875 8.84437L10.08 10.7194C10.1877 10.7776 10.3139 10.7913 10.4315 10.7577C10.5492 10.7241 10.6491 10.6458 10.7099 10.5396C10.7706 10.4333 10.7873 10.3075 10.7565 10.189C10.7257 10.0706 10.6498 9.96885 10.545 9.90563L7.5 8.16562V3.28125Z",
                                        fill: "#FF0000",
                                      }),
                                    }),
                                    i.jsx("defs", {
                                      children: i.jsx("clipPath", {
                                        id: "clip0_172_2541",
                                        children: i.jsx("rect", {
                                          width: "15",
                                          height: "15",
                                          fill: "white",
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              ],
                            }),
                          ],
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className: "w-full h-[1.9375rem] flex items-center gap-2",
                      children: [
                        i.jsx("div", {
                          className:
                            "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                          children: i.jsx("svg", {
                            width: "18",
                            height: "19",
                            viewBox: "0 0 18 19",
                            fill: "none",
                            xmlns: "http://www.w3.org/2000/svg",
                            children: i.jsx("path", {
                              d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                              fill: "#CD886B",
                            }),
                          }),
                        }),
                        i.jsxs("div", {
                          className:
                            "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                          children: [
                            i.jsxs("div", {
                              className: "flex items-center gap-2.5",
                              children: [
                                i.jsx("span", {
                                  className:
                                    "w-10 text-[#CD886B] text-sm font-bold leading-[.625rem]",
                                  children: "3º",
                                }),
                                i.jsx("span", {
                                  className:
                                    "text-white text-xs font-semibold leading-[.625rem]",
                                  children:
                                    (E = l[2]) == null ? void 0 : E.name,
                                }),
                              ],
                            }),
                            i.jsxs("div", {
                              className: "flex items-center gap-[.5625rem]",
                              children: [
                                i.jsxs("span", {
                                  className:
                                    "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                                  children: [
                                    Math.floor(
                                      ((g = l[2]) == null ? void 0 : g.time) /
                                        3600
                                    ),
                                    "h ",
                                    Math.floor(
                                      (((b = l[2]) == null ? void 0 : b.time) %
                                        3600) /
                                        60
                                    ),
                                    "min",
                                  ],
                                }),
                                i.jsxs("svg", {
                                  width: "15",
                                  height: "15",
                                  viewBox: "0 0 15 15",
                                  fill: "none",
                                  xmlns: "http://www.w3.org/2000/svg",
                                  children: [
                                    i.jsx("g", {
                                      "clip-path": "url(#clip0_172_2541)",
                                      children: i.jsx("path", {
                                        d: "M15 7.5C15 9.48912 14.2098 11.3968 12.8033 12.8033C11.3968 14.2098 9.48912 15 7.5 15C5.51088 15 3.60322 14.2098 2.1967 12.8033C0.790176 11.3968 0 9.48912 0 7.5C0 5.51088 0.790176 3.60322 2.1967 2.1967C3.60322 0.790176 5.51088 0 7.5 0C9.48912 0 11.3968 0.790176 12.8033 2.1967C14.2098 3.60322 15 5.51088 15 7.5ZM7.5 3.28125C7.5 3.15693 7.45061 3.0377 7.36271 2.94979C7.2748 2.86189 7.15557 2.8125 7.03125 2.8125C6.90693 2.8125 6.7877 2.86189 6.69979 2.94979C6.61189 3.0377 6.5625 3.15693 6.5625 3.28125V8.4375C6.56253 8.52012 6.58439 8.60127 6.62588 8.67273C6.66737 8.74418 6.72701 8.80339 6.79875 8.84437L10.08 10.7194C10.1877 10.7776 10.3139 10.7913 10.4315 10.7577C10.5492 10.7241 10.6491 10.6458 10.7099 10.5396C10.7706 10.4333 10.7873 10.3075 10.7565 10.189C10.7257 10.0706 10.6498 9.96885 10.545 9.90563L7.5 8.16562V3.28125Z",
                                        fill: "#FF0000",
                                      }),
                                    }),
                                    i.jsx("defs", {
                                      children: i.jsx("clipPath", {
                                        id: "clip0_172_2541",
                                        children: i.jsx("rect", {
                                          width: "15",
                                          height: "15",
                                          fill: "white",
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              ],
                            }),
                          ],
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className: "w-full h-[1.9375rem] flex items-center gap-2",
                      children: [
                        i.jsx("div", {
                          className:
                            "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                          children: i.jsx("svg", {
                            width: "18",
                            height: "19",
                            viewBox: "0 0 18 19",
                            fill: "none",
                            xmlns: "http://www.w3.org/2000/svg",
                            children: i.jsx("path", {
                              d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                              fill: "white",
                              fillOpacity: 0.5,
                            }),
                          }),
                        }),
                        i.jsxs("div", {
                          className:
                            "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                          children: [
                            i.jsxs("div", {
                              className: "flex items-center gap-2.5",
                              children: [
                                i.jsx("span", {
                                  className:
                                    "w-10 text-white/50 text-sm font-bold leading-[.625rem]",
                                  children: "4º",
                                }),
                                i.jsx("span", {
                                  className:
                                    "text-white text-xs font-semibold leading-[.625rem]",
                                  children:
                                    (R = l[3]) == null ? void 0 : R.name,
                                }),
                              ],
                            }),
                            i.jsxs("div", {
                              className: "flex items-center gap-[.5625rem]",
                              children: [
                                i.jsxs("span", {
                                  className:
                                    "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                                  children: [
                                    Math.floor(
                                      ((P = l[2]) == null ? void 0 : P.time) /
                                        3600
                                    ),
                                    "h ",
                                    Math.floor(
                                      (((S = l[2]) == null ? void 0 : S.time) %
                                        3600) /
                                        60
                                    ),
                                    "min",
                                  ],
                                }),
                                i.jsxs("svg", {
                                  width: "15",
                                  height: "15",
                                  viewBox: "0 0 15 15",
                                  fill: "none",
                                  xmlns: "http://www.w3.org/2000/svg",
                                  children: [
                                    i.jsx("g", {
                                      "clip-path": "url(#clip0_172_2541)",
                                      children: i.jsx("path", {
                                        d: "M15 7.5C15 9.48912 14.2098 11.3968 12.8033 12.8033C11.3968 14.2098 9.48912 15 7.5 15C5.51088 15 3.60322 14.2098 2.1967 12.8033C0.790176 11.3968 0 9.48912 0 7.5C0 5.51088 0.790176 3.60322 2.1967 2.1967C3.60322 0.790176 5.51088 0 7.5 0C9.48912 0 11.3968 0.790176 12.8033 2.1967C14.2098 3.60322 15 5.51088 15 7.5ZM7.5 3.28125C7.5 3.15693 7.45061 3.0377 7.36271 2.94979C7.2748 2.86189 7.15557 2.8125 7.03125 2.8125C6.90693 2.8125 6.7877 2.86189 6.69979 2.94979C6.61189 3.0377 6.5625 3.15693 6.5625 3.28125V8.4375C6.56253 8.52012 6.58439 8.60127 6.62588 8.67273C6.66737 8.74418 6.72701 8.80339 6.79875 8.84437L10.08 10.7194C10.1877 10.7776 10.3139 10.7913 10.4315 10.7577C10.5492 10.7241 10.6491 10.6458 10.7099 10.5396C10.7706 10.4333 10.7873 10.3075 10.7565 10.189C10.7257 10.0706 10.6498 9.96885 10.545 9.90563L7.5 8.16562V3.28125Z",
                                        fill: "#FF0000",
                                      }),
                                    }),
                                    i.jsx("defs", {
                                      children: i.jsx("clipPath", {
                                        id: "clip0_172_2541",
                                        children: i.jsx("rect", {
                                          width: "15",
                                          height: "15",
                                          fill: "white",
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              ],
                            }),
                          ],
                        }),
                      ],
                    }),
                  ],
                }),
              ],
            }),
            i.jsx("div", {
              className:
                "w-full h-px bg-gradient-to-r from-white/0 via-white/10 to-white/0",
            }),
            i.jsxs("div", {
              className: "w-full h-[1.9375rem] flex items-center gap-2",
              children: [
                i.jsx("div", {
                  className:
                    "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-primary",
                  children: i.jsx("svg", {
                    width: "18",
                    height: "19",
                    viewBox: "0 0 18 19",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                      fill: "#FF0000",
                    }),
                  }),
                }),
                i.jsxs("div", {
                  className:
                    "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-primary rounded-[.5625rem]",
                  children: [
                    i.jsxs("div", {
                      className: "flex items-center gap-2.5",
                      children: [
                        i.jsxs("span", {
                          className:
                            "w-10 text-[#FF0000] text-sm font-bold leading-[.625rem]",
                          children: [(a == null ? void 0 : a.pos) || 99, "º"],
                        }),
                        i.jsx("span", {
                          className:
                            "w-[3.5rem] h-[1.125rem] rounded-md grid place-items-center text-[#1E1E1E] text-xs font-bold leading-[.625rem] bg-primary shadow-[0_0_14px] shadow-primary/45",
                          children: "VOCÊ",
                        }),
                        i.jsx("span", {
                          className:
                            "text-white text-xs font-semibold leading-[.625rem]",
                          children:
                            [(a == null ? void 0 : a.name) || "VOCÊ"],
                        }),
                      ],
                    }),
                    i.jsxs("div", {
                      className: "flex items-center gap-[.5625rem]",
                      children: [
                        i.jsxs("span", {
                          className:
                            "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                          children: [
                            Math.floor(
                              ((a == null ? void 0 : a.time) || 0) / 3600
                            ),
                            "h ",
                            Math.floor(
                              (((a == null ? void 0 : a.time) || 0) % 3600) / 60
                            ),
                            "min",
                          ],
                        }),
                        i.jsxs("svg", {
                          width: "15",
                          height: "15",
                          viewBox: "0 0 15 15",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("g", {
                              "clip-path": "url(#clip0_172_2541)",
                              children: i.jsx("path", {
                                d: "M15 7.5C15 9.48912 14.2098 11.3968 12.8033 12.8033C11.3968 14.2098 9.48912 15 7.5 15C5.51088 15 3.60322 14.2098 2.1967 12.8033C0.790176 11.3968 0 9.48912 0 7.5C0 5.51088 0.790176 3.60322 2.1967 2.1967C3.60322 0.790176 5.51088 0 7.5 0C9.48912 0 11.3968 0.790176 12.8033 2.1967C14.2098 3.60322 15 5.51088 15 7.5ZM7.5 3.28125C7.5 3.15693 7.45061 3.0377 7.36271 2.94979C7.2748 2.86189 7.15557 2.8125 7.03125 2.8125C6.90693 2.8125 6.7877 2.86189 6.69979 2.94979C6.61189 3.0377 6.5625 3.15693 6.5625 3.28125V8.4375C6.56253 8.52012 6.58439 8.60127 6.62588 8.67273C6.66737 8.74418 6.72701 8.80339 6.79875 8.84437L10.08 10.7194C10.1877 10.7776 10.3139 10.7913 10.4315 10.7577C10.5492 10.7241 10.6491 10.6458 10.7099 10.5396C10.7706 10.4333 10.7873 10.3075 10.7565 10.189C10.7257 10.0706 10.6498 9.96885 10.545 9.90563L7.5 8.16562V3.28125Z",
                                fill: "#FF0000",
                              }),
                            }),
                            i.jsx("defs", {
                              children: i.jsx("clipPath", {
                                id: "clip0_172_2541",
                                children: i.jsx("rect", {
                                  width: "15",
                                  height: "15",
                                  fill: "white",
                                }),
                              }),
                            }),
                          ],
                        }),
                      ],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
      ],
    })
  );
}
function p7() {
  const l = C.useRef(null);
  function s() {
    var a;
    de("NewWarn", {
      message: String((a = l.current) == null ? void 0 : a.value),
    });
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[6.875rem] h-full bg-white/15 border-[.05rem] border-white/[0.17] rounded-lg text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
          children: "NOVO",
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_182_3593)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M38.9 35.1001L20.2 30.7001C19.5126 29.9467 19.1217 28.9696 19.1 27.95C19.1217 26.9305 19.5126 25.9534 20.2 25.2L38.9 20.8V35.1001Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("path", {
                    d: "M26.8 29.6C26.8 28.385 25.8151 27.4 24.6 27.4C23.385 27.4 22.4 28.385 22.4 29.6V34C22.4 35.2151 23.385 36.2 24.6 36.2C25.8151 36.2 26.8 35.2151 26.8 34V29.6Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_182_3593",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "CRIAR AVISO",
              }),
              i.jsx(p1, {}),
              i.jsx("textarea", {
                ref: l,
                placeholder: "Insira uma descrição",
                maxLength: 700,
                className:
                  "w-full h-[10.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none p-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem] resize-none",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: s,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "CRIAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function h7() {
  const { warnings: l } = Me();
  return i.jsxs("div", {
    className:
      "w-full h-[9.9375rem] max-h-[9.9375rem] pt-5 px-[1.875rem] flex flex-col gap-2.5 border-[.05rem] border-white/25 rounded-xl overflow-hidden",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
    },
    children: [
      i.jsxs("div", {
        className: "w-full flex justify-between",
        children: [
          i.jsx("h4", {
            className: "text-white text-base font-extrabold",
            children: "AVISOS",
          }),
          i.jsx(p7, {}),
        ],
      }),
      i.jsx("div", {
        className: "w-full max-h-full flex flex-col gap-2.5 overflow-y-auto",
        children: l.map((s) =>
          i.jsxs("div", {
            className:
              "w-full flex flex-col gap-2.5 p-[.9375rem] border-[.05rem] border-white/[0.17] rounded-[.625rem] bg-white/5",
            children: [
              i.jsxs("div", {
                className: "w-full flex items-center gap-5",
                children: [
                  i.jsxs("div", {
                    className: "w-full flex items-center gap-2.5",
                    children: [
                      i.jsx("img", {
                        src: s.author_avatar,
                        alt: "",
                        className:
                          "size-[2.125rem] rounded-full border border-primary shadow-[0_0_14px] shadow-primary/45",
                      }),
                      i.jsx("span", {
                        className:
                          "w-full text-white text-[.8125rem] font-semibold",
                        children: s.author,
                      }),
                    ],
                  }),
                  i.jsx("svg", {
                    className: "size-[1.125rem] flex-none",
                    width: "18",
                    height: "18",
                    viewBox: "0 0 18 18",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: i.jsx("path", {
                      d: "M15.75 3.375H3.375L4.5 16.875H13.5L14.625 3.375H2.25M9 6.75V13.5M11.8125 6.75L11.25 13.5M6.1875 6.75L6.75 13.5M6.75 3.375L7.3125 1.125H10.6875L11.25 3.375",
                      stroke: "#CCCCCC",
                      "stroke-opacity": "0.6",
                      "stroke-linecap": "round",
                      "stroke-linejoin": "round",
                    }),
                  }),
                ],
              }),
              i.jsx("span", {
                className: "text-white/70 text-[.6875rem] leading-[.8125rem]",
                children: s.message,
              }),
            ],
          })
        ),
      }),
    ],
  });
}
const C7 = "" + new URL("radio-b5kMCe0J.png", import.meta.url).href,
  x7 = "" + new URL("clothes-XkLf529h.png", import.meta.url).href,
  g7 = "" + new URL("location-raHLciXb.png", import.meta.url).href;
function v7() {
  const { radio: l, preset: s } = Me();
  function a() {
    de("ConnectRadio", { radio: l }, !0);
  }
  function c() {
    de("SetCostume", { preset: s }, !0);
  }
  function d() {
    de("SetLocation", null, !0);
  }
  return i.jsxs("div", {
    className: "overflow-hidden flex gap-2.5",
    children: [
      i.jsxs("div", {
        className: "w-[40rem] flex flex-col gap-2.5",
        children: [i.jsx(c7, {}), i.jsx(m7, {}), i.jsx(h7, {})],
      }),
      i.jsxs("div", {
        className: "w-[35rem] flex flex-col gap-2.5",
        children: [
          i.jsx(f7, {}),
          i.jsx(d7, {}),
          i.jsxs("div", {
            className: "w-full h-full flex gap-2.5",
            children: [
              i.jsxs("div", {
                className:
                  "flex-1 flex flex-col items-center justify-between py-5 border-[.05rem] border-white/25 rounded-xl",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsxs("div", {
                    className: "flex flex-col items-center gap-5",
                    children: [
                      i.jsx("div", {
                        className:
                          "size-[8.75rem] rounded-[.875rem] border-[.05rem] border-white/30 flex justify-center items-center overflow-hidden",
                        style: {
                          background:
                            "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                        },
                        children: i.jsx("img", {
                          src: C7,
                          alt: "",
                          className: "max-h-[8.75rem]  p-2.5",
                        }),
                      }),
                      i.jsx("span", {
                        className:
                          "text-white text-sm font-extrabold leading-[.625rem]",
                        children: "RÁDIO",
                      }),
                    ],
                  }),
                  i.jsx("button", {
                    onClick: a,
                    className:
                      "w-[7.6875rem] h-8 bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                    children: "ENTRAR",
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "flex-1 flex flex-col items-center justify-between py-5 border-[.05rem] border-white/25 rounded-xl",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsxs("div", {
                    className: "flex flex-col items-center gap-5",
                    children: [
                      i.jsx("div", {
                        className:
                          "size-[8.75rem] rounded-[.875rem] border-[.05rem] border-white/30 flex justify-center items-center overflow-hidden",
                        style: {
                          background:
                            "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                        },
                        children: i.jsx("img", {
                          src: g7,
                          alt: "",
                          className: "max-h-[8.75rem]  p-2.5",
                        }),
                      }),
                      i.jsx("span", {
                        className:
                          "text-white text-sm font-extrabold leading-[.625rem]",
                        children: "LOCALIZAÇÃO",
                      }),
                    ],
                  }),
                  i.jsx("button", {
                    onClick: d,
                    className:
                      "w-[7.6875rem] h-8 bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                    children: "MARCAR",
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "flex-1 flex flex-col items-center justify-between py-5 border-[.05rem] border-white/25 rounded-xl",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsxs("div", {
                    className: "flex flex-col items-center gap-5",
                    children: [
                      i.jsx("div", {
                        className:
                          "size-[8.75rem] rounded-[.875rem] border-[.05rem] border-white/30 flex justify-center items-center overflow-hidden",
                        style: {
                          background:
                            "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                        },
                        children: i.jsx("img", {
                          src: x7,
                          alt: "",
                          className: "max-h-[8.75rem]  p-2.5",
                        }),
                      }),
                      i.jsx("span", {
                        className:
                          "text-white text-sm font-extrabold leading-[.625rem]",
                        children: "UNIFORME",
                      }),
                    ],
                  }),
                  i.jsx("button", {
                    onClick: c,
                    className:
                      "w-[7.6875rem] h-8 bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                    children: "VESTIR",
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function w7({
  id: l,
  name: s,
  role: a,
  lastLogin: c,
  onPromote: d,
  onDemote: m,
  onRemove: h,
}) {
  return i.jsxs("div", {
    className:
      "w-full h-11 flex-none rounded-xl pl-5 pr-2 border-[.05rem] border-white/25 flex items-center justify-between",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
    },
    children: [
      i.jsx("span", {
        className:
          "w-[1.875rem] text-white text-xs leading-[.5625rem] font-extrabold",
        children: l,
      }),
      i.jsx("span", {
        className:
          "w-[9.375rem] text-center text-white text-xs leading-[.5625rem] font-extrabold",
        children: s,
      }),
      i.jsx("span", {
        className:
          "w-[9.375rem] text-center text-white text-xs leading-[.5625rem] font-extrabold",
        children: a,
      }),
      i.jsx("span", {
        className:
          "w-[9.375rem] text-center text-white text-xs leading-[.5625rem] font-extrabold",
        children: c,
      }),
      i.jsxs("div", {
        className: "w-[17.5rem] flex items-center justify-end gap-[.3125rem]",
        children: [
          d &&
            i.jsx("button", {
              className: ie(
                "w-[5.625rem] h-[1.625rem] flex items-center justify-center rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 font-extrabold text-[.625rem] hover:text-[#1E1E1E] hover:bg-primary hover:shadow-[0_0_4px_0] shadow-primary"
              ),
              onClick: d,
              children: "UPAR",
            }),
          m &&
            i.jsx("button", {
              className: ie(
                "w-[5.625rem] h-[1.625rem] flex items-center justify-center rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 font-extrabold text-[.625rem] hover:text-[#1E1E1E] hover:bg-primary hover:shadow-[0_0_4px_0] shadow-primary"
              ),
              onClick: m,
              children: "REBAIXAR",
            }),
          h &&
            i.jsx("button", {
              className: ie(
                "w-[5.625rem] h-[1.625rem] flex items-center justify-center rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 font-extrabold text-[.625rem] hover:text-[#1E1E1E] hover:bg-primary hover:shadow-[0_0_4px_0] shadow-primary"
              ),
              onClick: h,
              children: "REMOVER",
            }),
        ],
      }),
    ],
  });
}
function y7() {
  const l = C.useRef(null),
    s = () => {
      var c;
      const a = (c = l.current) == null ? void 0 : c.value;
      de("ContractMember", { id: Number(a) });
    };
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
            children: "ADICIONAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_375_1049)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M32.9971 34.5549V33.4206C34.4661 32.5667 35.6633 30.4396 35.6633 28.3111C35.6633 24.8942 35.6633 22.1236 31.664 22.1236C27.6647 22.1236 27.6647 24.8942 27.6647 28.3111C27.6647 30.4396 28.8618 32.5667 30.3309 33.4206V34.5549C25.809 34.9358 22.3323 37.2279 22.3323 39.9986H40.9956C40.9956 37.2279 37.5189 34.9358 32.9971 34.5549Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("path", {
                    d: "M23.8148 35.0857C24.9666 34.3089 26.3997 33.719 27.9767 33.3587C27.6558 32.9657 27.3732 32.5411 27.1329 32.091C26.5061 30.936 26.1731 29.6361 26.165 28.3125C26.165 26.4645 26.165 24.7183 26.8023 23.2896C27.4208 21.9036 28.5339 21.0442 30.119 20.7225C29.7671 19.0794 28.8286 18 26.3317 18C22.3324 18 22.3324 20.7706 22.3324 24.1875C22.3324 26.316 23.5295 28.4431 24.9986 29.297V30.4314C20.4767 30.8122 17 33.1044 17 35.875H22.811C23.1131 35.5972 23.4477 35.3346 23.8148 35.0871V35.0857Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_375_1049",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "NOVO MEMBRO",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: l,
                type: "number",
                placeholder: "Passaporte do jogador",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: s,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "ADICIONAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function j7() {
  const { permissions: l, user_id: s } = Me(),
    [a, c] = C.useState(""),
    [d, m] = C.useState([]);
  C.useEffect(() => {
    de("GetMembers", {}, [
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 1337,
        role: "MEMBRO",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 4960,
        status: !0,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "fivecommunity",
        id: 242,
        role: "GERENTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 2,
        hours: 9600,
        status: !1,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 3,
        role: "LÍDER",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 1,
        hours: 9600,
        status: !0,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 4,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !1,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 5,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !0,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 6,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !1,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 7,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !0,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 8,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !1,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 11,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !1,
      },
      {
        icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        name: "IGOR",
        id: 9,
        role: "TESTE",
        lastLogin: "15/10/2024",
        joinedAt: "22/22/22",
        role_id: 3,
        hours: 9600,
        status: !1,
      },
    ]).then(m);
  }, []);
  const h = C.useMemo(
    () =>
      d.filter(
        (p) =>
          String(p.name).toLowerCase().includes(a.toLowerCase()) ||
          String(p.id).includes(a.toLowerCase())
      ),
    [a, d]
  );
  return i.jsxs("div", {
    className:
      "w-full h-full rounded-xl border-[.05rem] border-white/25 p-[1.875rem] flex flex-col gap-2.5",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
    },
    children: [
      i.jsxs("div", {
        className: "w-full flex justify-between",
        children: [
          i.jsx("h1", {
            className: "text-white text-base leading-[.75rem] font-extrabold",
            children: "MEMBROS",
          }),
          i.jsxs("div", {
            className: "flex items-center gap-2",
            children: [
              i.jsxs("div", {
                className:
                  "w-[16.875rem] h-8 flex items-center relative bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                children: [
                  i.jsxs("svg", {
                    className: "absolute left-[.9375rem]",
                    width: "16",
                    height: "16",
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: [
                      i.jsx("path", {
                        d: "M7.18016 12.1999C6.1873 12.1999 5.21673 11.9055 4.3912 11.3539C3.56566 10.8023 2.92224 10.0183 2.54228 9.10099C2.16233 8.1837 2.06292 7.17435 2.25662 6.20056C2.45031 5.22678 2.92842 4.3323 3.63048 3.63024C4.33254 2.92818 5.22702 2.45007 6.20081 2.25637C7.17459 2.06267 8.18394 2.16209 9.10123 2.54204C10.0185 2.92199 10.8025 3.56542 11.3541 4.39095C11.9057 5.21649 12.2002 6.18705 12.2002 7.17991C12.2002 7.83915 12.0703 8.49193 11.818 9.10099C11.5658 9.71004 11.196 10.2634 10.7298 10.7296C10.2637 11.1957 9.71028 11.5655 9.10123 11.8178C8.49218 12.0701 7.83939 12.1999 7.18016 12.1999ZM7.18016 3.16658C6.38903 3.16658 5.61567 3.40118 4.95788 3.8407C4.30008 4.28023 3.78739 4.90494 3.48464 5.63585C3.18189 6.36675 3.10268 7.17102 3.25702 7.94694C3.41136 8.72287 3.79232 9.4356 4.35173 9.99501C4.91114 10.5544 5.62387 10.9354 6.3998 11.0897C7.17572 11.2441 7.97999 11.1649 8.71089 10.8621C9.4418 10.5593 10.0665 10.0467 10.506 9.38886C10.9456 8.73107 11.1802 7.95771 11.1802 7.16658C11.1802 6.10572 10.7587 5.0883 10.0086 4.33815C9.25844 3.58801 8.24102 3.16658 7.18016 3.16658Z",
                        fill: "#CCCCCC",
                        "fill-opacity": "0.8",
                      }),
                      i.jsx("path", {
                        d: "M13.3336 13.8334C13.2679 13.8337 13.2028 13.8209 13.1422 13.7957C13.0815 13.7705 13.0265 13.7335 12.9803 13.6867L10.227 10.9334C10.1386 10.8386 10.0906 10.7132 10.0929 10.5837C10.0951 10.4542 10.1476 10.3306 10.2392 10.239C10.3308 10.1474 10.4544 10.0949 10.584 10.0926C10.7135 10.0903 10.8389 10.1384 10.9336 10.2267L13.687 12.9801C13.7806 13.0738 13.8332 13.2009 13.8332 13.3334C13.8332 13.4659 13.7806 13.593 13.687 13.6867C13.6408 13.7335 13.5858 13.7705 13.5251 13.7957C13.4644 13.8209 13.3993 13.8337 13.3336 13.8334Z",
                        fill: "#CCCCCC",
                        "fill-opacity": "0.8",
                      }),
                    ],
                  }),
                  i.jsx("input", {
                    type: "text",
                    onChange: (p) => c(p.target.value),
                    placeholder: "BUSCAR",
                    className:
                      "w-full h-full bg-transparent placeholder:text-[#D9D9D9]/80 text-white/90 text-[.6875rem] leading-[0.5rem] pl-[2.25rem] focus:outline-none ",
                  }),
                ],
              }),
              i.jsx(y7, {}),
            ],
          }),
        ],
      }),
      i.jsx("div", {}),
      i.jsx("div", {
        className: "w-full h-full flex flex-col gap-[.5625rem] overflow-y-auto",
        children: h.map((p) =>
          i.jsx(
            w7,
            {
              id: p.id,
              name: p.name,
              role: p.role,
              lastLogin: p.lastLogin,
              onPromote:
                l.promote &&
                (() => {
                  de("PromoteMember", { id: p.id }).then((y) => {
                    y &&
                      m((w) =>
                        w.map((E) =>
                          E.id === p.id
                            ? { ...E, role_id: y.role_id, role: y.role }
                            : E
                        )
                      );
                  });
                }),
              onDemote:
                l.demote &&
                (() => {
                  de("DemoteMember", { id: p.id }).then((y) => {
                    y &&
                      m((w) =>
                        w.map((E) =>
                          E.id === p.id
                            ? { ...E, role_id: y.role_id, role: y.role }
                            : E
                        )
                      );
                  });
                }),
              onRemove:
                !!(l.dismiss || p.id === s) &&
                (() => {
                  de("DimissMember", { id: p.id }, !0).then(() => {
                    m((y) => y.filter((w) => w.id !== p.id));
                  });
                }),
            },
            p.id
          )
        ),
      }),
    ],
  });
}
function Lo7() {
  const { setLogo: l } = Me(),
    s = C.useRef(null);
  function a() {
    var d;
    const c = (d = s.current) == null ? void 0 : d.value;
    de("SetConfig", { logo: c }).then(l);
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 flex-none bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs font-extrabold leading-[.5625rem]",
            children: "EDITAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_267_1791)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M30.1649 19.9093C29.8612 18.6969 28.1401 18.6969 27.8351 19.9093L27.7463 20.2668C27.6944 20.4745 27.5878 20.6646 27.4377 20.8173C27.2875 20.9699 27.0992 21.0796 26.8924 21.135C26.6855 21.1903 26.4676 21.1893 26.2613 21.132C26.0549 21.0748 25.8677 20.9633 25.719 20.8093L25.4627 20.5455C24.594 19.6468 23.1029 20.508 23.4466 21.7092L23.5466 22.0642C23.6053 22.2699 23.6081 22.4875 23.5544 22.6946C23.5008 22.9016 23.3928 23.0906 23.2417 23.2419C23.0905 23.3932 22.9016 23.5014 22.6946 23.5552C22.4875 23.609 22.2699 23.6064 22.0642 23.5478L21.7092 23.4466C20.5093 23.1029 19.6468 24.594 20.5455 25.4627L20.8093 25.719C20.9633 25.8677 21.0748 26.0549 21.132 26.2613C21.1893 26.4676 21.1903 26.6855 21.135 26.8924C21.0796 27.0992 20.9699 27.2875 20.8173 27.4377C20.6646 27.5878 20.4745 27.6944 20.2668 27.7463L19.9093 27.8351C18.6969 28.1388 18.6969 29.8599 19.9093 30.1649L20.2668 30.2537C20.4745 30.3056 20.6646 30.4122 20.8173 30.5623C20.9699 30.7125 21.0796 30.9008 21.135 31.1076C21.1903 31.3145 21.1893 31.5324 21.132 31.7387C21.0748 31.9451 20.9633 32.1323 20.8093 32.281L20.5455 32.5373C19.6468 33.406 20.508 34.8971 21.7092 34.5534L22.0642 34.4534C22.27 34.3945 22.4878 34.3918 22.695 34.4455C22.9022 34.4991 23.0913 34.6072 23.2427 34.7586C23.394 34.9099 23.5021 35.099 23.5558 35.3063C23.6095 35.5135 23.6067 35.7313 23.5478 35.9371L23.4466 36.2908C23.1029 37.4907 24.594 38.3532 25.4627 37.4545L25.719 37.1907C25.8677 37.0367 26.0549 36.9252 26.2613 36.868C26.4676 36.8107 26.6855 36.8097 26.8924 36.865C27.0992 36.9204 27.2875 37.0301 27.4377 37.1827C27.5878 37.3354 27.6944 37.5255 27.7463 37.7332L27.8351 38.0907C28.1388 39.3031 29.8599 39.3031 30.1649 38.0907L30.2537 37.7332C30.3056 37.5255 30.4122 37.3354 30.5623 37.1827C30.7125 37.0301 30.9008 36.9204 31.1076 36.865C31.3145 36.8097 31.5324 36.8107 31.7387 36.868C31.9451 36.9252 32.1323 37.0367 32.281 37.1907L32.5373 37.4545C33.406 38.3532 34.8971 37.492 34.5534 36.2908L34.4534 35.9358C34.3945 35.73 34.3918 35.5122 34.4455 35.305C34.4991 35.0978 34.6072 34.9087 34.7586 34.7573C34.9099 34.606 35.099 34.4979 35.3063 34.4442C35.5135 34.3905 35.7313 34.3933 35.9371 34.4522L36.2908 34.5534C37.4907 34.8971 38.3532 33.406 37.4545 32.5373L37.1907 32.281C37.0367 32.1323 36.9252 31.9451 36.868 31.7387C36.8107 31.5324 36.8097 31.3145 36.865 31.1076C36.9204 30.9008 37.0301 30.7125 37.1827 30.5623C37.3354 30.4122 37.5255 30.3056 37.7332 30.2537L38.0907 30.1649C39.3031 29.8612 39.3031 28.1401 38.0907 27.8351L37.7332 27.7463C37.5255 27.6944 37.3354 27.5878 37.1827 27.4377C37.0301 27.2875 36.9204 27.0992 36.865 26.8924C36.8097 26.6855 36.8107 26.4676 36.868 26.2613C36.9252 26.0549 37.0367 25.8677 37.1907 25.719L37.4545 25.4627C38.3532 24.594 37.492 23.1029 36.2908 23.4466L35.9358 23.5466C35.7301 23.6053 35.5125 23.6081 35.3054 23.5544C35.0984 23.5008 34.9094 23.3928 34.7581 23.2417C34.6068 23.0905 34.4986 22.9016 34.4448 22.6946C34.391 22.4875 34.3936 22.2699 34.4522 22.0642L34.5534 21.7092C34.8971 20.5093 33.406 19.6468 32.5373 20.5455L32.281 20.8093C32.1323 20.9633 31.9451 21.0748 31.7387 21.132C31.5324 21.1893 31.3145 21.1903 31.1076 21.135C30.9008 21.0796 30.7125 20.9699 30.5623 20.8173C30.4122 20.6646 30.3056 20.4745 30.2537 20.2668L30.1649 19.9093ZM29 35.2459C28.1723 35.2576 27.3505 35.1046 26.5823 34.796C25.8142 34.4873 25.1151 34.0291 24.5256 33.4479C23.9361 32.8667 23.468 32.1741 23.1486 31.4104C22.8291 30.6468 22.6645 29.8272 22.6645 28.9994C22.6645 28.1716 22.8291 27.352 23.1486 26.5883C23.468 25.8246 23.9361 25.1321 24.5256 24.5509C25.1151 23.9697 25.8142 23.5114 26.5823 23.2028C27.3505 22.8941 28.1723 22.7412 29 22.7529C30.6568 22.7529 32.2458 23.4111 33.4174 24.5826C34.5889 25.7542 35.2471 27.3432 35.2471 29C35.2471 30.6568 34.5889 32.2458 33.4174 33.4174C32.2458 34.5889 30.6568 35.2471 29 35.2471V35.2459Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_267_1791",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "EDITAR LINK DO LOGO",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: s,
                type: "text",
                placeholder: "Link do logo",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: a,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "EDITAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function E7() {
  const { setDiscord: l } = Me(),
    s = C.useRef(null);
  function a() {
    var d;
    const c = (d = s.current) == null ? void 0 : d.value;
    de("SetConfig", { discord: c }).then(l);
  }
    return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 flex-none bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs font-extrabold leading-[.5625rem]",
            children: "EDITAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_267_1791)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M30.1649 19.9093C29.8612 18.6969 28.1401 18.6969 27.8351 19.9093L27.7463 20.2668C27.6944 20.4745 27.5878 20.6646 27.4377 20.8173C27.2875 20.9699 27.0992 21.0796 26.8924 21.135C26.6855 21.1903 26.4676 21.1893 26.2613 21.132C26.0549 21.0748 25.8677 20.9633 25.719 20.8093L25.4627 20.5455C24.594 19.6468 23.1029 20.508 23.4466 21.7092L23.5466 22.0642C23.6053 22.2699 23.6081 22.4875 23.5544 22.6946C23.5008 22.9016 23.3928 23.0906 23.2417 23.2419C23.0905 23.3932 22.9016 23.5014 22.6946 23.5552C22.4875 23.609 22.2699 23.6064 22.0642 23.5478L21.7092 23.4466C20.5093 23.1029 19.6468 24.594 20.5455 25.4627L20.8093 25.719C20.9633 25.8677 21.0748 26.0549 21.132 26.2613C21.1893 26.4676 21.1903 26.6855 21.135 26.8924C21.0796 27.0992 20.9699 27.2875 20.8173 27.4377C20.6646 27.5878 20.4745 27.6944 20.2668 27.7463L19.9093 27.8351C18.6969 28.1388 18.6969 29.8599 19.9093 30.1649L20.2668 30.2537C20.4745 30.3056 20.6646 30.4122 20.8173 30.5623C20.9699 30.7125 21.0796 30.9008 21.135 31.1076C21.1903 31.3145 21.1893 31.5324 21.132 31.7387C21.0748 31.9451 20.9633 32.1323 20.8093 32.281L20.5455 32.5373C19.6468 33.406 20.508 34.8971 21.7092 34.5534L22.0642 34.4534C22.27 34.3945 22.4878 34.3918 22.695 34.4455C22.9022 34.4991 23.0913 34.6072 23.2427 34.7586C23.394 34.9099 23.5021 35.099 23.5558 35.3063C23.6095 35.5135 23.6067 35.7313 23.5478 35.9371L23.4466 36.2908C23.1029 37.4907 24.594 38.3532 25.4627 37.4545L25.719 37.1907C25.8677 37.0367 26.0549 36.9252 26.2613 36.868C26.4676 36.8107 26.6855 36.8097 26.8924 36.865C27.0992 36.9204 27.2875 37.0301 27.4377 37.1827C27.5878 37.3354 27.6944 37.5255 27.7463 37.7332L27.8351 38.0907C28.1388 39.3031 29.8599 39.3031 30.1649 38.0907L30.2537 37.7332C30.3056 37.5255 30.4122 37.3354 30.5623 37.1827C30.7125 37.0301 30.9008 36.9204 31.1076 36.865C31.3145 36.8097 31.5324 36.8107 31.7387 36.868C31.9451 36.9252 32.1323 37.0367 32.281 37.1907L32.5373 37.4545C33.406 38.3532 34.8971 37.492 34.5534 36.2908L34.4534 35.9358C34.3945 35.73 34.3918 35.5122 34.4455 35.305C34.4991 35.0978 34.6072 34.9087 34.7586 34.7573C34.9099 34.606 35.099 34.4979 35.3063 34.4442C35.5135 34.3905 35.7313 34.3933 35.9371 34.4522L36.2908 34.5534C37.4907 34.8971 38.3532 33.406 37.4545 32.5373L37.1907 32.281C37.0367 32.1323 36.9252 31.9451 36.868 31.7387C36.8107 31.5324 36.8097 31.3145 36.865 31.1076C36.9204 30.9008 37.0301 30.7125 37.1827 30.5623C37.3354 30.4122 37.5255 30.3056 37.7332 30.2537L38.0907 30.1649C39.3031 29.8612 39.3031 28.1401 38.0907 27.8351L37.7332 27.7463C37.5255 27.6944 37.3354 27.5878 37.1827 27.4377C37.0301 27.2875 36.9204 27.0992 36.865 26.8924C36.8097 26.6855 36.8107 26.4676 36.868 26.2613C36.9252 26.0549 37.0367 25.8677 37.1907 25.719L37.4545 25.4627C38.3532 24.594 37.492 23.1029 36.2908 23.4466L35.9358 23.5466C35.7301 23.6053 35.5125 23.6081 35.3054 23.5544C35.0984 23.5008 34.9094 23.3928 34.7581 23.2417C34.6068 23.0905 34.4986 22.9016 34.4448 22.6946C34.391 22.4875 34.3936 22.2699 34.4522 22.0642L34.5534 21.7092C34.8971 20.5093 33.406 19.6468 32.5373 20.5455L32.281 20.8093C32.1323 20.9633 31.9451 21.0748 31.7387 21.132C31.5324 21.1893 31.3145 21.1903 31.1076 21.135C30.9008 21.0796 30.7125 20.9699 30.5623 20.8173C30.4122 20.6646 30.3056 20.4745 30.2537 20.2668L30.1649 19.9093ZM29 35.2459C28.1723 35.2576 27.3505 35.1046 26.5823 34.796C25.8142 34.4873 25.1151 34.0291 24.5256 33.4479C23.9361 32.8667 23.468 32.1741 23.1486 31.4104C22.8291 30.6468 22.6645 29.8272 22.6645 28.9994C22.6645 28.1716 22.8291 27.352 23.1486 26.5883C23.468 25.8246 23.9361 25.1321 24.5256 24.5509C25.1151 23.9697 25.8142 23.5114 26.5823 23.2028C27.3505 22.8941 28.1723 22.7412 29 22.7529C30.6568 22.7529 32.2458 23.4111 33.4174 24.5826C34.5889 25.7542 35.2471 27.3432 35.2471 29C35.2471 30.6568 34.5889 32.2458 33.4174 33.4174C32.2458 34.5889 30.6568 35.2471 29 35.2471V35.2459Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_267_1791",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "EDITAR LINK DO DISCORD",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: s,
                type: "text",
                placeholder: "Link do discord",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: a,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "EDITAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function L7() {
  const { setPreset: l } = Me(),
    s = C.useRef(null),
    a = C.useRef(null);
  function c() {
    var d, m;
    de("SetPreset", {
      male: (d = s.current) == null ? void 0 : d.value,
      female: (m = a.current) == null ? void 0 : m.value,
    }).then((h) => l({ male: h.male, female: h.female }));
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 flex-none bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs font-extrabold leading-[.5625rem]",
            children: "EDITAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_267_1791)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M30.1649 19.9093C29.8612 18.6969 28.1401 18.6969 27.8351 19.9093L27.7463 20.2668C27.6944 20.4745 27.5878 20.6646 27.4377 20.8173C27.2875 20.9699 27.0992 21.0796 26.8924 21.135C26.6855 21.1903 26.4676 21.1893 26.2613 21.132C26.0549 21.0748 25.8677 20.9633 25.719 20.8093L25.4627 20.5455C24.594 19.6468 23.1029 20.508 23.4466 21.7092L23.5466 22.0642C23.6053 22.2699 23.6081 22.4875 23.5544 22.6946C23.5008 22.9016 23.3928 23.0906 23.2417 23.2419C23.0905 23.3932 22.9016 23.5014 22.6946 23.5552C22.4875 23.609 22.2699 23.6064 22.0642 23.5478L21.7092 23.4466C20.5093 23.1029 19.6468 24.594 20.5455 25.4627L20.8093 25.719C20.9633 25.8677 21.0748 26.0549 21.132 26.2613C21.1893 26.4676 21.1903 26.6855 21.135 26.8924C21.0796 27.0992 20.9699 27.2875 20.8173 27.4377C20.6646 27.5878 20.4745 27.6944 20.2668 27.7463L19.9093 27.8351C18.6969 28.1388 18.6969 29.8599 19.9093 30.1649L20.2668 30.2537C20.4745 30.3056 20.6646 30.4122 20.8173 30.5623C20.9699 30.7125 21.0796 30.9008 21.135 31.1076C21.1903 31.3145 21.1893 31.5324 21.132 31.7387C21.0748 31.9451 20.9633 32.1323 20.8093 32.281L20.5455 32.5373C19.6468 33.406 20.508 34.8971 21.7092 34.5534L22.0642 34.4534C22.27 34.3945 22.4878 34.3918 22.695 34.4455C22.9022 34.4991 23.0913 34.6072 23.2427 34.7586C23.394 34.9099 23.5021 35.099 23.5558 35.3063C23.6095 35.5135 23.6067 35.7313 23.5478 35.9371L23.4466 36.2908C23.1029 37.4907 24.594 38.3532 25.4627 37.4545L25.719 37.1907C25.8677 37.0367 26.0549 36.9252 26.2613 36.868C26.4676 36.8107 26.6855 36.8097 26.8924 36.865C27.0992 36.9204 27.2875 37.0301 27.4377 37.1827C27.5878 37.3354 27.6944 37.5255 27.7463 37.7332L27.8351 38.0907C28.1388 39.3031 29.8599 39.3031 30.1649 38.0907L30.2537 37.7332C30.3056 37.5255 30.4122 37.3354 30.5623 37.1827C30.7125 37.0301 30.9008 36.9204 31.1076 36.865C31.3145 36.8097 31.5324 36.8107 31.7387 36.868C31.9451 36.9252 32.1323 37.0367 32.281 37.1907L32.5373 37.4545C33.406 38.3532 34.8971 37.492 34.5534 36.2908L34.4534 35.9358C34.3945 35.73 34.3918 35.5122 34.4455 35.305C34.4991 35.0978 34.6072 34.9087 34.7586 34.7573C34.9099 34.606 35.099 34.4979 35.3063 34.4442C35.5135 34.3905 35.7313 34.3933 35.9371 34.4522L36.2908 34.5534C37.4907 34.8971 38.3532 33.406 37.4545 32.5373L37.1907 32.281C37.0367 32.1323 36.9252 31.9451 36.868 31.7387C36.8107 31.5324 36.8097 31.3145 36.865 31.1076C36.9204 30.9008 37.0301 30.7125 37.1827 30.5623C37.3354 30.4122 37.5255 30.3056 37.7332 30.2537L38.0907 30.1649C39.3031 29.8612 39.3031 28.1401 38.0907 27.8351L37.7332 27.7463C37.5255 27.6944 37.3354 27.5878 37.1827 27.4377C37.0301 27.2875 36.9204 27.0992 36.865 26.8924C36.8097 26.6855 36.8107 26.4676 36.868 26.2613C36.9252 26.0549 37.0367 25.8677 37.1907 25.719L37.4545 25.4627C38.3532 24.594 37.492 23.1029 36.2908 23.4466L35.9358 23.5466C35.7301 23.6053 35.5125 23.6081 35.3054 23.5544C35.0984 23.5008 34.9094 23.3928 34.7581 23.2417C34.6068 23.0905 34.4986 22.9016 34.4448 22.6946C34.391 22.4875 34.3936 22.2699 34.4522 22.0642L34.5534 21.7092C34.8971 20.5093 33.406 19.6468 32.5373 20.5455L32.281 20.8093C32.1323 20.9633 31.9451 21.0748 31.7387 21.132C31.5324 21.1893 31.3145 21.1903 31.1076 21.135C30.9008 21.0796 30.7125 20.9699 30.5623 20.8173C30.4122 20.6646 30.3056 20.4745 30.2537 20.2668L30.1649 19.9093ZM29 35.2459C28.1723 35.2576 27.3505 35.1046 26.5823 34.796C25.8142 34.4873 25.1151 34.0291 24.5256 33.4479C23.9361 32.8667 23.468 32.1741 23.1486 31.4104C22.8291 30.6468 22.6645 29.8272 22.6645 28.9994C22.6645 28.1716 22.8291 27.352 23.1486 26.5883C23.468 25.8246 23.9361 25.1321 24.5256 24.5509C25.1151 23.9697 25.8142 23.5114 26.5823 23.2028C27.3505 22.8941 28.1723 22.7412 29 22.7529C30.6568 22.7529 32.2458 23.4111 33.4174 24.5826C34.5889 25.7542 35.2471 27.3432 35.2471 29C35.2471 30.6568 34.5889 32.2458 33.4174 33.4174C32.2458 34.5889 30.6568 35.2471 29 35.2471V35.2459Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_267_1791",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "EDITAR PRESETS",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: s,
                type: "text",
                placeholder: "Preset masculino",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsx("input", {
                ref: a,
                type: "text",
                placeholder: "Preset feminino",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: c,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "SALVAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function S7() {
  const { setRadio: l } = Me(),
    s = C.useRef(null);
  function a() {
    var c;
    de("SetRadio", {
      frequency: Number((c = s.current) == null ? void 0 : c.value),
    }).then(l);
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 flex-none bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs font-extrabold leading-[.5625rem]",
            children: "EDITAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_267_1791)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M30.1649 19.9093C29.8612 18.6969 28.1401 18.6969 27.8351 19.9093L27.7463 20.2668C27.6944 20.4745 27.5878 20.6646 27.4377 20.8173C27.2875 20.9699 27.0992 21.0796 26.8924 21.135C26.6855 21.1903 26.4676 21.1893 26.2613 21.132C26.0549 21.0748 25.8677 20.9633 25.719 20.8093L25.4627 20.5455C24.594 19.6468 23.1029 20.508 23.4466 21.7092L23.5466 22.0642C23.6053 22.2699 23.6081 22.4875 23.5544 22.6946C23.5008 22.9016 23.3928 23.0906 23.2417 23.2419C23.0905 23.3932 22.9016 23.5014 22.6946 23.5552C22.4875 23.609 22.2699 23.6064 22.0642 23.5478L21.7092 23.4466C20.5093 23.1029 19.6468 24.594 20.5455 25.4627L20.8093 25.719C20.9633 25.8677 21.0748 26.0549 21.132 26.2613C21.1893 26.4676 21.1903 26.6855 21.135 26.8924C21.0796 27.0992 20.9699 27.2875 20.8173 27.4377C20.6646 27.5878 20.4745 27.6944 20.2668 27.7463L19.9093 27.8351C18.6969 28.1388 18.6969 29.8599 19.9093 30.1649L20.2668 30.2537C20.4745 30.3056 20.6646 30.4122 20.8173 30.5623C20.9699 30.7125 21.0796 30.9008 21.135 31.1076C21.1903 31.3145 21.1893 31.5324 21.132 31.7387C21.0748 31.9451 20.9633 32.1323 20.8093 32.281L20.5455 32.5373C19.6468 33.406 20.508 34.8971 21.7092 34.5534L22.0642 34.4534C22.27 34.3945 22.4878 34.3918 22.695 34.4455C22.9022 34.4991 23.0913 34.6072 23.2427 34.7586C23.394 34.9099 23.5021 35.099 23.5558 35.3063C23.6095 35.5135 23.6067 35.7313 23.5478 35.9371L23.4466 36.2908C23.1029 37.4907 24.594 38.3532 25.4627 37.4545L25.719 37.1907C25.8677 37.0367 26.0549 36.9252 26.2613 36.868C26.4676 36.8107 26.6855 36.8097 26.8924 36.865C27.0992 36.9204 27.2875 37.0301 27.4377 37.1827C27.5878 37.3354 27.6944 37.5255 27.7463 37.7332L27.8351 38.0907C28.1388 39.3031 29.8599 39.3031 30.1649 38.0907L30.2537 37.7332C30.3056 37.5255 30.4122 37.3354 30.5623 37.1827C30.7125 37.0301 30.9008 36.9204 31.1076 36.865C31.3145 36.8097 31.5324 36.8107 31.7387 36.868C31.9451 36.9252 32.1323 37.0367 32.281 37.1907L32.5373 37.4545C33.406 38.3532 34.8971 37.492 34.5534 36.2908L34.4534 35.9358C34.3945 35.73 34.3918 35.5122 34.4455 35.305C34.4991 35.0978 34.6072 34.9087 34.7586 34.7573C34.9099 34.606 35.099 34.4979 35.3063 34.4442C35.5135 34.3905 35.7313 34.3933 35.9371 34.4522L36.2908 34.5534C37.4907 34.8971 38.3532 33.406 37.4545 32.5373L37.1907 32.281C37.0367 32.1323 36.9252 31.9451 36.868 31.7387C36.8107 31.5324 36.8097 31.3145 36.865 31.1076C36.9204 30.9008 37.0301 30.7125 37.1827 30.5623C37.3354 30.4122 37.5255 30.3056 37.7332 30.2537L38.0907 30.1649C39.3031 29.8612 39.3031 28.1401 38.0907 27.8351L37.7332 27.7463C37.5255 27.6944 37.3354 27.5878 37.1827 27.4377C37.0301 27.2875 36.9204 27.0992 36.865 26.8924C36.8097 26.6855 36.8107 26.4676 36.868 26.2613C36.9252 26.0549 37.0367 25.8677 37.1907 25.719L37.4545 25.4627C38.3532 24.594 37.492 23.1029 36.2908 23.4466L35.9358 23.5466C35.7301 23.6053 35.5125 23.6081 35.3054 23.5544C35.0984 23.5008 34.9094 23.3928 34.7581 23.2417C34.6068 23.0905 34.4986 22.9016 34.4448 22.6946C34.391 22.4875 34.3936 22.2699 34.4522 22.0642L34.5534 21.7092C34.8971 20.5093 33.406 19.6468 32.5373 20.5455L32.281 20.8093C32.1323 20.9633 31.9451 21.0748 31.7387 21.132C31.5324 21.1893 31.3145 21.1903 31.1076 21.135C30.9008 21.0796 30.7125 20.9699 30.5623 20.8173C30.4122 20.6646 30.3056 20.4745 30.2537 20.2668L30.1649 19.9093ZM29 35.2459C28.1723 35.2576 27.3505 35.1046 26.5823 34.796C25.8142 34.4873 25.1151 34.0291 24.5256 33.4479C23.9361 32.8667 23.468 32.1741 23.1486 31.4104C22.8291 30.6468 22.6645 29.8272 22.6645 28.9994C22.6645 28.1716 22.8291 27.352 23.1486 26.5883C23.468 25.8246 23.9361 25.1321 24.5256 24.5509C25.1151 23.9697 25.8142 23.5114 26.5823 23.2028C27.3505 22.8941 28.1723 22.7412 29 22.7529C30.6568 22.7529 32.2458 23.4111 33.4174 24.5826C34.5889 25.7542 35.2471 27.3432 35.2471 29C35.2471 30.6568 34.5889 32.2458 33.4174 33.4174C32.2458 34.5889 30.6568 35.2471 29 35.2471V35.2459Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_267_1791",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "EDITAR RÁDIO",
              }),
              i.jsx(p1, {}),
              i.jsx("input", {
                ref: s,
                type: "number",
                placeholder: "Rádio",
                className:
                  "w-full h-[2.5625rem] bg-white/[0.03] border-[.05rem] border-white/30 focus:outline-none pl-[.9375rem] flex items-center justify-center rounded-[.6875rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: a,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "EDITAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
const A0 = {
  invite: { name: "Convidar", status: !1 },
  demote: { name: "Rebaixar", status: !0 },
  promote: { name: "Promover", status: !1 },
  dismiss: { name: "Demitir", status: !1 },
  withdraw: { name: "Sacar dinheiro", status: !1 },
  deposit: { name: "Depositar dinheiro", status: !1 },
  message: { name: "Escrever anotações", status: !1 },
  alerts: { name: "Escrever Alertas", status: !0 },
  chat: { name: "Escrever no chat", status: !1 },
};
function N7({ roleEdit: l }) {
  const { setDiscord: s } = Me(),
    [a, c] = C.useState({});
  C.useRef(null),
    C.useEffect(() => {
      de("GetPermissions", { roleEdit: l }, A0).then(c);
    }, []);
  function d(h) {
    c((p) => ({ ...p, [h]: { ...p[h], status: !p[h].status } }));
  }
  function m() {
    de("SetPermissions", { role: l, permissions: a });
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-[1.875rem] rounded-[.5625rem] border-[.8px] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 text-[.6875rem] leading-[.5rem] font-extrabold",
          children: "EDITAR PERMISSÕES",
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_267_1791)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M30.1649 19.9093C29.8612 18.6969 28.1401 18.6969 27.8351 19.9093L27.7463 20.2668C27.6944 20.4745 27.5878 20.6646 27.4377 20.8173C27.2875 20.9699 27.0992 21.0796 26.8924 21.135C26.6855 21.1903 26.4676 21.1893 26.2613 21.132C26.0549 21.0748 25.8677 20.9633 25.719 20.8093L25.4627 20.5455C24.594 19.6468 23.1029 20.508 23.4466 21.7092L23.5466 22.0642C23.6053 22.2699 23.6081 22.4875 23.5544 22.6946C23.5008 22.9016 23.3928 23.0906 23.2417 23.2419C23.0905 23.3932 22.9016 23.5014 22.6946 23.5552C22.4875 23.609 22.2699 23.6064 22.0642 23.5478L21.7092 23.4466C20.5093 23.1029 19.6468 24.594 20.5455 25.4627L20.8093 25.719C20.9633 25.8677 21.0748 26.0549 21.132 26.2613C21.1893 26.4676 21.1903 26.6855 21.135 26.8924C21.0796 27.0992 20.9699 27.2875 20.8173 27.4377C20.6646 27.5878 20.4745 27.6944 20.2668 27.7463L19.9093 27.8351C18.6969 28.1388 18.6969 29.8599 19.9093 30.1649L20.2668 30.2537C20.4745 30.3056 20.6646 30.4122 20.8173 30.5623C20.9699 30.7125 21.0796 30.9008 21.135 31.1076C21.1903 31.3145 21.1893 31.5324 21.132 31.7387C21.0748 31.9451 20.9633 32.1323 20.8093 32.281L20.5455 32.5373C19.6468 33.406 20.508 34.8971 21.7092 34.5534L22.0642 34.4534C22.27 34.3945 22.4878 34.3918 22.695 34.4455C22.9022 34.4991 23.0913 34.6072 23.2427 34.7586C23.394 34.9099 23.5021 35.099 23.5558 35.3063C23.6095 35.5135 23.6067 35.7313 23.5478 35.9371L23.4466 36.2908C23.1029 37.4907 24.594 38.3532 25.4627 37.4545L25.719 37.1907C25.8677 37.0367 26.0549 36.9252 26.2613 36.868C26.4676 36.8107 26.6855 36.8097 26.8924 36.865C27.0992 36.9204 27.2875 37.0301 27.4377 37.1827C27.5878 37.3354 27.6944 37.5255 27.7463 37.7332L27.8351 38.0907C28.1388 39.3031 29.8599 39.3031 30.1649 38.0907L30.2537 37.7332C30.3056 37.5255 30.4122 37.3354 30.5623 37.1827C30.7125 37.0301 30.9008 36.9204 31.1076 36.865C31.3145 36.8097 31.5324 36.8107 31.7387 36.868C31.9451 36.9252 32.1323 37.0367 32.281 37.1907L32.5373 37.4545C33.406 38.3532 34.8971 37.492 34.5534 36.2908L34.4534 35.9358C34.3945 35.73 34.3918 35.5122 34.4455 35.305C34.4991 35.0978 34.6072 34.9087 34.7586 34.7573C34.9099 34.606 35.099 34.4979 35.3063 34.4442C35.5135 34.3905 35.7313 34.3933 35.9371 34.4522L36.2908 34.5534C37.4907 34.8971 38.3532 33.406 37.4545 32.5373L37.1907 32.281C37.0367 32.1323 36.9252 31.9451 36.868 31.7387C36.8107 31.5324 36.8097 31.3145 36.865 31.1076C36.9204 30.9008 37.0301 30.7125 37.1827 30.5623C37.3354 30.4122 37.5255 30.3056 37.7332 30.2537L38.0907 30.1649C39.3031 29.8612 39.3031 28.1401 38.0907 27.8351L37.7332 27.7463C37.5255 27.6944 37.3354 27.5878 37.1827 27.4377C37.0301 27.2875 36.9204 27.0992 36.865 26.8924C36.8097 26.6855 36.8107 26.4676 36.868 26.2613C36.9252 26.0549 37.0367 25.8677 37.1907 25.719L37.4545 25.4627C38.3532 24.594 37.492 23.1029 36.2908 23.4466L35.9358 23.5466C35.7301 23.6053 35.5125 23.6081 35.3054 23.5544C35.0984 23.5008 34.9094 23.3928 34.7581 23.2417C34.6068 23.0905 34.4986 22.9016 34.4448 22.6946C34.391 22.4875 34.3936 22.2699 34.4522 22.0642L34.5534 21.7092C34.8971 20.5093 33.406 19.6468 32.5373 20.5455L32.281 20.8093C32.1323 20.9633 31.9451 21.0748 31.7387 21.132C31.5324 21.1893 31.3145 21.1903 31.1076 21.135C30.9008 21.0796 30.7125 20.9699 30.5623 20.8173C30.4122 20.6646 30.3056 20.4745 30.2537 20.2668L30.1649 19.9093ZM29 35.2459C28.1723 35.2576 27.3505 35.1046 26.5823 34.796C25.8142 34.4873 25.1151 34.0291 24.5256 33.4479C23.9361 32.8667 23.468 32.1741 23.1486 31.4104C22.8291 30.6468 22.6645 29.8272 22.6645 28.9994C22.6645 28.1716 22.8291 27.352 23.1486 26.5883C23.468 25.8246 23.9361 25.1321 24.5256 24.5509C25.1151 23.9697 25.8142 23.5114 26.5823 23.2028C27.3505 22.8941 28.1723 22.7412 29 22.7529C30.6568 22.7529 32.2458 23.4111 33.4174 24.5826C34.5889 25.7542 35.2471 27.3432 35.2471 29C35.2471 30.6568 34.5889 32.2458 33.4174 33.4174C32.2458 34.5889 30.6568 35.2471 29 35.2471V35.2459Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_267_1791",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "EDITAR PERMISSÃO",
              }),
              i.jsx(p1, {
                children: i.jsx("span", {
                  className:
                    "mx-auto w-fit px-[.9375rem] h-5 flex items-center justify-center rounded-md border border-[#DDD]/20 bg-[#DDD]/30 text-[#DDD] text-[.625rem] leading-[.4375rem] font-bold uppercase",
                  children: l,
                }),
              }),
              i.jsx("div", {
                className:
                  "w-full h-px bg-gradient-to-r from-[#D9D9D9]/0 via-[#D9D9D9]/10 to-[#D9D9D9]/0",
              }),
              i.jsx("div", {
                className: "flex flex-col gap-[.8125rem]",
                children: Object.keys(a).map((h) =>
                  i.jsxs(
                    "div",
                    {
                      className: "flex items-center gap-4",
                      children: [
                        i.jsx("div", {
                          onClick: () => d(h),
                          className: ie(
                            "w-10 h-[1.3125rem] flex-none relative rounded-lg border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                            a[h].status &&
                              "!bg-primary !border-transparent [box-shadow:0px_0px_4px_0px_rgba(0,0,0,0.10),_0px_0px_14px_0px_rgba(185,220,30,0.45)]"
                          ),
                          children: i.jsx("div", {
                            className: ie(
                              "absolute top-1/2 -translate-y-1/2 left-[.1875rem] rounded-[.3125rem] bg-[#DDDDDD]/40 size-[.9375rem] duration-300",
                              a[h].status && "!left-[1.375rem] !bg-[#1E1E1E]"
                            ),
                          }),
                        }),
                        i.jsx("span", {
                          className:
                            "text-[#DDD] text-xs leading-[.5625rem] font-extrabold uppercase",
                          children: A0[h].name,
                        }),
                      ],
                    },
                    h
                  )
                ),
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: m,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "SALVAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function b7() {
  const { roles: l, discord: s, radio: a, logo: b } = Me();
  return i.jsxs("div", {
    className: "w-full h-full overflow-hidden flex flex-col gap-2.5",
    children: [
      i.jsxs("div", {
        className:
          "w-full h-[21.0625rem] border-[.05rem] border-white/25 rounded-xl overflow-hidden px-[1.875rem] pt-[1.875rem] flex flex-col",
        style: {
          background:
            "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
        },
        children: [
          i.jsx("span", {
            className:
              "text-white flex-none text-base leading-[.75rem] font-extrabold",
            children: "PERMISSÕES",
          }),
          i.jsxs("div", {
            className: "w-full flex-none mt-5 mb-[.8125rem]",
            children: [
              i.jsx("span", {
                className:
                  "ml-5 text-white/60 font-semibold text-[.6875rem] leading-[.05rem]",
                children: "#",
              }),
              i.jsx("span", {
                className:
                  "ml-[17.5625rem] text-white/60 font-semibold text-[.6875rem] leading-[.05rem]",
                children: "CARGO",
              }),
              i.jsx("span", {
                className:
                  "ml-[19rem] text-white/60 font-semibold text-[.6875rem] leading-[.05rem]",
                children: "MEMBROS",
              }),
              i.jsx("span", {
                className:
                  "ml-[19.125rem] text-white/60 font-semibold text-[.6875rem] leading-[.05rem]",
                children: "PERMISSÕES",
              }),
            ],
          }),
          i.jsx("div", {
            className: "w-full h-full flex flex-col gap-2 overflow-y-auto",
            children: l
              .sort((c, d) => c.nivel - d.nivel)
              .map((c, d) =>
                i.jsxs("div", {
                  className:
                    "w-full h-[2.875rem] flex-none pl-5 pr-2 flex items-center justify-between rounded-xl border-[.05rem] border-white/25",
                  style: {
                    background:
                      "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                  },
                  children: [
                    i.jsx("span", {
                      className:
                        "w-[1.875rem] text-white text-xs leading-[.5625rem]",
                      children: d,
                    }),
                    i.jsx("span", {
                      className:
                        "w-[9.375rem] text-white text-xs text-center leading-[.5625rem]",
                      children: c.prefix,
                    }),
                    i.jsx("span", {
                      className:
                        "w-[9.375rem] text-white text-xs text-center leading-[.5625rem]",
                      children: c.members,
                    }),
                    i.jsx(N7, { roleEdit: c.group }),
                  ],
                })
              ),
          }),
        ],
      }),
      i.jsxs("div", {
        className:
          "w-full h-[21.0625rem] overflow-hidden border-[.05rem] border-white/25 rounded-xl px-[1.875rem] pt-[1.875rem] flex flex-col gap-5",
        style: {
          background:
            "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
        },
        children: [
          i.jsx("span", {
            className: "text-white text-base leading-[.75rem] font-extrabold",
            children: "AJUSTES",
          }),
          i.jsxs("div", {
            className: "w-full h-full overflow-y-auto flex flex-col gap-2.5",
            children: [
              i.jsxs("div", {
                className:
                  "w-full h-[3.75rem] flex items-center justify-between pl-5 pr-3.5 rounded-xl border-[0.05rem] border-white/25",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsx("span", {
                    className:
                      "text-white text-sm font-extrabold leading-[.625rem]",
                    children: "LOGO",
                  }),
                  i.jsxs("div", {
                    className: "flex items-center gap-3.5",
                    children: [
                      i.jsx(Lo7, {}),
                    ],
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "w-full h-[3.75rem] flex items-center justify-between pl-5 pr-3.5 rounded-xl border-[0.05rem] border-white/25",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsx("span", {
                    className:
                      "text-white text-sm font-extrabold leading-[.625rem]",
                    children: "DISCORD",
                  }),
                  i.jsxs("div", {
                    className: "flex items-center gap-3.5",
                    children: [
                      i.jsx("div", {
                        className:
                          "h-8 px-2.5 flex items-center justify-center rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 text-xs leading-[.5625rem] font-bold",
                        children: s,
                      }),
                      i.jsx(E7, {}),
                    ],
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "w-full h-[3.75rem] flex items-center justify-between pl-5 pr-3.5 rounded-xl border-[0.05rem] border-white/25",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsx("span", {
                    className:
                      "text-white text-sm font-extrabold leading-[.625rem]",
                    children: "RÁDIO",
                  }),
                  i.jsxs("div", {
                    className: "flex items-center gap-3.5",
                    children: [
                      i.jsxs("div", {
                        className:
                          "h-8 px-2.5 flex items-center justify-center rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/15 text-[#D9D9D9]/80 text-xs leading-[.5625rem] font-bold",
                        children: [a, " MHz"],
                      }),
                      i.jsx(S7, {}),
                    ],
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "w-full h-[3.75rem] flex items-center justify-between pl-5 pr-3.5 rounded-xl border-[0.05rem] border-white/25",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsx("span", {
                    className:
                      "text-white text-sm font-extrabold leading-[.625rem] flex-none",
                    children: "PRESET DE ROUPA",
                  }),
                  i.jsx("div", {
                    className: "flex items-center gap-3.5",
                    children: i.jsx(L7, {}),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function k7() {
  const { setPartners: l } = Me(),
    [s, a] = C.useState(""),
    [c, d] = C.useState(5),
    [m, h] = C.useState(""),
    [p, y] = C.useState(""),
    [w, E] = C.useState(""),
    g = Array.from({ length: 5 }, (P, S) => S + 1);
  function b() {
    de(
      "NewPartner",
      { cds: s, note: c, name: m, keyword: p, description: w, icon: "" },
      []
    ).then((P) => {
      l(P);
    });
  }
  function R() {
    de("GetCDS", {}, "asdadasd").then((res) => a(res));
  }
  return i.jsxs(a1, {
    children: [
      i.jsx(u1, {
        children: i.jsx("button", {
          className:
            "w-[11.25rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
          style: {
            boxShadow:
              "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
          },
          children: i.jsx("span", {
            className:
              "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
            children: "ADICIONAR",
          }),
        }),
      }),
      i.jsxs(c1, {
        children: [
          i.jsx(d1, { className: "fixed inset-0 bg-[#101010]/80" }),
          i.jsxs(f1, {
            className:
              "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[25rem] px-[1.5625rem] pt-[2.1875rem] pb-[1.5625rem] rounded-xl flex flex-col gap-4 border-[.0563rem] border-white/30",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.08) 100%), linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 100%), rgba(16, 16, 16, 0.90)",
            },
            children: [
              i.jsxs("svg", {
                className: "-mt-[4rem] mx-auto",
                width: "58",
                height: "58",
                viewBox: "0 0 58 58",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg",
                children: [
                  i.jsx("path", {
                    d: "M4.33013 34.5C2.36517 31.0966 2.36517 26.9034 4.33013 23.5L11.9019 10.3853C13.8669 6.98186 17.4983 4.88527 21.4282 4.88527L36.5718 4.88527C40.5017 4.88527 44.1331 6.98186 46.0981 10.3853L53.6699 23.5C55.6348 26.9034 55.6348 31.0966 53.6699 34.5L46.0981 47.6147C44.1331 51.0181 40.5017 53.1147 36.5718 53.1147L21.4282 53.1147C17.4983 53.1147 13.8669 51.0181 11.9019 47.6147L4.33013 34.5Z",
                    fill: "url(#paint0_radial_375_1049)",
                    "fill-opacity": "0.45",
                    stroke: "#FF0000",
                    "stroke-width": "2",
                  }),
                  i.jsx("path", {
                    d: "M8.88675 34C7.10042 30.906 7.10042 27.094 8.88675 24L14.6132 14.0814C16.3996 10.9874 19.7008 9.08142 23.2735 9.08142L34.7265 9.08142C38.2992 9.08142 41.6004 10.9874 43.3868 14.0814L49.1132 24C50.8996 27.094 50.8996 30.906 49.1132 34L43.3868 43.9186C41.6004 47.0126 38.2992 48.9186 34.7265 48.9186L23.2735 48.9186C19.7008 48.9186 16.3996 47.0126 14.6132 43.9186L8.88675 34Z",
                    fill: "#FF0000",
                  }),
                  i.jsx("path", {
                    d: "M32.9971 34.5549V33.4206C34.4661 32.5667 35.6633 30.4396 35.6633 28.3111C35.6633 24.8942 35.6633 22.1236 31.664 22.1236C27.6647 22.1236 27.6647 24.8942 27.6647 28.3111C27.6647 30.4396 28.8618 32.5667 30.3309 33.4206V34.5549C25.809 34.9358 22.3323 37.2279 22.3323 39.9986H40.9956C40.9956 37.2279 37.5189 34.9358 32.9971 34.5549Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("path", {
                    d: "M23.8148 35.0857C24.9666 34.3089 26.3997 33.719 27.9767 33.3587C27.6558 32.9657 27.3732 32.5411 27.1329 32.091C26.5061 30.936 26.1731 29.6361 26.165 28.3125C26.165 26.4645 26.165 24.7183 26.8023 23.2896C27.4208 21.9036 28.5339 21.0442 30.119 20.7225C29.7671 19.0794 28.8286 18 26.3317 18C22.3324 18 22.3324 20.7706 22.3324 24.1875C22.3324 26.316 23.5295 28.4431 24.9986 29.297V30.4314C20.4767 30.8122 17 33.1044 17 35.875H22.811C23.1131 35.5972 23.4477 35.3346 23.8148 35.0871V35.0857Z",
                    fill: "#1E1E1E",
                  }),
                  i.jsx("defs", {
                    children: i.jsxs("radialGradient", {
                      id: "paint0_radial_375_1049",
                      cx: "0",
                      cy: "0",
                      r: "1",
                      gradientUnits: "userSpaceOnUse",
                      gradientTransform:
                        "translate(29 -0.0828493) rotate(90) scale(64.4007 657.175)",
                      children: [
                        i.jsx("stop", {}),
                        i.jsx("stop", { offset: "1", "stop-opacity": "0" }),
                      ],
                    }),
                  }),
                ],
              }),
              i.jsx(m1, {
                className:
                  "text-white text-[1.125rem] eading-[.8125rem] font-extrabold text-center",
                children: "NOVO MEMBRO",
              }),
              i.jsx(p1, {}),
              i.jsxs("div", {
                className: "w-full flex flex-col gap-3",
                children: [
                  i.jsx("input", {
                    type: "text",
                    placeholder: "Nome",
                    onChange: (P) => h(P.target.value),
                    className:
                      "focus:outline-none text-white w-full h-[2.5625rem] rounded-[.6875rem] bg-white/[0.03] border-[.05rem] border-white/30 pl-[.9375rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
                  }),
                  i.jsx("input", {
                    type: "text",
                    placeholder: "Palavra-chave",
                    onChange: (P) => y(P.target.value),
                    className:
                      "focus:outline-none text-white w-full h-[2.5625rem] rounded-[.6875rem] bg-white/[0.03] border-[.05rem] border-white/30 pl-[.9375rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
                  }),
                  i.jsx("textarea", {
                    placeholder: "Descrição",
                    onChange: (P) => E(P.target.value),
                    className:
                      "focus:outline-none text-white w-full h-[7.5rem] rounded-[.6875rem] bg-white/[0.03] border-[.05rem] border-white/30 pl-[.9375rem] pt-[.7813rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem] resize-none",
                  }),
                  i.jsxs("div", {
                    className: "w-full relative",
                    children: [
                      i.jsx("input", {
                        type: "text",
                        value: s,
                        placeholder: "CDS",
                        className:
                          "focus:outline-none text-white w-full h-[2.5625rem] rounded-[.6875rem] bg-white/[0.03] border-[.05rem] border-white/30 pl-[.9375rem] placeholder:text-white/40 text-white/90 text-[.8125rem] leading-[1rem]",
                      }),
                      i.jsxs("svg", {
                        onClick: R,
                        className:
                          "absolute right-[.4375rem] top-1/2 -translate-y-1/2",
                        width: "27",
                        height: "27",
                        viewBox: "0 0 27 27",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg",
                        children: [
                          i.jsx("rect", {
                            width: "27",
                            height: "27",
                            rx: "6",
                            fill: "#DDDDDD",
                            "fill-opacity": "0.3",
                          }),
                          i.jsx("rect", {
                            x: "0.5",
                            y: "0.5",
                            width: "26",
                            height: "26",
                            rx: "5.5",
                            stroke: "#DDDDDD",
                            "stroke-opacity": "0.2",
                          }),
                          i.jsx("path", {
                            "fill-rule": "evenodd",
                            "clip-rule": "evenodd",
                            d: "M13.4997 5.58337C16.5603 5.58337 19.0414 8.06447 19.0414 11.125C19.0414 12.1346 18.7722 13.0805 18.2998 13.8962C17.9849 14.44 16.3848 17.2107 13.4997 22.2084C10.6145 17.2107 9.01449 14.44 8.6996 13.8962C8.2272 13.0805 7.95801 12.1346 7.95801 11.125C7.95801 8.06447 10.4391 5.58337 13.4997 5.58337M13.4997 8.75003C12.188 8.75003 11.1247 9.81336 11.1247 11.125C11.1247 12.4367 12.188 13.5 13.4997 13.5C14.8114 13.5 15.8747 12.4367 15.8747 11.125C15.8747 9.81336 14.8114 8.75003 13.4997 8.75003Z",
                            fill: "#DDDDDD",
                          }),
                        ],
                      }),
                    ],
                  }),
                ],
              }),
              i.jsxs("div", {
                className: "w-full flex flex-col gap-2.5",
                children: [
                  i.jsx("span", {
                    className:
                      "text-white/90 font-bold text-[.6875rem] leading-[.5rem]",
                    children: "NOTA DA FACÇÃO",
                  }),
                  i.jsx("div", {
                    className: "w-full flex items-center gap-2",
                    children: g.map((P) =>
                      i.jsx("svg", {
                        onClick: () => d(P),
                        className: ie(
                          "overflow-visible text-[#DDD]/20",
                          c >= P &&
                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                        ),
                        width: "20",
                        height: "20",
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg",
                        children: i.jsx("path", {
                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                          fill: "currentColor",
                        }),
                      })
                    ),
                  }),
                ],
              }),
              i.jsxs("div", {
                className: "w-full flex items-center gap-2",
                children: [
                  i.jsx(Ke, {
                    asChild: !0,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 rounded-[.5625rem] flex items-center justify-center border border-[#DDDDDD]/20 bg-[#DDDDDD]/30",
                      children: i.jsx("span", {
                        className:
                          "text-white text-xs leading-[.5625rem] font-extrabold",
                        children: "RETORNAR",
                      }),
                    }),
                  }),
                  i.jsx(Ke, {
                    asChild: !0,
                    onClick: b,
                    children: i.jsx("button", {
                      className:
                        "w-[10.6875rem] h-8 bg-primary rounded-[.5625rem] flex items-center justify-center",
                      style: {
                        boxShadow:
                          "0px 0px 4px 0px rgba(0, 0, 0, 0.10), 0px 0px 14px 0px rgba(255, 0, 0, 0.45)",
                      },
                      children: i.jsx("span", {
                        className:
                          "text-[#1E1E1E] text-xs leading-[.5625rem] font-extrabold",
                        children: "ADICIONAR",
                      }),
                    }),
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
function D7() {
  const [l, s] = C.useState(""),
    {
      permissions: a,
      setOpenedPartnerModal: c,
      partners: d,
      setPartners: m,
    } = Me();
  Array.from({ length: 5 }, (w, E) => E + 1);
  const h = d.filter((w) =>
    w.name.toLocaleLowerCase().includes(l.toLocaleLowerCase())
  );
  function p(w) {
    de("MarkLocal", { cds: w }, !0);
  }
  function y(w) {
    de("DeletePartner", { partner: w }, []).then(m);
  }
  return (
    C.useEffect(() => {
      de("GetPartners", {}, [
        {
          cds: "a; a; a;",
          note: 1,
          name: "test2",
          keyword: "bola gato",
          description:
            "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        },
        {
          cds: "a; a; a;",
          note: 3,
          name: "test2",
          keyword: "bola gato",
          description: "descricao",
          icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        },
        {
          cds: "a; a; a;",
          note: 3,
          name: "test2",
          keyword: "bola gato",
          description: "descricao",
          icon: "https://yt3.googleusercontent.com/YeeUUjrpS25uck9AHHLqWZxmC4ASPxQ45IqBsDUyFNimDf53kXJQu_Dm3K7sEpj7boaSTzaeKwM=s900-c-k-c0x00ffffff-no-rj",
        },
      ]).then(m);
    }, []),
    i.jsxs("div", {
      className:
        "w-full h-full rounded-xl border-[.05rem] border-white/25 p-[1.875rem] flex flex-col gap-5",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
      },
      children: [
        i.jsxs("div", {
          className: "w-full flex justify-between",
          children: [
            i.jsx("h1", {
              className: "text-white text-base leading-[.75rem] font-extrabold",
              children: "PARCEIROS",
            }),
            i.jsxs("div", {
              className: "flex items-center gap-2",
              children: [
                i.jsxs("div", {
                  className:
                    "w-[16.875rem] h-8 flex items-center relative bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                  children: [
                    i.jsxs("svg", {
                      className: "absolute left-[.9375rem]",
                      width: "16",
                      height: "16",
                      viewBox: "0 0 16 16",
                      fill: "none",
                      xmlns: "http://www.w3.org/2000/svg",
                      children: [
                        i.jsx("path", {
                          d: "M7.18016 12.1999C6.1873 12.1999 5.21673 11.9055 4.3912 11.3539C3.56566 10.8023 2.92224 10.0183 2.54228 9.10099C2.16233 8.1837 2.06292 7.17435 2.25662 6.20056C2.45031 5.22678 2.92842 4.3323 3.63048 3.63024C4.33254 2.92818 5.22702 2.45007 6.20081 2.25637C7.17459 2.06267 8.18394 2.16209 9.10123 2.54204C10.0185 2.92199 10.8025 3.56542 11.3541 4.39095C11.9057 5.21649 12.2002 6.18705 12.2002 7.17991C12.2002 7.83915 12.0703 8.49193 11.818 9.10099C11.5658 9.71004 11.196 10.2634 10.7298 10.7296C10.2637 11.1957 9.71028 11.5655 9.10123 11.8178C8.49218 12.0701 7.83939 12.1999 7.18016 12.1999ZM7.18016 3.16658C6.38903 3.16658 5.61567 3.40118 4.95788 3.8407C4.30008 4.28023 3.78739 4.90494 3.48464 5.63585C3.18189 6.36675 3.10268 7.17102 3.25702 7.94694C3.41136 8.72287 3.79232 9.4356 4.35173 9.99501C4.91114 10.5544 5.62387 10.9354 6.3998 11.0897C7.17572 11.2441 7.97999 11.1649 8.71089 10.8621C9.4418 10.5593 10.0665 10.0467 10.506 9.38886C10.9456 8.73107 11.1802 7.95771 11.1802 7.16658C11.1802 6.10572 10.7587 5.0883 10.0086 4.33815C9.25844 3.58801 8.24102 3.16658 7.18016 3.16658Z",
                          fill: "#CCCCCC",
                          "fill-opacity": "0.8",
                        }),
                        i.jsx("path", {
                          d: "M13.3336 13.8334C13.2679 13.8337 13.2028 13.8209 13.1422 13.7957C13.0815 13.7705 13.0265 13.7335 12.9803 13.6867L10.227 10.9334C10.1386 10.8386 10.0906 10.7132 10.0929 10.5837C10.0951 10.4542 10.1476 10.3306 10.2392 10.239C10.3308 10.1474 10.4544 10.0949 10.584 10.0926C10.7135 10.0903 10.8389 10.1384 10.9336 10.2267L13.687 12.9801C13.7806 13.0738 13.8332 13.2009 13.8332 13.3334C13.8332 13.4659 13.7806 13.593 13.687 13.6867C13.6408 13.7335 13.5858 13.7705 13.5251 13.7957C13.4644 13.8209 13.3993 13.8337 13.3336 13.8334Z",
                          fill: "#CCCCCC",
                          "fill-opacity": "0.8",
                        }),
                      ],
                    }),
                    i.jsx("input", {
                      type: "text",
                      onChange: (w) => s(w.target.value),
                      placeholder: "BUSCAR",
                      className:
                        "w-full h-full bg-transparent placeholder:text-[#D9D9D9]/80 text-white/90 text-[.6875rem] leading-[0.5rem] pl-[2.25rem] focus:outline-none ",
                    }),
                  ],
                }),
                i.jsx(k7, {}),
              ],
            }),
          ],
        }),
        i.jsx("div", {
          className: "w-full grid grid-cols-3 content-start gap-[1.0625rem]",
          children: h.map((w) =>
            i.jsxs(
              "div",
              {
                className:
                  "w-[23.25rem] h-[13.4375rem] bg-white/5 border-[.05rem] border-white/25 rounded-xl p-5 flex flex-col justify-between",
                style: {
                  background:
                    "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
                },
                children: [
                  i.jsxs("div", {
                    className: "flex flex-col gap-2",
                    children: [
                      i.jsxs("div", {
                        className: "w-full flex justify-between",
                        children: [
                          i.jsxs("div", {
                            className: "flex items-center gap-[.9375rem]",
                            children: [
                              i.jsxs("svg", {
                                xmlns: "http://www.w3.org/2000/svg",
                                width: "80",
                                height: "80",
                                viewBox: "0 0 80 80",
                                fill: "none",
                                children: [
                                  i.jsx("path", {
                                    d: "M4.33013 45.5C2.36516 42.0966 2.36516 37.9034 4.33012 34.5L17.4019 11.859C19.3669 8.45557 22.9983 6.35898 26.9282 6.35898L53.0718 6.35898C57.0017 6.35898 60.6331 8.45556 62.5981 11.859L75.6699 34.5C77.6348 37.9034 77.6348 42.0966 75.6699 45.5L62.5981 68.141C60.6331 71.5444 57.0017 73.641 53.0718 73.641L26.9282 73.641C22.9983 73.641 19.3669 71.5444 17.4019 68.141L4.33013 45.5Z",
                                    fill: "url(#paint0_radial_263_56)",
                                    "fill-opacity": "0.45",
                                    stroke: "#FF0000",
                                    "stroke-width": "2",
                                  }),
                                  i.jsx("path", {
                                    d: "M10.8868 45C9.10042 41.906 9.10042 38.094 10.8868 35L21.1132 17.2872C22.8996 14.1932 26.2008 12.2872 29.7735 12.2872L50.2265 12.2872C53.7991 12.2872 57.1004 14.1932 58.8867 17.2872L69.1132 35C70.8996 38.094 70.8996 41.906 69.1132 45L58.8867 62.7128C57.1004 65.8068 53.7992 67.7128 50.2265 67.7128L29.7735 67.7128C26.2008 67.7128 22.8996 65.8068 21.1132 62.7128L10.8868 45Z",
                                    fill: "#FF0000",
                                  }),
                                  i.jsx("path", {
                                    d: "M55 28.0001L49.7954 32.9027L54.774 41.267L55 40.9865V28.0001ZM25 28.0716V42.282C25.2824 42.3187 25.6216 42.3389 25.964 42.3424C26.7121 42.3503 27.3287 42.3015 27.6751 42.2705L30.9937 33.8889L25 28.0716ZM49.5265 34.6681L49.0828 34.9547C49.0734 34.9608 48.7449 35.1646 48.6484 35.2246L47.98 35.6285L47.9895 35.6341C47.6797 35.8264 47.5937 35.8805 47.2422 36.0984C47.0638 36.2089 47.0594 36.2115 46.8902 36.3164C45.6115 35.6302 44.2239 35.1029 42.6046 34.6882C40.5682 35.3023 38.4108 36.1909 36.2566 37.0247C37.1509 38.0996 38.1449 38.4496 39.146 38.4622C40.3069 38.4766 41.4937 37.9727 42.311 37.4082L42.7774 37.0861L43.2454 37.7611L50.5219 43.0032L53.3651 41.1168L49.5265 34.6681ZM31.8368 34.8405L28.9775 42.0615L30.0269 42.8669L31.9678 40.6711L32.1232 40.4953L32.3577 40.4807C32.4522 40.4748 32.5455 40.472 32.6375 40.4725C33.2811 40.4767 33.8566 40.6434 34.2882 41.0236C34.6078 41.3049 34.8203 41.6795 34.9436 42.1131L35.0873 42.1042C35.8433 42.057 36.5244 42.2127 37.0178 42.6471C37.5111 43.0816 37.7508 43.7369 37.798 44.4916L37.8024 44.5595C38.2083 44.636 38.5717 44.7955 38.8671 45.0557C39.3605 45.4902 39.6001 46.1453 39.6474 46.9L39.6598 47.0963C39.7001 47.109 39.74 47.1228 39.7795 47.1377L39.9077 46.9582L40.2524 46.4752L40.4297 46.2267L40.8917 46.5553L44.6371 49.2185C45.0445 49.1183 45.2874 48.9622 45.4224 48.7728C45.5578 48.5833 45.6262 48.3028 45.5878 47.8853L41.0968 44.6751L40.6355 44.3455L40.9626 43.8897L41.383 43.3005L41.845 43.6291L46.9081 47.2291C47.3155 47.1289 47.5586 46.9728 47.6936 46.7834C47.8287 46.594 47.8972 46.3143 47.8591 45.8975L42.0357 41.7739L41.573 41.4461L42.2294 40.5226L42.6922 40.8503L48.5166 44.9748C48.9244 44.8745 49.1675 44.7185 49.3027 44.5289C49.4381 44.3393 49.5065 44.0586 49.4678 43.6404L42.5073 38.626C41.5837 39.1725 40.4022 39.6103 39.1319 39.5945C37.6453 39.5759 36.0552 38.8669 34.8854 37.075C34.8392 37.0042 34.8094 36.9239 34.7983 36.84C34.7872 36.7562 34.7951 36.6709 34.8213 36.5905C34.8476 36.5101 34.8916 36.4365 34.95 36.3753C35.0085 36.3141 35.0799 36.2667 35.1592 36.2367C35.9794 35.9256 36.8081 35.5969 37.6388 35.2708L31.8369 34.8409L31.8368 34.8405ZM32.6499 41.6106L29.6522 45.002C29.7106 45.4264 29.8438 45.6903 30.0232 45.8484C30.2027 46.0064 30.4817 46.1053 30.9109 46.1103L33.9086 42.7191C33.8501 42.2946 33.717 42.0305 33.5375 41.8725C33.3581 41.7145 33.0791 41.6156 32.6499 41.6107L32.6499 41.6106ZM35.3794 43.2343L31.9942 47.0641C32.0525 47.4886 32.1858 47.7526 32.3651 47.9107C32.5447 48.0686 32.8236 48.1675 33.2528 48.1724L36.6381 44.3427C36.5797 43.9182 36.4465 43.6542 36.2671 43.4961C36.0876 43.338 35.8087 43.2391 35.3795 43.2342L35.3794 43.2343ZM37.2286 45.6428L34.2311 49.0341C34.2895 49.4585 34.4227 49.7225 34.6021 49.8806C34.7816 50.0387 35.0607 50.1375 35.4898 50.1425L38.4874 46.7515C38.429 46.3268 38.2958 46.0628 38.1164 45.9047C37.9369 45.7467 37.6579 45.6479 37.2287 45.6429L37.2286 45.6428ZM38.7854 48.1048L36.3404 50.8904C36.3987 51.3156 36.5319 51.58 36.7115 51.7381C36.8908 51.896 37.1695 51.9949 37.5981 52L40.0432 49.2144C39.9849 48.7893 39.8516 48.525 39.672 48.3667C39.4928 48.2088 39.2141 48.11 38.7855 48.1049L38.7854 48.1048ZM41.0129 48.4061C41.1196 48.6968 41.1813 49.0189 41.2028 49.3618L41.2175 49.5948L40.6958 50.1892L42.3801 51.3868C42.7875 51.2865 43.0303 51.1304 43.1654 50.941C43.3006 50.7517 43.3691 50.4715 43.331 50.0544L41.0129 48.4063L41.0129 48.4061Z",
                                    fill: "#1E1E1E",
                                  }),
                                  i.jsx("defs", {
                                    children: i.jsxs("radialGradient", {
                                      id: "paint0_radial_263_56",
                                      cx: "0",
                                      cy: "0",
                                      r: "1",
                                      gradientUnits: "userSpaceOnUse",
                                      gradientTransform:
                                        "translate(39.9999 -0.11428) rotate(90) scale(88.8286 906.449)",
                                      children: [
                                        i.jsx("stop", {}),
                                        i.jsx("stop", {
                                          offset: "1",
                                          "stop-opacity": "0",
                                        }),
                                      ],
                                    }),
                                  }),
                                ],
                              }),
                              i.jsxs("div", {
                                className: "flex flex-col gap-2.5",
                                children: [
                                  i.jsx("h6", {
                                    className: "text-white text-base font-bold",
                                    children: w.name,
                                  }),
                                  i.jsxs("div", {
                                    className: "flex gap-[.3125rem]",
                                    children: [
                                      i.jsx("svg", {
                                        className: ie(
                                          "overflow-visible text-[#DDD]/20",
                                          w.note >= 1 &&
                                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                                        ),
                                        width: "20",
                                        height: "20",
                                        viewBox: "0 0 20 20",
                                        fill: "none",
                                        xmlns: "http://www.w3.org/2000/svg",
                                        children: i.jsx("path", {
                                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                                          fill: "currentColor",
                                        }),
                                      }),
                                      i.jsx("svg", {
                                        className: ie(
                                          "overflow-visible text-[#DDD]/20",
                                          w.note >= 2 &&
                                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                                        ),
                                        width: "20",
                                        height: "20",
                                        viewBox: "0 0 20 20",
                                        fill: "none",
                                        xmlns: "http://www.w3.org/2000/svg",
                                        children: i.jsx("path", {
                                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                                          fill: "currentColor",
                                        }),
                                      }),
                                      i.jsx("svg", {
                                        className: ie(
                                          "overflow-visible text-[#DDD]/20",
                                          w.note >= 3 &&
                                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                                        ),
                                        width: "20",
                                        height: "20",
                                        viewBox: "0 0 20 20",
                                        fill: "none",
                                        xmlns: "http://www.w3.org/2000/svg",
                                        children: i.jsx("path", {
                                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                                          fill: "currentColor",
                                        }),
                                      }),
                                      i.jsx("svg", {
                                        className: ie(
                                          "overflow-visible text-[#DDD]/20",
                                          w.note >= 4 &&
                                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                                        ),
                                        width: "20",
                                        height: "20",
                                        viewBox: "0 0 20 20",
                                        fill: "none",
                                        xmlns: "http://www.w3.org/2000/svg",
                                        children: i.jsx("path", {
                                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                                          fill: "currentColor",
                                        }),
                                      }),
                                      i.jsx("svg", {
                                        className: ie(
                                          "overflow-visible text-[#DDD]/20",
                                          w.note >= 5 &&
                                            "!text-primary shadow-primary drop-shadow-[0_0_14px_var(--tw-shadow-color)]"
                                        ),
                                        width: "20",
                                        height: "20",
                                        viewBox: "0 0 20 20",
                                        fill: "none",
                                        xmlns: "http://www.w3.org/2000/svg",
                                        children: i.jsx("path", {
                                          d: "M10.7948 1.41668C10.7417 1.24745 10.636 1.09957 10.4931 0.994551C10.3502 0.889534 10.1775 0.832857 10.0001 0.832764C9.82276 0.832671 9.64999 0.889167 9.50696 0.994034C9.36392 1.0989 9.25807 1.24667 9.20481 1.41584L7.38481 7.18251L1.66731 7.17834C1.48906 7.17793 1.31537 7.23468 1.17176 7.34026C1.02814 7.44584 0.922167 7.59469 0.869393 7.76495C0.816618 7.93521 0.819827 8.1179 0.878548 8.2862C0.93727 8.4545 1.04841 8.59953 1.19564 8.70001L5.77731 11.835L4.05481 17.2892C4.00284 17.4557 4.00442 17.6343 4.05933 17.7998C4.11424 17.9654 4.21972 18.1096 4.3609 18.212C4.50208 18.3144 4.67184 18.37 4.84627 18.3708C5.02069 18.3717 5.19098 18.3177 5.33314 18.2167L9.99981 14.8783L14.6615 18.2175C14.8037 18.3194 14.9743 18.3739 15.1492 18.3734C15.3241 18.3729 15.4945 18.3174 15.6361 18.2147C15.7777 18.112 15.8834 17.9673 15.9382 17.8012C15.993 17.6351 15.9941 17.456 15.9415 17.2892L14.219 11.835L18.804 8.70001C18.9512 8.59953 19.0623 8.4545 19.1211 8.2862C19.1798 8.1179 19.183 7.93521 19.1302 7.76495C19.0775 7.59469 18.9715 7.44584 18.8279 7.34026C18.6842 7.23468 18.5106 7.17793 18.3323 7.17834L12.6106 7.18251L10.7948 1.41668Z",
                                          fill: "currentColor",
                                        }),
                                      }),
                                    ],
                                  }),
                                ],
                              }),
                            ],
                          }),
                          a.leader &&
                            i.jsx("div", {
                              onClick: () => y(w),
                              className:
                                "size-8 bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] grid place-items-center cursor-pointer",
                              children: i.jsx("svg", {
                                width: "20",
                                height: "20",
                                viewBox: "0 0 20 20",
                                fill: "none",
                                xmlns: "http://www.w3.org/2000/svg",
                                children: i.jsx("path", {
                                  d: "M17.4824 3.75H13.125V1.875C13.125 1.70924 13.0592 1.55027 12.9419 1.43306C12.8247 1.31585 12.6658 1.25 12.5 1.25H7.5C7.33424 1.25 7.17527 1.31585 7.05806 1.43306C6.94085 1.55027 6.875 1.70924 6.875 1.875V3.75H2.51758L2.5 5.3125H3.78906L4.57383 17.5781C4.59369 17.8953 4.73363 18.193 4.96518 18.4107C5.19673 18.6284 5.5025 18.7497 5.82031 18.75H14.1797C14.4973 18.75 14.803 18.629 15.0347 18.4117C15.2664 18.1944 15.4066 17.8971 15.427 17.5801L16.2109 5.3125H17.5L17.4824 3.75ZM6.875 16.25L6.52344 6.25H7.8125L8.16406 16.25H6.875ZM10.625 16.25H9.375V6.25H10.625V16.25ZM11.5625 3.75H8.4375V2.65625C8.4375 2.61481 8.45396 2.57507 8.48326 2.54576C8.51257 2.51646 8.55231 2.5 8.59375 2.5H11.4062C11.4477 2.5 11.4874 2.51646 11.5167 2.54576C11.546 2.57507 11.5625 2.61481 11.5625 2.65625V3.75ZM13.125 16.25H11.8359L12.1875 6.25H13.4766L13.125 16.25Z",
                                  fill: "#FF0000",
                                }),
                              }),
                            }),
                        ],
                      }),
                      i.jsxs("div", {
                        className: "flex flex-col gap-2",
                        children: [
                          i.jsx("span", {
                            className:
                              "text-[#F2F2F2] font-semibold text-[.8125rem] leading-[.5625rem]",
                            children: "Palavra chave:",
                          }),
                          i.jsx("span", {
                            className:
                              "text-white font-medium text-[.6875rem] leading-[.5rem]",
                            children: w.keyword,
                          }),
                        ],
                      }),
                    ],
                  }),
                  i.jsx("button", {
                    onClick: () => p(w.cds),
                    className:
                      "w-full h-8 bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-extrabold text-xs",
                    children: "MARCAR NO MAPA",
                  }),
                ],
              },
              w.name
            )
          ),
        }),
      ],
    })
  );
}
const _7 = "" + new URL("logo-BQURdZUq.png", import.meta.url).href;
function R7() {
  const [l, s] = C.useState(0),
    a = C.useRef(null),
    [c, d] = C.useState([]),
    {
      orgBalance: m,
      playerBalance: h,
      setPlayerBalance: p,
      setOrgBalance: y,
      permissions: w,
    } = Me();
  function E() {
    w.withdraw &&
      (l <= 0 ||
        (de("Withdraw", { value: l }).then(p), a.current && (a.current.value = "")));
  }
  function g() {
    w.deposit &&
      (l <= 0 ||
        (de("Deposit", { value: l }).then(p), a.current && (a.current.value = "")));
  }
  return (
    _1("UpdateExtracts", d),
    _1("UpdateBalance", y),
    _1("UpdatePlayerBalance", p),
    C.useEffect(() => {
      de("GetExtracts", {}, [
        {
          id: 25111,
          name: "fivecommunity KKK",
          type: "SAQUE",
          value: 5e3,
          date: "15/10/2024",
        },
        {
          id: 25,
          name: "fivecommunity KKK",
          type: "DEPÓSITO",
          value: 5e3,
          date: "15/10/2024",
        },
        {
          id: 25,
          name: "fivecommunity KKK",
          type: "SAQUE",
          value: 5e3,
          date: "15/10/2024",
        },
        {
          id: 25,
          name: "fivecommunity KKK",
          type: "SAQUE",
          value: 5e3,
          date: "15/10/2024",
        },
      ]).then(d);
    }, []),
    i.jsxs("div", {
      className: "w-full h-full overflow-hidden flex gap-2.5",
      children: [
        i.jsxs("div", {
          className:
            "w-[31.25rem] flex-none h-full border-[.05rem] border-white/25 relative p-[1.875rem] rounded-xl",
          style: {
            background:
              "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
          },
          children: [
            i.jsx("span", {
              className: "text-white text-[1rem] font-extrabold ",
              children: "BANCO",
            }),
            i.jsxs("div", {
              className:
                "w-[21.875rem] absolute left-1/2 -translate-x-1/2 top-1/2 -translate-y-1/2 flex flex-col items-center gap-[1.5625rem]",
              children: [
                i.jsxs("div", {
                  className:
                    "w-full h-[11.875rem] p-5 flex items-center justify-between rounded-xl",
                  style: {
                    background:
                      "linear-gradient(180deg, #FF0000 0%, rgba(255, 0, 0, 0.70) 100%), rgba(0, 0, 0, 0.20)",
                  },
                  children: [
                    i.jsxs("div", {
                      className: "h-full flex flex-col justify-between",
                      children: [
                        i.jsx("span", {
                          className: "text-[#1E1E1E] text-[.8125rem] font-bold",
                          children: "CARD",
                        }),
                        i.jsxs("div", {
                          className: "flex flex-col gap-[.1875rem]",
                          children: [
                            i.jsx("span", {
                              className:
                                "text-[#1E1E1E] font-semibold text-[.6875rem] leading-[.5rem]",
                              children: "SALDO",
                            }),
                            i.jsxs("span", {
                              className:
                                "text-[#1E1E1E] font-bold text-[1.5625rem] leading-[1.875rem]",
                              children: [
                                "$",
                                Number(m).toLocaleString("pt-BR"),
                              ],
                            }),
                          ],
                        }),
                        i.jsxs("svg", {
                          width: "14",
                          height: "24",
                          viewBox: "0 0 14 24",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M14 12.0058C13.9418 16.4709 12.4775 20.3367 9.54475 23.5745C9.06119 24.1088 8.35498 24.1391 7.88399 23.67C7.39729 23.1849 7.38576 22.4355 7.87194 21.8996C8.60435 21.0923 9.25347 20.2197 9.79413 19.2589C10.8503 17.3815 11.4779 15.3584 11.6335 13.1801C11.9128 9.2663 10.8514 5.80223 8.46447 2.79014C8.2743 2.55063 8.06683 2.32658 7.86566 2.097C7.39781 1.56335 7.39939 0.828259 7.87037 0.344272C8.33612 -0.134197 9.05124 -0.115433 9.53113 0.409944C11.6639 2.74213 13.0606 5.48601 13.6757 8.66642C13.8884 9.7685 13.999 10.8789 14 12.0058Z",
                              fill: "#1E1E1E",
                            }),
                            i.jsx("path", {
                              d: "M9.23618 12.0146C9.18274 15.3335 8.03435 18.1563 5.76429 20.4664C5.38237 20.8549 4.88467 20.9421 4.43883 20.7208C4.02285 20.5144 3.75042 20.0465 3.77557 19.5625C3.79495 19.1833 3.97465 18.8914 4.23189 18.6342C5.3106 17.5581 6.11373 16.2827 6.51871 14.7778C7.47902 11.2094 6.7597 8.06268 4.27065 5.40489C3.72685 4.82433 3.61473 4.18416 4.01342 3.64057C4.45088 3.044 5.23358 2.9993 5.78263 3.54786C6.89173 4.65601 7.74883 5.95124 8.34764 7.433C8.93808 8.89489 9.2477 10.4186 9.23618 12.0146Z",
                              fill: "#1E1E1E",
                            }),
                            i.jsx("path", {
                              d: "M4.50851 12.0179C4.44249 14.2353 3.59378 16.0344 1.90105 17.3743C1.33681 17.8213 0.628503 17.7214 0.23191 17.1596C-0.165206 16.5967 -0.0426143 15.8694 0.525293 15.4163C2.75711 13.6387 2.75658 10.3546 0.522675 8.58143C0.134465 8.27294 -0.0604259 7.87394 0.0249698 7.36457C0.116128 6.82208 0.438851 6.48931 0.948606 6.36679C1.275 6.28843 1.57467 6.37728 1.83819 6.57926C3.33078 7.72439 4.20779 9.25857 4.45402 11.1907C4.48912 11.4649 4.51008 11.7381 4.50851 12.0179Z",
                              fill: "#1E1E1E",
                            }),
                          ],
                        }),
                      ],
                    }),
                    i.jsx("img", {
                      src: _7,
                      alt: "",
                      className: "h-[4.5625rem]",
                    }),
                  ],
                }),
                i.jsxs("div", {
                  className: "flex flex-col items-center gap-[.5625rem]",
                  children: [
                    i.jsx("span", {
                      className: "text-white/60 font-semibold text-[.6875rem]",
                      children: "SALDO",
                    }),
                    i.jsxs("span", {
                      className:
                        "text-white font-bold text-[1.6875rem] leading-[1.25rem]",
                      children: ["$", Number(h).toLocaleString("pt-BR")],
                    }),
                  ],
                }),
                i.jsxs("div", {
                  className: "w-full flex flex-col gap-3",
                  children: [
                    i.jsx("input", {
                      type: "number",
                      onChange: (b) => s(Number(b.target.value)),
                      placeholder: "VALOR",
                      className:
                        "w-full h-10 bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem] font-semibold text-[.8125rem] text-white/60 text-center focus:outline-none",
                    }),
                    i.jsxs("div", {
                      className: "w-full h-10 flex items-center gap-2.5",
                      children: [
                        i.jsx("button", {
                          onClick: E,
                          className:
                            "flex-1 h-full bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                          children: "SACAR",
                        }),
                        i.jsx("button", {
                          onClick: g,
                          className:
                            "flex-1 h-full bg-white/15 border-[.05rem] border-white/[0.17] rounded-[.5625rem] text-[#D9D9D9] font-bold text-[.8125rem] duration-200 shadow-transparent hover:bg-primary shadow-[0_0_14px] hover:shadow-primary/45 hover:text-[#1E1E1E]",
                          children: "DEPOSITAR",
                        }),
                      ],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
        i.jsxs("div", {
          className:
            "w-full h-full overflow-hidden border-[.05rem] border-white/25 p-[1.875rem] rounded-xl flex flex-col gap-[.9375rem]",
          style: {
            background:
              "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
          },
          children: [
            i.jsx("span", {
              className: "text-white text-[1rem] font-extrabold",
              children: "EXTRATO",
            }),
            i.jsx("div", {
              className:
                "w-full h-px bg-gradient-to-r from-white/0 via-white/10 to-white/0",
            }),
            i.jsxs("div", {
              className: "w-full h-full flex flex-col gap-3",
              children: [
                i.jsxs("div", {
                  className: "ml-[3.875rem] flex items-center",
                  children: [
                    i.jsx("span", {
                      className:
                        "w-[4.375rem] font-semibold text-[.6875rem] text-white/60",
                      children: "ID",
                    }),
                    i.jsx("span", {
                      className:
                        "w-[11.5625rem] font-semibold text-[.6875rem] leading-[.5625rem] text-white/60",
                      children: "NOME",
                    }),
                    i.jsx("span", {
                      className:
                        "w-[5.0625rem] text-center font-semibold text-[.6875rem] leading-[.5625rem] text-white/60",
                      children: "VALOR",
                    }),
                    i.jsx("span", {
                      className:
                        "ml-[3.8125rem] w-[8.1875rem] font-semibold text-[.6875rem] text-center text-white/60",
                      children: "DATA",
                    }),
                  ],
                }),
                i.jsx("div", {
                  className:
                    "w-full h-full flex flex-col gap-[.4375rem] overflow-y-auto",
                  children: c.map((b, R) =>
                    i.jsxs(
                      "div",
                      {
                        className: "w-full flex items-center gap-2",
                        children: [
                          i.jsx("div", {
                            className:
                              "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] border-[.05rem] border-white/[0.12] bg-white/5 grid place-items-center",
                            children: i.jsx("svg", {
                              width: "18",
                              height: "13",
                              viewBox: "0 0 18 13",
                              fill: "none",
                              xmlns: "http://www.w3.org/2000/svg",
                              children: i.jsx("path", {
                                "fill-rule": "evenodd",
                                "clip-rule": "evenodd",
                                d: "M1.35 0C0.991958 0 0.64858 0.146747 0.395406 0.407958C0.142232 0.66917 0 1.02345 0 1.39286V3.25H18V1.39286C18 1.02345 17.8578 0.66917 17.6046 0.407958C17.3514 0.146747 17.008 0 16.65 0H1.35ZM18 6.03571H0V11.6071C0 11.9766 0.142232 12.3308 0.395406 12.592C0.64858 12.8533 0.991958 13 1.35 13H16.65C17.008 13 17.3514 12.8533 17.6046 12.592C17.8578 12.3308 18 11.9766 18 11.6071V6.03571Z",
                                fill: "#FF0000",
                              }),
                            }),
                          }),
                          i.jsxs("div", {
                            className:
                              "w-full h-[1.9375rem] flex items-center pl-4 border-[.05rem] border-white/[0.17] bg-white/5 rounded-[.5625rem]",
                            children: [
                              i.jsx("span", {
                                className:
                                  "w-[4.375rem] font-bold text-sm text-primary",
                                children: b.id,
                              }),
                              i.jsx("span", {
                                className:
                                  "w-[11.5625rem] font-semibold text-xs leading-[.5625rem] text-[#F2F2F2]",
                                children: b.name,
                              }),
                              i.jsxs("span", {
                                className:
                                  "w-[5.0625rem] text-center font-semibold text-xs leading-[.5625rem] text-[#F2F2F2]",
                                children: [
                                  "$",
                                  Number(b.value).toLocaleString("pt-BR"),
                                ],
                              }),
                              i.jsx("span", {
                                className:
                                  "ml-[3.8125rem] w-[8.1875rem] font-semibold text-xs text-center text-[#F2F2F2]",
                                children: b.date,
                              }),
                            ],
                          }),
                        ],
                      },
                      R
                    )
                  ),
                }),
              ],
            }),
          ],
        }),
      ],
    })
  );
}
function M7() {
  const { goals: l } = Me();

  return i.jsxs("div", {
    className: "flex flex-col gap-3 items-end",
    children: [
      i.jsxs("div", {
        className: "flex items-center gap-2 mr-1",
        children: [
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "SEG",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "TER",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "QUA",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "QUI",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "SEX",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "SAB",
          }),
          i.jsx("span", {
            className:
              "w-10 text-center text-white/60 text-[.6875rem] font-semibold",
            children: "DOM",
          }),
        ],
      }),
      i.jsx("div", {
        className: "w-full flex flex-col gap-2 overflow-y-auto",
        children: l.members.map((s) =>
          i.jsxs("div", {
            className:
              "w-full h-[3.125rem] rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/5 flex items-center pl-5",
            children: [
              i.jsxs("div", {
                className: "w-[12.5rem] flex flex-col gap-2",
                children: [
                  i.jsx("p", {
                    className:
                      "text-white/60 font-semibold text-[.5625rem] leading-[.5625rem]",
                    children: "ID",
                  }),
                  i.jsx("span", {
                    className:
                      "text-[#F2F2F2] text-[.8125rem] font-semibold leading-[.5625rem]",
                    children: s.id,
                  }),
                ],
              }),
              i.jsxs("div", {
                className: "w-[37.3125rem] flex flex-col gap-2",
                children: [
                  i.jsx("p", {
                    className:
                      "text-white/60 font-semibold text-[.5625rem] leading-[.5625rem]",
                    children: "NOME",
                  }),
                  i.jsx("span", {
                    className:
                      "text-[#F2F2F2] text-[.8125rem] font-semibold leading-[.5625rem]",
                    children: s.name,
                  }),
                ],
              }),
              i.jsx("div", {
                className: "flex items-center justify-end gap-2",
                children: s.status.map((a, c) =>
                  a === 1
                    ? i.jsxs(
                        "svg",
                        {
                          width: "40",
                          height: "40",
                          viewBox: "0 0 40 40",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M2.95892 23.625C1.66383 21.3818 1.66383 18.6182 2.95892 16.375L8.34012 7.05449C9.6352 4.81133 12.0286 3.42949 14.6188 3.42949L25.3812 3.42949C27.9714 3.42949 30.3648 4.81133 31.6599 7.05449L37.0411 16.375C38.3362 18.6182 38.3362 21.3818 37.0411 23.625L31.6599 32.9455C30.3648 35.1887 27.9714 36.5705 25.3812 36.5705L14.6188 36.5705C12.0286 36.5705 9.63521 35.1887 8.34012 32.9455L2.95892 23.625Z",
                              fill: "url(#paint0_radial_211_985)",
                              "fill-opacity": "0.45",
                              stroke: "#FF0000",
                              "stroke-width": "1.5",
                            }),
                            i.jsx("path", {
                              d: "M5.44338 22.5C4.55021 20.953 4.55021 19.047 5.44338 17.5L10.5566 8.6436C11.4498 7.09659 13.1004 6.1436 14.8867 6.1436L25.1132 6.1436C26.8996 6.1436 28.5502 7.09659 29.4434 8.6436L34.5566 17.5C35.4498 19.047 35.4498 20.953 34.5566 22.5L29.4434 31.3564C28.5502 32.9034 26.8996 33.8564 25.1132 33.8564L14.8868 33.8564C13.1004 33.8564 11.4498 32.9034 10.5566 31.3564L5.44338 22.5Z",
                              fill: "#FF0000",
                            }),
                            i.jsx("path", {
                              d: "M14 20L18.3333 24L27 16",
                              stroke: "#1E1E1E",
                              "stroke-width": "1.33333",
                              "stroke-linecap": "round",
                              "stroke-linejoin": "round",
                            }),
                            i.jsx("defs", {
                              children: i.jsxs("radialGradient", {
                                id: "paint0_radial_211_985",
                                cx: "0",
                                cy: "0",
                                r: "1",
                                gradientUnits: "userSpaceOnUse",
                                gradientTransform:
                                  "translate(20 -0.0571401) rotate(90) scale(44.4143 453.224)",
                                children: [
                                  i.jsx("stop", {}),
                                  i.jsx("stop", {
                                    offset: "1",
                                    "stop-opacity": "0",
                                  }),
                                ],
                              }),
                            }),
                          ],
                        },
                        c
                      )
                    : a === 2
                    ? i.jsxs(
                        "svg",
                        {
                          width: "40",
                          height: "40",
                          viewBox: "0 0 40 40",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M2.95892 23.625C1.66383 21.3818 1.66383 18.6182 2.95892 16.375L8.34012 7.05449C9.6352 4.81133 12.0286 3.42949 14.6188 3.42949L25.3812 3.42949C27.9714 3.42949 30.3648 4.81133 31.6599 7.05449L37.0411 16.375C38.3362 18.6182 38.3362 21.3818 37.0411 23.625L31.6599 32.9455C30.3648 35.1887 27.9714 36.5705 25.3812 36.5705L14.6188 36.5705C12.0286 36.5705 9.63521 35.1887 8.34012 32.9455L2.95892 23.625Z",
                              stroke: "#CCCCCC",
                              "stroke-opacity": "0.3",
                              "stroke-width": "1.5",
                            }),
                            i.jsx("path", {
                              d: "M5.44338 22.5C4.55021 20.953 4.55021 19.047 5.44338 17.5L10.5566 8.6436C11.4498 7.09659 13.1004 6.1436 14.8867 6.1436L25.1132 6.1436C26.8996 6.1436 28.5502 7.09659 29.4434 8.6436L34.5566 17.5C35.4498 19.047 35.4498 20.953 34.5566 22.5L29.4434 31.3564C28.5502 32.9034 26.8996 33.8564 25.1132 33.8564L14.8868 33.8564C13.1004 33.8564 11.4498 32.9034 10.5566 31.3564L5.44338 22.5Z",
                              fill: "#CCCCCC",
                              "fill-opacity": "0.3",
                            }),
                            i.jsx("path", {
                              "fill-rule": "evenodd",
                              "clip-rule": "evenodd",
                              d: "M20 21.0606L24.2427 25.3034C24.3842 25.44 24.5736 25.5156 24.7703 25.5139C24.9669 25.5122 25.155 25.4333 25.2941 25.2942C25.4332 25.1552 25.512 24.9671 25.5137 24.7704C25.5155 24.5738 25.4399 24.3843 25.3032 24.2429L21.0605 20.0001L25.3032 15.7574C25.4399 15.6159 25.5155 15.4265 25.5137 15.2298C25.512 15.0332 25.4332 14.8451 25.2941 14.706C25.155 14.5669 24.9669 14.4881 24.7703 14.4864C24.5736 14.4846 24.3842 14.5602 24.2427 14.6969L20 18.9396L15.7572 14.6969C15.6152 14.5636 15.4268 14.4909 15.232 14.494C15.0373 14.4972 14.8514 14.576 14.7137 14.7138C14.576 14.8516 14.4973 15.0375 14.4943 15.2323C14.4913 15.4271 14.5641 15.6154 14.6975 15.7574L18.9395 20.0001L14.6967 24.2429C14.6251 24.312 14.568 24.3948 14.5287 24.4863C14.4894 24.5778 14.4687 24.6762 14.4678 24.7758C14.4669 24.8754 14.4859 24.9742 14.5236 25.0663C14.5613 25.1585 14.617 25.2422 14.6874 25.3127C14.7579 25.3831 14.8416 25.4388 14.9338 25.4765C15.0259 25.5142 15.1247 25.5332 15.2243 25.5323C15.3239 25.5314 15.4223 25.5107 15.5138 25.4714C15.6053 25.4321 15.6881 25.375 15.7572 25.3034L20 21.0606Z",
                              fill: "#CCCCCC",
                            }),
                          ],
                        },
                        c
                      )
                    : i.jsxs(
                        "svg",
                        {
                          width: "40",
                          height: "40",
                          viewBox: "0 0 40 40",
                          fill: "none",
                          xmlns: "http://www.w3.org/2000/svg",
                          children: [
                            i.jsx("path", {
                              d: "M2.95892 23.625C1.66383 21.3818 1.66383 18.6182 2.95892 16.375L8.34012 7.05449C9.6352 4.81133 12.0286 3.42949 14.6188 3.42949L25.3812 3.42949C27.9714 3.42949 30.3648 4.81133 31.6599 7.05449L37.0411 16.375C38.3362 18.6182 38.3362 21.3818 37.0411 23.625L31.6599 32.9455C30.3648 35.1887 27.9714 36.5705 25.3812 36.5705L14.6188 36.5705C12.0286 36.5705 9.63521 35.1887 8.34012 32.9455L2.95892 23.625Z",
                              fill: "url(#paint0_radial_211_960)",
                              "fill-opacity": "0.45",
                              stroke: "#FFAA00",
                              "stroke-width": "1.5",
                            }),
                            i.jsx("path", {
                              d: "M5.44338 22.5C4.55021 20.953 4.55021 19.047 5.44338 17.5L10.5566 8.6436C11.4498 7.09659 13.1004 6.1436 14.8867 6.1436L25.1132 6.1436C26.8996 6.1436 28.5502 7.09659 29.4434 8.6436L34.5566 17.5C35.4498 19.047 35.4498 20.953 34.5566 22.5L29.4434 31.3564C28.5502 32.9034 26.8996 33.8564 25.1132 33.8564L14.8868 33.8564C13.1004 33.8564 11.4498 32.9034 10.5566 31.3564L5.44338 22.5Z",
                              fill: "#FFAA00",
                            }),
                            i.jsx("path", {
                              d: "M28 20C28 22.1217 27.1571 24.1566 25.6569 25.6569C24.1566 27.1571 22.1217 28 20 28C17.8783 28 15.8434 27.1571 14.3431 25.6569C12.8429 24.1566 12 22.1217 12 20C12 17.8783 12.8429 15.8434 14.3431 14.3431C15.8434 12.8429 17.8783 12 20 12C22.1217 12 24.1566 12.8429 25.6569 14.3431C27.1571 15.8434 28 17.8783 28 20ZM20 15.5C20 15.3674 19.9473 15.2402 19.8536 15.1464C19.7598 15.0527 19.6326 15 19.5 15C19.3674 15 19.2402 15.0527 19.1464 15.1464C19.0527 15.2402 19 15.3674 19 15.5V21C19 21.0881 19.0234 21.1747 19.0676 21.2509C19.1119 21.3271 19.1755 21.3903 19.252 21.434L22.752 23.434C22.8669 23.4961 23.0014 23.5108 23.127 23.4749C23.2525 23.4391 23.3591 23.3556 23.4238 23.2422C23.4886 23.1288 23.5065 22.9946 23.4736 22.8683C23.4408 22.7419 23.3598 22.6334 23.248 22.566L20 20.71V15.5Z",
                              fill: "#1E1E1E",
                            }),
                            i.jsx("defs", {
                              children: i.jsxs("radialGradient", {
                                id: "paint0_radial_211_960",
                                cx: "0",
                                cy: "0",
                                r: "1",
                                gradientUnits: "userSpaceOnUse",
                                gradientTransform:
                                  "translate(20 -0.0571401) rotate(90) scale(44.4143 453.224)",
                                children: [
                                  i.jsx("stop", {}),
                                  i.jsx("stop", {
                                    offset: "1",
                                    "stop-opacity": "0",
                                  }),
                                ],
                              }),
                            }),
                          ],
                        },
                        c
                      )
                ),
              }),
            ],
          })
        ),
      }),
    ],
  });
}
const P7 = "" + new URL("goal-BMfR1_IH.png", import.meta.url).href;
function O7() {
  const { goals: l } = Me();
  return i.jsx("div", {
    className: "w-full h-full flex flex-col gap-5",
    children: i.jsx("div", {
      className:
        "flex-1 rounded-xl p-5 flex flex-wrap gap-[1.125rem] border-[.05rem] border-white/25",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
      },
      children: l.my.map((s) =>
        i.jsxs(
          "div",
          {
            className:
              "w-[10.625rem] h-fit flex flex-col gap-[1.875rem] rounded-xl border-[.05rem] border-white/25 px-[.9375rem] py-5",
            style: {
              background:
                "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
            },
            children: [
              i.jsxs("div", {
                className: "flex flex-col items-center gap-5",
                children: [
                  i.jsx("div", {
                    className:
                      "size-[8.125rem] px-2.5 rounded-[.875rem] border-[.05rem] border-white/30 grid place-items-center",
                    style: {
                      background:
                        "radial-gradient(1133.06% 111.04% at 100.14% 50%, rgba(0, 0, 0, 0.45) 0%, rgba(0, 0, 0, 0.00) 100%)",
                    },
                    children: i.jsx("img", { src: P7, alt: "" }),
                  }),
                  i.jsxs("div", {
                    className: "flex flex-col items-center gap-[.9375rem]",
                    children: [
                      i.jsx("span", {
                        className:
                          "text-white text-sm font-extrabold leading-[.625rem]",
                        children: s.name,
                      }),
                      i.jsx("p", {
                        className:
                          "text-white/60 text-[.6875rem] font-semibold leading-[.5rem]",
                        children: s.item,
                      }),
                    ],
                  }),
                ],
              }),
              i.jsxs("div", {
                className:
                  "w-full h-8 bg-primary rounded-lg shadow-[0_0_14px_0] shadow-primary/45 flex items-center justify-center text-[#1E1E1E] font-extrabold text-[.6875rem] ",
                children: [s.current, "/", s.max],
              }),
            ],
          },
          s.name
        )
      ),
    }),
  });
}
function T7() {
  var _;
  const [l, s] = C.useState(""),
    [a, c] = C.useState(0),
    {
      setCurrent: d,
      update: m,
      goals: h,
      setGoals: p,
      permissions: y,
      setOpenedEditGoal: w,
      setOpenedNewGoal: E,
      setTypeNewGoal: g,
      setMax: b,
      setTitle: R,
      setDescription: P,
      setIndex: S,
    } = Me();
  return (
    (_ = h == null ? void 0 : h.members) == null ||
      _.filter(
        (M) =>
          String(M.id) === l ||
          M.name.toLocaleLowerCase().includes(l.toLocaleLowerCase())
      ),
    C.useEffect(() => {
      de(
        "GetGoals",
        {},
        {
          prize: "222.02",
          my: [
            { name: "ITEM1", item: "test1", needed: !0, current: 20, max: 20 },
            { name: "ITEM1", item: "test2", needed: !1, current: 20, max: 20 },
            { name: "ITEM1", item: "test3", needed: !0, current: 2, max: 20 },
          ],
          faction: [
            {
              title: "test1",
              description: "testsetstsdscasd",
              current: 10,
              max: 40,
            },
            {
              title: "test2",
              description: "testsetstsdscasd",
              current: 1,
              max: 50,
            },
            {
              title: "test3",
              description: "testsetstsdscasd",
              current: 1,
              max: 60,
            },
            {
              title: "test4",
              description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
              current: 1,
              max: 10,
            },
            {
              title: "test5",
              description: "testsetstsdscasd",
              current: 1,
              max: 70,
            },
          ],
          members: [
            { name: "João Sembraco", id: 2352, status: [1, 2, 1, 2, 1, 2, 0] },
          ],
        }
      ).then((Q) => {
        p(Q);
      });
    }, []),
    i.jsxs("div", {
      className:
        "w-full h-full p-[1.875rem] rounded-xl border-[.05rem] border-white/25 flex flex-col gap-6",
      style: {
        background:
          "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
      },
      children: [
        i.jsxs("div", {
          className: "w-full flex justify-between",
          children: [
            i.jsx("span", {
              className: "text-white text-base font-extrabold leading-3",
              children: "METAS",
            }),
            i.jsxs("div", {
              className: "flex items-center gap-2",
              children: [
                i.jsxs("div", {
                  className: "w-[16.875rem] relative",
                  children: [
                    i.jsxs("svg", {
                      className:
                        "absolute top-1/2 -translate-y-1/2 left-[.9375rem] size-4",
                      width: "16",
                      height: "16",
                      viewBox: "0 0 16 16",
                      fill: "none",
                      xmlns: "http://www.w3.org/2000/svg",
                      children: [
                        i.jsx("path", {
                          d: "M7.18016 12.1999C6.1873 12.1999 5.21673 11.9055 4.3912 11.3539C3.56566 10.8023 2.92224 10.0183 2.54228 9.10099C2.16233 8.1837 2.06292 7.17435 2.25662 6.20056C2.45031 5.22678 2.92842 4.3323 3.63048 3.63024C4.33254 2.92818 5.22702 2.45007 6.20081 2.25637C7.17459 2.06267 8.18394 2.16209 9.10123 2.54204C10.0185 2.92199 10.8025 3.56542 11.3541 4.39095C11.9057 5.21649 12.2002 6.18705 12.2002 7.17991C12.2002 7.83915 12.0703 8.49193 11.818 9.10099C11.5658 9.71004 11.196 10.2634 10.7298 10.7296C10.2637 11.1957 9.71028 11.5655 9.10123 11.8178C8.49218 12.0701 7.83939 12.1999 7.18016 12.1999ZM7.18016 3.16658C6.38903 3.16658 5.61567 3.40118 4.95788 3.8407C4.30008 4.28023 3.78739 4.90494 3.48464 5.63585C3.18189 6.36675 3.10268 7.17102 3.25702 7.94694C3.41136 8.72287 3.79232 9.4356 4.35173 9.99501C4.91114 10.5544 5.62387 10.9354 6.3998 11.0897C7.17572 11.2441 7.97999 11.1649 8.71089 10.8621C9.4418 10.5593 10.0665 10.0467 10.506 9.38886C10.9456 8.73107 11.1802 7.95771 11.1802 7.16658C11.1802 6.10572 10.7587 5.0883 10.0086 4.33815C9.25844 3.58801 8.24102 3.16658 7.18016 3.16658Z",
                          fill: "#CCCCCC",
                          "fill-opacity": "0.8",
                        }),
                        i.jsx("path", {
                          d: "M13.3331 13.8334C13.2675 13.8337 13.2024 13.8209 13.1417 13.7957C13.081 13.7705 13.026 13.7335 12.9798 13.6867L10.2265 10.9334C10.1382 10.8386 10.0901 10.7132 10.0924 10.5837C10.0946 10.4542 10.1471 10.3306 10.2387 10.239C10.3303 10.1474 10.4539 10.0949 10.5835 10.0926C10.713 10.0903 10.8384 10.1384 10.9331 10.2267L13.6865 12.9801C13.7801 13.0738 13.8327 13.2009 13.8327 13.3334C13.8327 13.4659 13.7801 13.593 13.6865 13.6867C13.6403 13.7335 13.5853 13.7705 13.5246 13.7957C13.4639 13.8209 13.3988 13.8337 13.3331 13.8334Z",
                          fill: "#CCCCCC",
                          "fill-opacity": "0.8",
                        }),
                      ],
                    }),
                    i.jsx("input", {
                      onChange: (M) => s(M.target.value),
                      type: "text",
                      placeholder: "Pesquisar",
                      className:
                        "w-full h-8 rounded-[.5625rem] border-[.05rem] border-white/[0.17] bg-white/5 pl-[2.25rem] text-[#D9D9D9]/80 text-[.6875rem] font-semibold focus:outline-none",
                    }),
                  ],
                }),
                i.jsx("button", {
                  className: ie(
                    "w-[11.25rem] h-8 rounded-[.5625rem] flex items-center justify-center bg-white/15 border-[.05rem] border-white/[0.17] text-[#D9D9D9]/80 text-xs font-extrabold leading-[.5625rem] duration-200 shadow-transparent shadow-[0_0_14px]",
                    a === 0 && "!shadow-primary/45 !bg-primary !text-[#1E1E1E]"
                  ),
                  onClick: () => c(0),
                  children: "METAS PESSOAIS",
                }),
                i.jsx("button", {
                  className: ie(
                    "w-[11.25rem] h-8 rounded-[.5625rem] flex items-center justify-center bg-white/15 border-[.05rem] border-white/[0.17] text-[#D9D9D9]/80 text-xs font-extrabold leading-[.5625rem] duration-200 shadow-transparent shadow-[0_0_14px]",
                    a === 1 && "!shadow-primary/45 !bg-primary !text-[#1E1E1E]"
                  ),
                  onClick: () => c(1),
                  children: "METAS MEMBROS",
                }),
              ],
            }),
          ],
        }),
        a === 0 ? i.jsx(O7, {}) : i.jsx(M7, {}),
      ],
    })
  );
}
function I7() {
  var h, p, y, w;
  const { user_id: l } = Me(),
    [s, a] = C.useState([]),
    [c, d] = C.useState("timePlayed");
  C.useEffect(() => {
    de("GetRankingPart", null, [
      {
        id: 1337,
        name: "João Sembraco",
        timePlayed: 1234,
        money: 5678,
        farm: 910,
      },
      { id: 2, name: "Maria Silva", timePlayed: 2345, money: 6789, farm: 123 },
      {
        id: 3,
        name: "Carlos Oliveira",
        timePlayed: 3456,
        money: 7890,
        farm: 456,
      },
      { id: 4, name: "Ana Costa", timePlayed: 4567, money: 8901, farm: 789 },
      { id: 5, name: "Pedro Santos", timePlayed: 5678, money: 9012, farm: 234 },
      {
        id: 6,
        name: "Lucas Almeida",
        timePlayed: 6789,
        money: 1234,
        farm: 567,
      },
      { id: 2, name: "Maria Silva", timePlayed: 2345, money: 6789, farm: 123 },
      {
        id: 3,
        name: "Carlos Oliveira",
        timePlayed: 3456,
        money: 7890,
        farm: 456,
      },
      { id: 4, name: "Ana Costa", timePlayed: 4567, money: 8901, farm: 789 },
      { id: 5, name: "Pedro Santos", timePlayed: 5678, money: 9012, farm: 234 },
      {
        id: 6,
        name: "Lucas Almeida",
        timePlayed: 6789,
        money: 1234,
        farm: 567,
      },
      { id: 2, name: "Maria Silva", timePlayed: 2345, money: 6789, farm: 123 },
      {
        id: 3,
        name: "Carlos Oliveira",
        timePlayed: 3456,
        money: 7890,
        farm: 456,
      },
      { id: 4, name: "Ana Costa", timePlayed: 4567, money: 8901, farm: 789 },
      { id: 5, name: "Pedro Santos", timePlayed: 5678, money: 9012, farm: 234 },
      {
        id: 6,
        name: "Lucas Almeida",
        timePlayed: 6789,
        money: 1234,
        farm: 567,
      },
    ]).then(a);
  }, []);
  const m = C.useMemo(
    () =>
      s.sort((E, g) =>
        c === "timePlayed"
          ? g.timePlayed - E.timePlayed
          : c === "money"
          ? g.money - E.money
          : c === "farm"
          ? g.farm - E.farm
          : 0
      ),
    [c, s]
  );
  return i.jsxs("div", {
    className:
      "flex-1 w-full h-full border-[.05rem] border-white/25 rounded-xl p-[1.875rem] flex flex-col gap-5",
    style: {
      background:
        "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
    },
    children: [
      i.jsxs("div", {
        className: "w-full flex justify-between",
        children: [
          i.jsx("span", {
            className: "text-white text-base leading-[.75rem] font-extrabold",
            children: "RANKING",
          }),
          i.jsxs("div", {
            className: "flex items-center gap-2",
            children: [
              i.jsx("button", {
                className: ie(
                  "w-[8.625rem] h-8 rounded-[.5625rem] flex items-center justify-center bg-white/15 border-[.05rem] border-white/[0.17] text-[#D9D9D9]/80 text-xs font-extrabold leading-[.5625rem] duration-200 shadow-transparent shadow-[0_0_14px]",
                  c === "timePlayed" &&
                    "!shadow-primary/45 !bg-primary !text-[#1E1E1E]"
                ),
                onClick: () => d("timePlayed"),
                children: "ONLINES",
              }),
              i.jsx("button", {
                className: ie(
                  "w-[8.625rem] h-8 rounded-[.5625rem] flex items-center justify-center bg-white/15 border-[.05rem] border-white/[0.17] text-[#D9D9D9]/80 text-xs font-extrabold leading-[.5625rem] duration-200 shadow-transparent shadow-[0_0_14px]",
                  c === "money" &&
                    "!shadow-primary/45 !bg-primary !text-[#1E1E1E]"
                ),
                onClick: () => d("money"),
                children: "DINHEIRO",
              }),
              i.jsx("button", {
                className: ie(
                  "w-[8.625rem] h-8 rounded-[.5625rem] flex items-center justify-center bg-white/15 border-[.05rem] border-white/[0.17] text-[#D9D9D9]/80 text-xs font-extrabold leading-[.5625rem] duration-200 shadow-transparent shadow-[0_0_14px]",
                  c === "farm" &&
                    "!shadow-primary/45 !bg-primary !text-[#1E1E1E]"
                ),
                onClick: () => d("farm"),
                children: "FARM",
              }),
            ],
          }),
        ],
      }),
      i.jsxs("div", {
        className: "w-full h-full flex flex-col gap-2.5 overflow-hidden",
        children: [
          i.jsx("div", {
            className:
              "w-full h-full flex-1 overflow-y-auto flex flex-col gap-2",
            children: m.map((E, g) =>
              i.jsxs("div", {
                className: "w-full h-[1.9375rem] flex items-center gap-2",
                children: [
                  i.jsx("div", {
                    className:
                      "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-white/[0.17]",
                    children: i.jsx("svg", {
                      width: "18",
                      height: "19",
                      viewBox: "0 0 18 19",
                      fill: "none",
                      xmlns: "http://www.w3.org/2000/svg",
                      children: i.jsx("path", {
                        d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                        fill:
                          g === 0
                            ? "#FF0000"
                            : g === 1
                            ? "#BEBEBE"
                            : g === 2
                            ? "#CD886B"
                            : "#CCCCCC",
                        fillOpacity: g > 2 ? 0.7 : 1,
                      }),
                    }),
                  }),
                  i.jsxs("div", {
                    className:
                      "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-white/[0.17] rounded-[.5625rem]",
                    children: [
                      i.jsxs("div", {
                        className: "flex items-center gap-2.5",
                        children: [
                          i.jsxs("span", {
                            className: ie(
                              "w-10 text-sm font-bold leading-[.625rem]",
                              g === 0
                                ? "text-[#FF0000]"
                                : g === 1
                                ? "text-[#BEBEBE]"
                                : g === 2
                                ? "text-[#CD886B]"
                                : "text-[#CCCCCC]/70"
                            ),
                            children: [g + 1, "º"],
                          }),
                          i.jsx("span", {
                            className:
                              "text-white text-xs font-semibold leading-[.625rem]",
                            children: E.name,
                          }),
                        ],
                      }),
                      i.jsx("div", {
                        className: "flex items-center gap-[.5625rem]",
                        children: i.jsx("span", {
                          className:
                            "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                          children:
                            c === "timePlayed"
                              ? `${Math.floor(Number(E.timePlayed) / 3600)}h ${
                                  Number(E.timePlayed) % 60
                                }min`
                              : c === "money"
                              ? `$${Number(E.money)}`
                              : Number(E.farm).toLocaleString("pt-BR"),
                        }),
                      }),
                    ],
                  }),
                ],
              })
            ),
          }),
          s.findIndex((E) => E.id === l) !== -1 &&
            i.jsxs("div", {
              className:
                "w-full flex-none flex flex-col gap-5 p-5 rounded-xl border-[.05rem] border-white/25",
              style: {
                background:
                  "linear-gradient(109deg, rgba(255, 0, 0, 0.00) 30%, rgba(255, 0, 0, 0.02) 100%), rgba(255, 255, 255, 0.05)",
              },
              children: [
                i.jsx("h3", {
                  className: "text-white text-base font-extrabold leading-3",
                  children: "SUA POSIÇÃO",
                }),
                i.jsxs("div", {
                  className: "w-full h-[1.9375rem] flex items-center gap-2",
                  children: [
                    i.jsx("div", {
                      className:
                        "w-[2.375rem] h-[1.9375rem] flex-none rounded-[.5625rem] grid place-items-center bg-white/5 border-[.05rem] border-primary",
                      children: i.jsx("svg", {
                        className: "text-primary",
                        width: "18",
                        height: "19",
                        viewBox: "0 0 18 19",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg",
                        children: i.jsx("path", {
                          d: "M9.00765 0.500115C7.1913 0.500115 5.54756 0.609108 4.33903 0.789147C3.73484 0.879147 3.24161 0.984433 2.87041 1.11513C2.68482 1.18048 2.52917 1.24946 2.39375 1.34803C2.26479 1.44192 2.1289 1.59108 2.11615 1.79707H2.08628C2.08628 2.18229 2.1007 2.56224 2.12866 2.93642H1.0968C1.09202 2.63252 1.09692 2.32794 1.11178 2.024L0.043912 1.784C-0.296377 5.86064 1.35847 9.82843 4.40387 12.6541L5.02737 11.5231C4.8614 11.3912 4.69992 11.2542 4.54318 11.1123C4.77865 10.8762 5.03563 10.6608 5.31106 10.4686C5.84747 10.972 6.43349 11.3692 7.05604 11.6402C7.93679 12.3183 7.37677 12.7625 6.12009 13.0255C8.46447 13.4306 7.6713 15.4051 5.55752 16.5534C5.47229 16.5637 5.38801 16.5734 5.3074 16.5844C4.82759 16.6501 4.43613 16.7262 4.13622 16.8233C3.98627 16.8718 3.8591 16.9226 3.74169 17.0012C3.6242 17.0798 3.47779 17.2192 3.47779 17.4371C3.47779 17.655 3.62424 17.7933 3.74169 17.8718C3.8591 17.9504 3.98623 18.0013 4.13622 18.0498C4.43613 18.1469 4.82763 18.223 5.3074 18.2887C6.26701 18.42 7.56898 18.5 9.00765 18.5C10.4463 18.5 11.7483 18.42 12.7079 18.2887C13.1877 18.223 13.5792 18.1469 13.8791 18.0498C14.029 18.0013 14.1562 17.9504 14.2736 17.8719C14.391 17.7933 14.5375 17.655 14.5375 17.4372C14.5375 17.2192 14.391 17.0798 14.2736 17.0012C14.1562 16.9227 14.0291 16.8718 13.8791 16.8233C13.5792 16.7262 13.1877 16.6501 12.7078 16.5844C12.6276 16.5735 12.5437 16.5636 12.4589 16.5534C10.345 15.4051 9.55185 13.4307 11.8963 13.0255C10.639 12.7624 10.079 12.3177 10.9616 11.639C11.5885 11.3658 12.1783 10.9643 12.7177 10.4555C12.9825 10.6379 13.2291 10.8391 13.4533 11.0562C13.2893 11.2166 13.1203 11.3723 12.9467 11.5231L13.5915 12.6541C16.7426 9.90422 18.2193 5.79307 17.9737 1.76237L16.8848 2.06696C16.9027 2.35778 16.9102 2.64746 16.9071 2.93638H15.8878C15.9161 2.55719 15.9302 2.17715 15.9301 1.79699H15.9003C15.8874 1.59101 15.7504 1.44185 15.6215 1.34795C15.486 1.24935 15.3303 1.18045 15.1447 1.1151C14.7735 0.984318 14.2803 0.879032 13.6761 0.789032C12.4676 0.609032 10.8239 0.5 9.00745 0.5L9.00765 0.500115ZM9.00765 1.21431C10.7928 1.21431 12.41 1.32338 13.5617 1.49493C14.1376 1.58073 14.5996 1.68341 14.8885 1.78515C14.9299 1.79975 14.9592 1.81381 14.9931 1.82814C14.9592 1.84247 14.9301 1.8565 14.8885 1.87113C14.5997 1.97287 14.1376 2.07674 13.5617 2.16253C12.41 2.33413 10.7928 2.4432 9.00765 2.4432C7.22256 2.4432 5.60535 2.33409 4.45357 2.1625C3.87766 2.0767 3.41566 1.97283 3.12683 1.8711C3.08501 1.85634 3.05633 1.84251 3.02228 1.8281C3.05625 1.81373 3.08509 1.79982 3.12683 1.78511C3.41566 1.68338 3.8777 1.58065 4.45361 1.49489C5.60535 1.3233 7.22252 1.21431 9.00765 1.21431ZM1.1516 3.96108H2.24066C2.56155 6.17298 3.365 8.12019 4.4785 9.55026C4.20074 9.76962 3.94453 10.0076 3.71429 10.2644C2.17502 8.48906 1.36277 6.2652 1.1516 3.96108ZM15.7759 3.96108H16.8513C16.6289 6.24005 15.7457 8.40005 14.2599 10.1832C14.0409 9.9497 13.8033 9.73287 13.5493 9.5347C14.6569 8.10617 15.456 6.16496 15.7759 3.96112V3.96108Z",
                          fill: "currentColor",
                        }),
                      }),
                    }),
                    i.jsxs("div", {
                      className:
                        "w-full h-full flex items-center justify-between pl-[.9375rem] pr-[1.5625rem] bg-white/5 border-[.05rem] border-primary rounded-[.5625rem]",
                      children: [
                        i.jsxs("div", {
                          className: "flex items-center gap-2.5",
                          children: [
                            i.jsxs("span", {
                              className:
                                "w-10 text-primary text-sm font-bold leading-[.625rem]",
                              children: [
                                s.findIndex((E) => E.id === l) + 1,
                                "º",
                              ],
                            }),
                            i.jsx("span", {
                              className:
                                "w-[3.5rem] h-[1.125rem] rounded-md grid place-items-center text-[#1E1E1E] text-xs font-bold leading-[.625rem] bg-primary shadow-[0_0_14px] shadow-primary/45",
                              children: "VOCÊ",
                            }),
                          ],
                        }),
                        i.jsx("div", {
                          className: "flex items-center gap-[.5625rem]",
                          children: i.jsx("span", {
                            className:
                              "text-[#CCCCCC]/70 text-xs leading-[.5625rem] font-medium",
                            children:
                              c === "timePlayed"
                                ? `${Math.floor(
                                    Number(
                                      (h = s.find((E) => E.id === l)) == null
                                        ? void 0
                                        : h.timePlayed
                                    ) / 3600
                                  )}h ${
                                    Number(
                                      (p = s.find((E) => E.id === l)) == null
                                        ? void 0
                                        : p.timePlayed
                                    ) % 60
                                  }min`
                                : c === "money"
                                ? `$${Number(
                                    (y = s.find((E) => E.id === l)) == null
                                      ? void 0
                                      : y.money
                                  )}`
                                : Number(
                                    (w = s.find((E) => E.id === l)) == null
                                      ? void 0
                                      : w.farm
                                  ).toLocaleString("pt-BR"),
                          }),
                        }),
                      ],
                    }),
                  ],
                }),
              ],
            }),
        ],
      }),
    ],
  });
}
J4.createRoot(document.getElementById("root")).render(
  i.jsx(_t.StrictMode, {
    children: i.jsx(Ku, {
      children: i.jsx(c6, {
        children: i.jsx(z8, {
          children: i.jsxs(Wu, {
            children: [
              i.jsx(i1, { path: "/", element: i.jsx(v7, {}) }),
              i.jsx(i1, { path: "/members", element: i.jsx(j7, {}) }),
              i.jsx(i1, { path: "/settings", element: i.jsx(b7, {}) }),
              i.jsx(i1, { path: "/partners", element: i.jsx(D7, {}) }),
              i.jsx(i1, { path: "/bank", element: i.jsx(R7, {}) }),
              i.jsx(i1, { path: "/goals", element: i.jsx(T7, {}) }),
              i.jsx(i1, { path: "/ranking", element: i.jsx(I7, {}) }),
            ],
          }),
        }),
      }),
    }),
  })
);