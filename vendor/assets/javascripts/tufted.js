(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var basechart = require('./lib/baseChart');
var barchart = require('./lib/barChart');
var groupedbarchart = require('./lib/groupedBarChart');
var linechart = require('./lib/lineChart');
var stackedbarchart = require('./lib/stackedBarChart');
// var legendmixin = require('./lib/legendMixin');
// module.exports = {
//   barchart: barchart,
//   basechart: basechart,
//   groupedbarchart: groupedbarchart,
//   linechart: linechart,
//   stackedbarchart: stackedbarchart
// } 





exports.barchart = barchart
exports.basechart = basechart
exports.groupedbarchart = groupedbarchart
exports.linechart = linechart
exports.stackedbarchart = stackedbarchart
// exports.legendmixin = legendmixin

},{"./lib/barChart":2,"./lib/baseChart":3,"./lib/groupedBarChart":4,"./lib/lineChart":5,"./lib/stackedBarChart":6}],2:[function(require,module,exports){
d3.chart("BaseChart").extend("BarChart", {

  initialize: function() {
    var chart = this;

    chart.xScale = d3.scale.ordinal().rangeRoundBands([0, chart.width()], 0.1);
    chart.yScale = d3.scale.linear().rangeRound([chart.height(), 0]);
    chart.color = d3.scale.category10();
    chart.duration = 500;
    chart.on('change:width', function(newWidth) {
      chart.xScale.rangeRoundBands([0, newWidth], 0.1);
    });

    chart.on('change:height', function(newHeight) {
      chart.yScale.range([newHeight, 0]);
    }); 

    chart.areas.yAxisLayer = chart.base.select('g').append('g')
      .classed('ylabels', true)

    chart.layers.bars = chart.base.select('g').append('g')
      .classed('bars', true)

    chart.areas.legend = chart.base.select('g').append('g')
      .attr("transform", "translate(0, -40)");

    chart.layer('bars', chart.layers.bars, {

      dataBind: function(data) {

        var chart = this.chart();
        
        var yAxis = d3.svg.axis()
            .scale(chart.yScale)
            .tickSize(-(chart.width()), 0, 0)
            .orient("left")
            .tickFormat(d3.format(".2s"));

        chart.areas.yAxisLayer
            .call(yAxis)
          .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", -40)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(chart.yAxisLabel());

        chart.areas.yAxisLayer
            .selectAll("text")
            .style("font", "12px 'gill sans'")

        var xAxis = d3.svg.axis()
          .scale(chart.xScale)
          .orient("bottom");

        if (chart._tickValues.length > 0) {
          xAxis.tickValues(chart._tickValues);
        }

        chart.base.select('g').append('g')
              .classed('x axis',true)
              .attr("transform", "translate(0," + chart.height() + ")")
              .call(xAxis)
              .selectAll("text")
              .attr("style", "font: 12px 'gill sans'; text-anchor: middle")
              .call(chart.wrap, 60)

        chart.areas.legend =
          chart.areas.legend
          .selectAll(".legend")
          .data(chart.xScale.domain())
            .enter().append("g")
            .attr("class", "legend")

        chart.areas.legend
            .append("circle")
              .attr("r", 5)
              .attr("cx", function(d,i) {
                return 1 + (i * 100);
              })
              .attr("fill", function(d) {
                return chart.colorScale(d);
              })
              .attr("cy", 5)

        chart.areas.legend
            .append("text")
            .attr("transform", function (d,i) {
              return "translate(" + (10 + (i*100)) + ",0)";
            })
            .attr("dy", ".71em")
            .attr("x", 0)
            .attr("y", 0)
            .attr("style", "font: 12px 'gill sans';")
            .text(function(d) { 
              return d;
            })
            .call(chart.wrap, 85)


        // chart.areas.legend
        //   .selectAll("circle")
        // .data(chart.xScale.domain())
        //   .enter()
        //   .append("circle")
        //   .attr("cx", chart.width() + chart._margin.right/8 )
        //   .attr("cy", function(d,i) {
        //     return  i * 15 })
        //   .attr("r", 5)
        //   .attr("fill", chart.color)

        // chart.areas.legend
        //   .selectAll("text")
        // .data(chart.xScale.domain())
        //   .enter()
        //   .append("text")
        //   .attr("x", chart.width() + chart._margin.right/8 + 15)
        //   .attr("y", function(d,i) {
        //     return i * 15 
        //   })
        //   .attr("dy", ".35em")
        //   .style("text-anchor", "beginning")
        //   .text(function(d) { return d; });

      return this.selectAll('.bar')
        .data(data);
      },

      // insert actual rects
      insert: function() {
        return this.append('rect')
          .attr('class', function(d,i){
            return "bar-" + i;
          });
      },


      // define lifecycle events
      events: {
        'enter': function() {
          var chart = this.chart();

          this.attr('x', function(d) { return chart.xScale(d.name); })
            // .attr("title", function(d) { return d.name })
            .attr("class", "bar")
            .attr("data-content", function(d) { return  "Estimate: " + d.value + '%' })
            .attr("data-legend", function(d) { return d.name })
            .attr('y', function(d) { return chart.yScale(0); })
            .attr('width', chart.xScale.rangeBand())
            .attr('height', 0)

            // .on("mouseover", function() {
            //   d3.select(this)
            //     .style("opacity", 1)
            // })
            // .on("mouseout", function() {
            //   d3.select(this)
            //     .style("opacity", 0.8)
            // })
            .style('fill', function(d) {return chart.colorScale(d.name);});
        },

        'enter:transition': function() {
          var chart = this.chart();

          this.duration(chart.duration)
            .attr('y', function(d) { return chart.yScale(d3.max([0, d.value])); })
            .attr('height', function(d) { return Math.abs(chart.yScale(d.value) - chart.yScale(0)); });            

          $(document).ready(function () {
              $("svg rect").popover({
                  'container': 'body',
                  'placement': 'right',
                  'trigger': 'hover',
                  'html': true
              });
          });
        }
      }
    });



  },
  // set/get the color to use for the circles as they are
  // rendered.
  transform: function(data) {
    var chart = this;

    var max = d3.max(data, function(d) { return d.value });
    var min = d3.min(data, function(d) { return d.value });

    if (min > 0) {
      min = 0;
    }

    // // update the scales
    chart.xScale.domain(data.map(function(d) { return d.name; }));
    chart.yScale.domain([min,max]);

    return data;
  }
});
},{}],3:[function(require,module,exports){

  // obtains element computed style
  // context is chart

d3.chart("BaseChart", {

  initialize: function () {
    var chart = this;

    chart.areas = {};
    chart.layers = {};

    chart.areas.legend = {};

    this._tickValues = [];
    this._yAxisLabel = "Y-Axis";
    this._margin = {top: 60, right: 20, bottom: 80, left: 60};
    this._width  = setInitialWidth();
    this._height = setInitialHeight();
    this.colorScale = d3.scale.category10();
    this.updateContainerWidth();
    this.updateContainerHeight();


    function setInitialWidth () {
      if (chart.base.attr('width')) {
        return chart.base.attr('width') - chart._margin.left - chart._margin.right;
      } else {
        return numbersOnly(getComputedStyle(chart.base.node().parentNode).width) - chart._margin.left - chart._margin.right;
      }
    }

    function setInitialHeight() {
      if (chart.base.attr('height')) {
        return chart.base.attr('height') - chart._margin.top - chart._margin.bottom;
      } else {
        return numbersOnly(getComputedStyle(chart.base.node().parentNode).height) - chart._margin.top - chart._margin.bottom;
      }
    }

    function numbersOnly(string) {
      var regex = /([0-9,]{1,})/;
      var match = regex.exec(string);

      return parseInt(match[0]);
    }

    this.base.append('g')
      .attr('transform', 'translate(' + this._margin.left + ',' + this._margin.top + ')');

  },


  updateContainerWidth: function() { this.base.attr('width', this._width + this._margin.left + this._margin.right); },

  updateContainerHeight: function() { this.base.attr('height', this._height + this._margin.top + this._margin.bottom); },

  width: function(newWidth) {
    if (arguments.length === 0) {
      return this._width;
    }

    // only if the width actually changed:
    if (this._width !== newWidth) {

      var oldWidth = this._width;

      this._width = newWidth;

      // set higher container width
      this.updateContainerWidth();

      // trigger a change event
      this.trigger('change:width', newWidth, oldWidth);
    }

    // always return the chart, for chaining magic.
    return this;
  },

  height: function(newHeight) {
    if (arguments.length === 0) {
      return this._height;
    }

    var oldHeight = this._height;

    this._height = newHeight;

    if (this._height !== oldHeight) {

      this.updateContainerHeight();

      this.trigger('change:height', newHeight, oldHeight);
    }

    return this;
  },

  parseDate: function(string) {

    this.parseDate = d3.time.format("%Y").parse;
    return this.parseDate(string);
  },

  tickValues: function(collection) {
    if (arguments.length === 0) {
      return this._tickValues;
    }

    if (Array.isArray(collection)) {
      this._tickValues = collection
    } 

    return this;
  },

  xScale: function (scale_object) {
    if (!arguments.length) {
      scale_object = d3.scale.ordinal()
    }
    if (colorScale instanceof Object) {
      scale_object = d3.scale.ordinal()
        .range(colorScale)
    }
    if (this.data) this.draw(this.data);

    return this;
  },

  yAxisLabel: function(string) {
    if (arguments.length === 0) {
      return this._yAxisLabel;
    }

    if (typeof string === "string") {
      this._yAxisLabel = string
    } 

    return this;
  },

  colors: function(colorScale) {

    if (!arguments.length) {
      colorScale = d3.scale.category10();
      // return this.colorScale;
    }
    if (colorScale instanceof Array) {
      colorScale = d3.scale.ordinal()
        .range(colorScale)
        // .domain([0, colorScale.length-1]);

    }
    this.colorScale = colorScale;
    if (this.data) this.draw(this.data);

    return this;
  },

  wrap: function(text, width) {
    text.each(function() {
      var text = d3.select(this),
          words = text.text().split(/\s+/).reverse(),
          word,
          line = [],
          lineNumber = 0,
          lineHeight = 1.1, // ems
          y = text.attr("y"),
          dy = parseFloat(text.attr("dy")),
          tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
      while (word = words.pop()) {
        line.push(word);
        tspan.text(line.join(" "));
        if (tspan.node().getComputedTextLength() > width) {
          line.pop();
          tspan.text(line.join(" "));
          line = [word];
          tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
        }
      }
    });
  }
});


  // function _style(attr) {
  //   var style,
  //     element = this.base[0][0];
  //   if (window.getComputedStyle) {
  //     style = window.getComputedStyle(element);
  //   } else if (element.currentStyle) {
  //     style = element.currentStyle;
  //   }

  //   if (!attr) {
  //     return style;
  //   } else {
  //     return style[attr];
  //   }
  // }

  // // converts pixel values
  // var _toNumFromPx = (function() {
  //   var rx = /px$/;
  //   return function(value) {
  //     if (rx.test(value)) {
  //       return +(value.replace(rx, ""));
  //     } else {
  //       return value;
  //     }
  //   };
  // }());


  // // helper attribute setter on chart base.
  // // context is chart
  // function _initAttr(internalName, d3Name, defaultValue) {
  //   var current = _toNumFromPx(_style.call(this, d3Name));

  //   if (current === null || current === 0 || current === "") {
  //     this[internalName] = defaultValue;
  //     this.base.style(d3Name, defaultValue);
  //   } else {
  //     this[internalName] = _toNumFromPx(_style.call(this, d3Name));
  //   }
  // }

  // // Borrowed from Underscore.js 1.5.2
  // //     http://underscorejs.org
  // //     (c) 2009-2013 Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
  // //     Underscore may be freely distributed under the MIT license.
  // // Returns a function, that, as long as it continues to be invoked, will not
  // // be triggered. The function will be called after it stops being called for
  // // N milliseconds. If `immediate` is passed, trigger the function on the
  // // leading edge, instead of the trailing.
  // function _debounce(func, wait, immediate) {
  //   var timeout, args, context, timestamp, result;
  //   return function() {
  //     context = this;
  //     args = arguments;
  //     timestamp = new Date();
  //     var later = function() {
  //       var last = (new Date()) - timestamp;
  //       if (last < wait) {
  //         timeout = setTimeout(later, wait - last);
  //       } else {
  //         timeout = null;
  //         if (!immediate) { result = func.apply(context, args); }
  //       }
  //     };
  //     var callNow = immediate && !timeout;
  //     if (!timeout) {
  //       timeout = setTimeout(later, wait);
  //     }
  //     if (callNow) { result = func.apply(context, args); }
  //     return result;
  //   };
  // }

  // // go over existing modes and determine which we are in
  // // returns true if a mode change occured, false otherwise.
  // function _determineMode() {
  //   var oldMode = this._currentMode;
  //   this._currentMode = null;

  //   if ("modes" in this) {
  //     var result = false;
  //     for (var mode in this._modes) {
  //       result = this._modes[mode].call(this);
  //       if (result) {
  //         this._currentMode = mode;
  //         break;
  //       }
  //     }
  //   }
  //   return oldMode !== this._currentMode;
  // }

  // // takes care of removing/adding appropriate layers
  // function _onModeChange() {

  //   var chart = this;

  //   for(var layerName in chart._layersArguments) {
      
  //     // is this chart in the current mode?
  //     var layerArgs = chart._layersArguments[layerName];
      
  //     // if this layer should not exist in the current mode
  //     // unlayer it and then save it so we can reattach it 
  //     // later.
  //     if (layerArgs.options.modes.indexOf(chart.mode()) === -1) {

  //       // is it showing?
  //       if (layerArgs.showing === true) {
          
  //         // nope? remove it.
  //         var removedLayer = chart.unlayer(layerName);
  //         removedLayer.style("display","none");
  //         chart._layersArguments[layerName].showing = false;
  //         chart._layersArguments[layerName].layer = removedLayer;
  //       }
      
  //     } else {

  //       // this layer is not showing, we need to add it
  //       if (chart._layersArguments[layerName].showing === false) {

  //         // if the layer has already been created, just re-add it
  //         if (chart._layersArguments[layerName].layer !== null) {
  //           oldLayer.call(chart, layerName, chart._layersArguments[layerName].layer);
  //           chart._layersArguments[layerName].layer.style("display","inline");
  //         } else {

  //           // this layer must not have been drawn in the initial rendering
  //           // but we do have the arguments, so render it using the
  //           // old layering.
  //           oldLayer.call(chart,
  //             chart._layersArguments[layerName].name,
  //             chart._layersArguments[layerName].selection,
  //             chart._layersArguments[layerName].options);
  //         }

  //         chart._layersArguments[layerName].showing = true;
  //       }
  //     }
  //   }
  // }

  // var BaseChart = d3.chart("BaseChart", {
  //   initialize: function() {


  //     var chart = this;

  //     chart.areas = {};
  //     chart.layers = {};
  //     // layer structures container - for layers that are
  //     // created on initialize but do not actually need to 
  //     // be rendered in the detected mode, we need to save the
  //     // actual arguments so that we can construct it later.
  //     this._layersArguments = {};
  //     this._tickValues = [];
  //     // save mode functions
  //     this._modes = this.modes || {};
  //     delete this.modes;

  //     // store layers referenced per mode
  //     this._modeLayers = {};

  //     // determine current mode on initialization
  //     _determineMode.call(this);

  //     // setup some reasonable defaults
  //     chart._width  = _toNumFromPx(_style.call(chart, "width")) || 200;
  //     chart._height = _toNumFromPx(_style.call(chart, "height")) || 200;

  //     // make sure container height and width are set.
  //     _initAttr.call(this, "_width", "width", 200);
  //     _initAttr.call(this, "_height", "height", 200);

  //     // bind to winow resize end
  //     window.addEventListener("resize", _debounce(function() {

  //       // trigger generic resize event
  //       chart.trigger("resize");

  //       // don't overwrite % widths.
  //       if (!isNaN(chart._width)) {
  //         chart.width(_toNumFromPx(_style.call(chart, "width")) || 200, {
  //           noDraw : true
  //         });
  //       }
  //       if (!isNaN(chart._height)) {
  //         chart.height(_toNumFromPx(_style.call(chart, "height")) || 200, {
  //           noDraw: true
  //         });
  //       }
        
  //       // update current mode
  //       var changed = _determineMode.call(chart);
  //       if (changed) {
  //         chart.trigger("change:mode", this._currentMode);
  //       }

  //       // only redraw if there is data
  //       if (chart.data) {
  //         chart.draw(chart.data);
  //       }

  //     }, 150));

  //     window.addEventListener("orientationchange", function() {
  //       // redraw on device rotation
  //       chart.trigger("change:mode", this._currentMode);

  //       // only redraw if there is data
  //       if (chart.data) {
  //         chart.draw(chart.data);
  //       }
  //     }, false);

  //     // on mode change, update height and width, and redraw
  //     // the chart
  //     chart.on("change:mode", function() {

  //       // sort out current mode
  //       _onModeChange.call(chart);
       
  //     });
  //   },

  //   // returns current mode
  //   mode : function() {
  //     return this._currentMode;
  //   },

  //   recomputeMode: function() {
  //     var changed = _determineMode.call(this);
  //     if (changed) {
  //       this.trigger("change:mode", this._currentMode);
  //     }
  //     return changed;

  //   },

  //   width: function(newWidth, options) {
  //     options = options || {};
  //     if (arguments.length === 0) {
  //       if (this._width && !isNaN(+this._width)) {
  //         return this._width;
  //       } else {
  //         return _toNumFromPx(_style.call(this, "width"));
  //       }
  //     }

  //     var oldWidth = this._width;

  //     this._width = newWidth;

  //     // only if the width actually changed:
  //     if (this._width !== oldWidth) {

  //       // set higher container width
  //       this.base.style("width", isNaN(this._width) ?
  //         this._width :
  //         this._width + "px");

  //       // trigger a change event
  //       if (!options.silent) {
  //         this.trigger("change:width", this._width, oldWidth);
  //       }

  //       // redraw if we saved the data on the chart
  //       if (this.data && !options.noDraw) {
  //         this.draw(this.data);
  //       }
  //     }

  //     // always return the chart, for chaining magic.
  //     return this;
  //   },

  //   height: function(newHeight, options) {
  //     options = options || {};
  //     if (arguments.length === 0) {
  //       if (this._height && !isNaN(+this._height)) {
  //         return this._height;
  //       } else {
  //         return _toNumFromPx(_style.call(this, "height"));
  //       }
  //     }

  //     var oldHeight = this._height;

  //     this._height = newHeight;

  //     if (this._height !== oldHeight) {

  //       this.base.style("height", isNaN(this._height) ?
  //         this._height :
  //         this._height + "px");

  //       if (!options.silent) {
  //         this.trigger("change:height", this._height, oldHeight);
  //       }

  //       if (this.data && !options.noDraw) {
  //         this.draw(this.data);
  //       }
  //     }

  //     return this;
  //   },

  //   parseDate: function(string) {

  //     this.parseDate = d3.time.format("%Y").parse;
  //     return this.parseDate(string);
  //   },

  //   tickValues: function(collection) {
  //     if (arguments.length === 0) {
  //       return this._tickValues;
  //     }

  //     if (Array.isArray(collection)) {
  //       this._tickValues = collection
  //     } 

  //     return this;
  //   },

  //   xScale: function (scale_object) {
  //     if (!arguments.length) {
  //       scale_object = d3.scale.ordinal()
  //     }
  //     if (colorScale instanceof Object) {
  //       scale_object = d3.scale.ordinal()
  //         .range(colorScale)
  //     }
  //     if (this.data) this.draw(this.data);

  //     return this;
  //   },

  //   yAxisLabel: function(string) {
  //     if (arguments.length === 0) {
  //       return this._yAxisLabel;
  //     }

  //     if (typeof string === "string") {
  //       this._yAxisLabel = string
  //     } 

  //     return this;
  //   },

  //   colors: function(colorScale) {

  //     if (!arguments.length) {
  //       colorScale = d3.scale.category10();
  //       // return this.colorScale;
  //     }
  //     if (colorScale instanceof Array) {
  //       colorScale = d3.scale.ordinal()
  //         .range(colorScale)
  //         // .domain([0, colorScale.length-1]);

  //     }
  //     this.colorScale = colorScale;
  //     if (this.data) this.draw(this.data);

  //     return this;
  //   },

  //   wrap: function(text, width) {
  //     text.each(function() {
  //       var text = d3.select(this),
  //           words = text.text().split(/\s+/).reverse(),
  //           word,
  //           line = [],
  //           lineNumber = 0,
  //           lineHeight = 1.1, // ems
  //           y = text.attr("y"),
  //           dy = parseFloat(text.attr("dy")),
  //           tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
  //       while (word = words.pop()) {
  //         line.push(word);
  //         tspan.text(line.join(" "));
  //         if (tspan.node().getComputedTextLength() > width) {
  //           line.pop();
  //           tspan.text(line.join(" "));
  //           line = [word];
  //           tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
  //         }
  //       }
  //     });
  //   }
  // });
  
  // var oldLayer = BaseChart.prototype.layer;
  // BaseChart.prototype.layer = function(name, selection, options) {

  //   var chart = this;

  //   // just return an existing layer if all we are
  //   // passed is the name argument
  //   if (arguments.length === 1) {
  //     return oldLayer.call(this, name);
  //   }

  //   // save all the layer arguments. For layers that are created
  //   // but do not need to be rendered in the current mode, this
  //   // will ensure their arguments are intact for when they do
  //   // need to be created.
  //   chart._layersArguments[name] = {
  //     name : name,
  //     selection: selection,
  //     options : options,
  //     showing: false, // default hidden
  //     layer: null // layer handle
  //   };


  //   // create the layer if it should exist in the curret
  //   // mode.
  //   var layer;
  //   if (typeof options.modes === "undefined" ||
  //       ("modes" in options &&
  //         options.modes.indexOf(chart.mode()) > -1)) {

  //     // run default layer code
  //     layer = oldLayer.call(this, name, selection, options);

  //     // mark layer as showing.
  //     chart._layersArguments[name].showing = true;
  //     chart._layersArguments[name].layer = layer;
  //   }

  //   if ("modes" in options) {

  //     // save available modes on the layer if we created it
  //     if (layer) {
  //       layer._modes = options.modes;
  //     }

  //     // cache the layer under the mode name. This will be useful
  //     // when we are repainting layers.
  //     options.modes.forEach(function(mode) {
        
  //       // make sure mode exists
  //       if (mode in chart._modes) {
          
  //          chart._modeLayers[mode] = chart._modeLayers[mode] || [];

  //          // save the layer as being mapped to this mode.
  //          chart._modeLayers[mode].push(name);

  //       } else {
  //         throw new Error("Mode " + mode + " is not defined");
  //       }
  //     });

  //   // make sure this layer has all modes if none were
  //   // specified as an option.  
  //   } else if (chart._modes) {
      
  //     var allModes = Object.keys(chart._modes);
      
  //     if (layer) {
  //       layer._modes = allModes;
  //     }

  //     allModes.forEach(function(mode) {
  //       chart._modeLayers[mode] = chart._modeLayers[mode] || [];
  //       chart._modeLayers[mode].push(name);
  //     });

  //     // mark layer as showing.
  //     chart._layersArguments[name].showing = true;
  //     chart._layersArguments[name].layer = layer;
  //   }

  //   return layer;
  // };
  
},{}],4:[function(require,module,exports){
d3.chart('BaseChart').extend('GroupedBarChart', {
  initialize : function() {
    var chart = this;

    chart.xScale = d3.scale.ordinal()
      .rangeRoundBands([0, chart.width()], 0.1);
    chart.x1Scale = d3.scale.ordinal();
    chart.yScale = d3.scale.linear()
      .range([chart.height(), 0]);
    chart.color = d3.scale.category10();
    chart.duration = 500;

    chart.yAxis = d3.svg.axis()
      .scale(chart.yScale)
      .tickSize(-chart.width(), 0, 0)
      .orient("left")
      .tickFormat(d3.format(".2s"));
 
    chart.on("change:width", function(newWidth) {
      chart.xScale.rangeRoundBands([0, newWidth], 0.1);
    });

    chart.on("change:height", function(newHeight) {
      chart.yScale.range([newHeight, 0]);
    });

    chart.areas.yAxisLayer = chart.base.select('g').append('g')
      .classed('ylabels', true)

    chart.layers.bars = chart.base.select('g').append('g')
      .classed('bars', true)

    chart.areas.legend = chart.base.select('g').append('g')
      .attr("transform", "translate(0, -40)");

    chart.layer('bars', chart.layers.bars, {
      dataBind: function(data) {
        var chart = this.chart();
 
        var yAxis = d3.svg.axis()
            .scale(chart.yScale)
            .tickSize(-(chart.width()), 0, 0)
            .orient("left")
            .tickFormat(d3.format(".2s"));

        chart.areas.yAxisLayer
            .call(yAxis)
          .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", -40)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(chart.yAxisLabel());

        chart.areas.yAxisLayer
            .selectAll("text")
            .style("font", "12px 'gill sans'")

        var xAxis = d3.svg.axis()
          .scale(chart.xScale)
          .orient("bottom")

        if (chart._tickValues.length > 0) {
          xAxis.tickValues(chart._tickValues);
        }

        chart.base.select('g').append('g')
              .classed('x axis', true)
              .attr("transform", "translate(0," + chart.height() + ")")
              .call(xAxis)
              .selectAll("text")
              .attr("style", "font: 12px 'gill sans'; text-anchor: middle")
              .call(chart.wrap, chart.xScale.rangeBand())

        chart.areas.legend =
          chart.areas.legend
          .selectAll(".legend")
          .data(chart.x1Scale.domain())
            .enter().append("g")
            .attr("class", "legend")

        chart.areas.legend
            .append("circle")
              .attr("r", 5)
              .attr("cx", function(d,i) {
                return 1 + (i * 100);
              })
              .attr("fill", function(d) {
                return chart.colorScale(d);
              })
              .attr("cy", 5)

        chart.areas.legend
            .append("text")
            .attr("transform", function (d,i) {
              return "translate(" + (10 + (i*100)) + ",0)";
            })
            .attr("dy", ".71em")
            .attr("x", 0)
            .attr("y", 0)
            .attr("style", "font: 12px 'gill sans';")
            .text(function(d) { 
              return d;
            })
            .call(chart.wrap, 85)

        // Bind the data
        return this.selectAll('.category')
          .data(data);
      },
 
      insert: function() {
        var chart = this.chart();
 
        // Append the bars
        return this.append('g')
          .attr('class', 'category');
      },
 
      events: {
 
        "enter": function() {
          var chart = this.chart();
 
          this.attr("transform", function(d, i) { return "translate(" + chart.xScale(d.series) + ",0)"; })
            .selectAll(".bar")
            .data(function(d) {return d.values;})
            .enter()
          .append("rect")
            .attr("title", function(d) { return d.name })
            .attr("data-content", function(d) { return  "Estimate: " + d.value + '%' })
            .attr('class', 'bar')
            .attr("data-legend", function(d) { return d.name })
            .attr("width", chart.x1Scale.rangeBand())
            .style("fill", function(d,i) { return chart.colorScale(d.name);; })
            .attr("x", function(d) { return chart.x1Scale(d.name); })
            .attr('y', function(d) { return chart.yScale(0); })
            .attr("height", 0);

        chart.areas.legend
          .append("ul")
          .selectAll("li")
          .data(chart.x1Scale.domain())
          .enter()
            .append("li")
            .style("color", function(d,i) { return chart.colorScale(d) })
            .style("font-size", "2.2em")
            .style("line-height", ".4em")
              .append("span")
              .style("color", "black")
              .style("font-size", ".40em")
              .text(function(d) { return d });
        },
 
        "merge:transition": function() {
          var chart = this.chart();

          this.duration(chart.duration)
              .attr("transform", function(d, i) {return "translate(" + chart.xScale(d.series) + ",0)"; })
            .selectAll(".bar")
              .attr("width", chart.x1Scale.rangeBand())
            .attr('y', function(d) { return chart.yScale(d3.max([0, d.value])); })
            .attr('height', function(d) { return Math.abs(chart.yScale(d.value) - chart.yScale(0)); });

          $(document).ready(function () {
            $("svg rect").popover({
                'container': 'body',
                'placement': 'right',
                'trigger': 'hover',
                'html': true
            });
          });
        }
      },
    });

    },


    transform: function(data) {
      var chart = this;

      // data standards? :(
      // var series = [];
      // data.forEach(function(d){
      //   series.push(d.series);
      // });
      // var keys = d3.set(series).values();

      // var newData = [];

      // keys.forEach(function(series) {
      //   var values = [];
      //   var filter = data.filter(function(element) { 
      //     return element.series == series 
      //   });

      //   filter.forEach(function(d){
      //     values.push({ "name": d.name, "value": d.value })
      //   });

      //   newData.push({ "series": series, "values": values })
      // });



      var buffer = [];
      var x1domain = data[0].values.forEach(function(d) {
        buffer.push(d.name);
      });
      
      var max = d3.max(data, function(d) { 
        return d3.max(d.values, function(d) { 
          return d.value; 
        }); 
      });

      var min = d3.min(data, function(d) {
        return d3.min(d.values, function(d) {
          return d.value;
        })
      });

      if (min > 0) {
        min = 0;
      }

      chart.xScale.domain(data.map(function(d) { return d.series; }));
      chart.x1Scale.domain(buffer).rangeRoundBands([0, chart.xScale.rangeBand()]);
      chart.yScale.domain([min, max]);
      // chart.colorScale
      //   .domain(chart.x1Scale());
      return data;
  }
});
},{}],5:[function(require,module,exports){
d3.chart("BaseChart").extend("LineChart", {

  initialize: function() {

    var chart = this;

    chart._callouts = [];

    chart.xScale = d3.scale.ordinal()
      .rangeRoundBands([0, chart.width()], 1);
    chart.yScale = d3.scale.linear()
      .range([chart.height(), 0]);
    chart.color = d3.scale.category10();

    chart.renderLine = d3.svg.line()
      .interpolate("linear")
      .x(function(d) { return chart.xScale(d.year); })
      .y(function(d) { return chart.yScale(d.value); });

    chart.duration = 500;

    chart.on('change:width', function(newWidth) {
      chart.xScale.rangeRoundBands([0, newWidth], 1);
    });

    chart.on('change:height', function(newHeight) {
      chart.yScale.range([newHeight, 0]);
    }); 

    chart.areas.yAxisLayer = chart.base.select('g').append('g')
      .classed('ylabels', true)

    chart.layers.lines = chart.base.select('g').append('g')
      .classed('lines', true)

    chart.layers.circles = chart.base.select('g').append('g')
      .classed('circles', true)

    chart.layers.labels = chart.base.select('g').append('g')
      .classed('text-labels', true)

    chart.areas.legend = chart.base.select('g').append('g')
      .attr("transform", "translate(0, -40)");

    // create a layer of circles that will go into
    // a new group element on the base of the chart
    chart.layer('lines', chart.layers.lines, {

      // select the elements we wish to bind to and
      // bind the data to them.
      dataBind: function(data) {
        var chart = this.chart();

        var yAxis = d3.svg.axis()
          .scale(chart.yScale)
          .tickSize(-chart.width(), 0, 0)
          .orient("left")
          .tickFormat(d3.format(".2s"));;

        chart.areas.yAxisLayer
            .call(yAxis)
          .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", -50)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(chart.yAxisLabel());

        chart.areas.yAxisLayer
            .selectAll("text")
            .style("font", "12px 'gill sans'")

        var xAxis = d3.svg.axis()
          .scale(chart.xScale)
          .orient("bottom");

        chart.base.select('g').append('g')
              .classed('x axis', true)
              .attr("transform", "translate(0," + chart.height() + ")")
              .call(xAxis)
            .selectAll("text")
              .attr("style", "font: 12px 'gill sans'; text-anchor: middle")
              .call(chart.wrap, 50)

        chart.areas.legend =
          chart.areas.legend
          .selectAll(".legend")
          .data(data)
            .enter().append("g")
            .attr("class", "legend")

        chart.areas.legend
            .append("circle")
              .attr("r", 5)
              .attr("cx", function(d,i) {
                return 1 + (i * 100);
              })
              .attr("fill", function(d) {
                return chart.colorScale(d.series);
              })
              .attr("cy", 5)

        chart.areas.legend
            .append("text")
            .attr("transform", function (d,i) {
              return "translate(" + (10 + (i*100)) + ",0)";
            })
            .attr("dy", ".71em")
            .attr("x", 0)
            .attr("y", 0)
            .attr("style", "font: 12px 'gill sans';")
            .text(function(d) { 
              return d.series;
            })
            .call(chart.wrap, 85)

      return this.selectAll('.line')
        .data(data);
      },

      // insert actual rects
      insert: function() {
        return this.append('path')
          .attr('class', function(d,i) {
            return "line-" + i;
          });
      },

      // define lifecycle events
      events: {
        'enter': function() {
          var chart = this.chart();
          this.attr('d', function(d) { return chart.renderLine(d.values); })
            .attr("class", function(d,i) {
              if (chart.matchWithCallouts(d.series)) {
                var str = d.series.replace(/\s/g, '');
                return "line callout callout-" + str;
              } else {
                return "line line-" + 1;
              }     
            })
            .attr("data-content", function(d) {
              return d.series;
            })
            .style("fill", "none")
            .style("stroke", function(d,i) {
              if (chart.matchWithCallouts(d.series) || chart.callouts() == false) {
                return chart.colorScale(d.series); 
              } else {
                return "Lightgray"
              }       
            })
            .on("mousemove", function(d,i) {

              d3.select(this)
                .style("stroke", function (d) {
                  if (chart.matchWithCallouts(d.series) || chart.callouts() == false) {
                    return chart.colorScale(d.series); 
                  } else {
                    return "darkgray"
                  }      
                });

              d3.select(this)
                .style("stroke-width", "7");

            })
            .on("mouseout", function(d,i) {

              d3.select(this)
                .style("stroke", function (d) {
                  if (chart.matchWithCallouts(d.series) || chart.callouts() == false) {
                    return chart.colorScale(d.series); 
                  } else {
                    return "Lightgray"
                  }   
                });
   

              d3.select(this)
                .transition()
                .duration(350)
                .style("stroke-width", "3");
            }); 
        },

        'enter:transition': function() {
          var chart = this.chart();

          // $(document).ready(function () {
          //     $("svg circle").popover({
          //         'container': 'body',
          //         'placement': 'right',
          //         'trigger': 'hover',
          //         'html': true
          //     });
          // });
        }
      }
    });

    chart.layer('circles', chart.layers.circles, {

      dataBind: function(data) {
        return this.selectAll("circles")
                  .data(data);
      },

      insert: function() {
        return this.append('g')
          .attr('class', 'data-points');
      },

      events: {

        'enter': function () {

          var chart = this.chart();

          this.selectAll("circle")
            .data(function(d) {return d.values; })
            .enter()
          .append("svg:circle")
            .attr("r", 3)
            .attr("cx", function(d) { return chart.xScale(d.year) })
            .attr("cy", function(d) { return chart.yScale(d.value) })
            .attr("title", function(d) { return (d.year) })
            .attr("data-content", function(d) { return "Estimate: " + d.value + "%" })
            .attr("fill", "black")
            .on("mouseover", function(d, i) {
              d3.select(this)
                .attr("r", "6"); 
            })
            .on("mouseout", function(d) {
              d3.select(this)
                .transition()
                .duration(150)
                .attr("r", "3")
            });

        },

        'enter:transition': function () {
          $(document).ready( function () {
            $("svg circle").popover({
                'container': 'body',
                'placement': 'right',
                'trigger': 'hover',
                'html': true
            });
          });

          $(document).ready( function () {
            $("svg path").popover({
                'container': 'body',
                'placement': 'top',
                'trigger': 'hover',
                'html': true
            });
          });        
        }
      }
    });

  },

  callouts: function(collection) {
    if (arguments.length === 0) {
      return this._callouts;
    }

    if (Array.isArray(collection)) {
      this._callouts = collection
    } 

    return this;
  },

  matchWithCallouts: function (comparator) {
    return this._callouts.indexOf(comparator) !== -1
  },

  // set/get the color to use for the circles as they are
  // rendered.
  transform: function(data) {
    var chart = this;
    // update the scales

    data.forEach(function(d) {
      d.values.forEach(function(d) {
        d.year = d.year.toString();
      });
    });


    var buffer = [];
    data[0].values.forEach(function(d) {
      buffer.push(d.year);
    });

    var max = d3.max(data, function(d) { 
      return d3.max(d.values, function(d) { 
        return d.value; 
      }); 
    });

    var min = d3.min(data, function(d) {
      return d3.min(d.values, function(d) {
        return d.value;
      })
    });

    chart.xScale.domain(buffer);
    chart.yScale.domain([min,max]);

    if (chart._callouts) {

      chart._callouts.forEach(function(d) {
        var pluck = [];
        pluck = data.filter(function(f) { 
          return f.series == d; 
        });
        data = data.filter(function(f) {
          return f.series !== d;
        });
        data.push(pluck[0]);
      });
    }

    return data;
  }
});
},{}],6:[function(require,module,exports){
d3.chart('BaseChart').extend('StackedBarChart', {
  initialize : function() {
    var chart = this;

    chart.xScale = d3.scale.ordinal()
      .rangeRoundBands([0, chart.width()], .1);
    chart.yScale = d3.scale.linear()
      .rangeRound([chart.height(), 0]);
    chart.color = d3.scale.category10();
    chart.duration = 500;

    chart.yAxis = d3.svg.axis()
      .scale(chart.yScale)
      .tickSize(-chart.width(), 0, 0)
      .orient("left")
      .tickFormat(d3.format(".2s"));
 
    chart.on("change:width", function(newWidth) {
      chart.xScale.rangeRoundBands([0, newWidth], 0.1);
    });

    chart.on("change:height", function(newHeight) {
      chart.yScale.range([newHeight, 0]);
    });

    chart.areas.yAxisLayer = chart.base.select('g').append('g')
      .classed('ylabels', true)

    // -- actual layers
    chart.layers.bars = chart.base.select('g').append('g')
      .classed('bars', true)
 
    chart.areas.legend = chart.base.select('g').append('g')
          .classed('legend', true)

    chart.areas.legend = chart.base.select('g').append('g')
      .attr("transform", "translate(0, -40)");

    chart.layer('bars', chart.layers.bars, {
      dataBind: function(data) {
        var chart = this.chart();
 
        var yAxis = d3.svg.axis()
            .scale(chart.yScale)
            .tickSize(-(chart.width()), 0, 0)
            .orient("left")
            .tickFormat(d3.format(".2s"));

        chart.areas.yAxisLayer
            .call(yAxis)
          .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", -40)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(chart.yAxisLabel());
 
        chart.areas.yAxisLayer
            .selectAll("text")
            .style("font", "12px 'gill sans'")

        var xAxis = d3.svg.axis()
            .scale(chart.xScale)
            .orient("bottom");

        chart.base.select('g').append('g')
              .classed('x axis', true)
              .attr("transform", "translate(0," + chart.height() + ")")
              .call(xAxis)
              .selectAll("text")
              .attr("style", "font: 12px 'gill sans'; text-anchor: middle")
              .call(chart.wrap, chart.xScale.rangeBand())

        chart.areas.legend =
          chart.areas.legend
          .selectAll(".legend")
          .data(data[0].groups)
          .enter().append("g")
          .attr("class", "legend")

        chart.areas.legend
            .append("circle")
              .attr("r", 5)
              .attr("cx", function(d,i) {
                return 1 + (i * 100);
              })
              .attr("fill", function(d) {
                return chart.colorScale(d.name);
              })
              .attr("cy", 5)

        chart.areas.legend
            .append("text")
            .attr("transform", function (d,i) {
              return "translate(" + (10 + (i*100)) + ",0)";
            })
            .attr("dy", ".71em")
            .attr("x", 0)
            .attr("y", 0)
            .attr("style", "font: 12px 'gill sans';")
            .text(function(d) { 
              return d.name;
            })
            .call(chart.wrap, 85)

        // Bind the data
        return this.selectAll('.category')
          .data(data);
      },
 
      insert: function() {
        var chart = this.chart();
 
        // Append the bars
        return this.append('g')
          .attr('class', 'category');
      },
 
      events: {
 
        "enter": function() {
          var chart = this.chart();
 
          this.attr("transform", function(d, i) { return "translate(" + chart.xScale(d.series) + ",0)"; })
            .selectAll(".category")
              .data(function(d) { return d.groups; })
            .enter().append("rect")
              .attr("class", "bar")
              // .attr("transform", function(d) { return "translate(" + chart.xScale(d.series) + ",0)"; })
              .attr("width", chart.xScale.rangeBand())
              .attr("y", function(d) { return chart.yScale(d.y1); })
              .attr("height", function(d) { return chart.yScale(d.y0) - chart.yScale(d.y1); })
              .style("fill", function(d) { return chart.color(d.name); });

              
        }
      },
    });

    },

    transform: function(data) {
      var _data = data;
      var chart = this;

      chart.color.domain(d3.keys(data[0]).filter(function(key) { return key !== "series"; }));

      _data.forEach(function(d) {
        var y0 = 0;
        d.groups = chart.color.domain().map(function(name) { return {name: name, y0: y0, y1: y0 += +d[name]}; });
        d.total = d.groups[d.groups.length - 1].y1;
      });

      data.sort(function(a, b) { return b.total - a.total; });
      
      chart.xScale.domain(data.map(function(d) { return d.series; }));
      chart.yScale.domain([0, d3.max(data, function(d) { return d.total; })]);
      
      return data;
  }
});
},{}]},{},[1])