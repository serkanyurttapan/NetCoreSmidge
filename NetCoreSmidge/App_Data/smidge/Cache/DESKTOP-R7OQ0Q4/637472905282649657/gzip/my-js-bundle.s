function topla(a,b){return a+b;};;function carp(a,b){debugger;return a*b;debugger};;/*!
 * jQuery JavaScript Library v3.5.1
 * https://jquery.com/
 *
 * Includes Sizzle.js
 * https://sizzlejs.com/
 *
 * Copyright JS Foundation and other contributors
 * Released under the MIT license
 * https://jquery.org/license
 *
 * Date: 2020-05-04T22:49Z
 */
( function( global, factory ) {

	"use strict";

	if ( typeof module === "object" && typeof module.exports === "object" ) {

		// For CommonJS and CommonJS-like environments where a proper `window`
		// is present, execute the factory and get jQuery.
		// For environments that do not have a `window` with a `document`
		// (such as Node.js), expose a factory as module.exports.
		// This accentuates the need for the creation of a real `window`.
		// e.g. var jQuery = require("jquery")(window);
		// See ticket #14549 for more info.
		module.exports = global.document ?
			factory( global, true ) :
			function( w ) {
				if ( !w.document ) {
					throw new Error( "jQuery requires a window with a document" );
				}
				return factory( w );
			};
	} else {
		factory( global );
	}

// Pass this if window is not defined yet
} )( typeof window !== "undefined" ? window : this, function( window, noGlobal ) {

// Edge <= 12 - 13+, Firefox <=18 - 45+, IE 10 - 11, Safari 5.1 - 9+, iOS 6 - 9.1
// throw exceptions when non-strict code (e.g., ASP.NET 4.5) accesses strict mode
// arguments.callee.caller (trac-13335). But as of jQuery 3.0 (2016), strict mode should be common
// enough that all such attempts are guarded in a try block.
"use strict";

var arr = [];

var getProto = Object.getPrototypeOf;

var slice = arr.slice;

var flat = arr.flat ? function( array ) {
	return arr.flat.call( array );
} : function( array ) {
	return arr.concat.apply( [], array );
};


var push = arr.push;

var indexOf = arr.indexOf;

var class2type = {};

var toString = class2type.toString;

var hasOwn = class2type.hasOwnProperty;

var fnToString = hasOwn.toString;

var ObjectFunctionString = fnToString.call( Object );

var support = {};

var isFunction = function isFunction( obj ) {

      // Support: Chrome <=57, Firefox <=52
      // In some browsers, typeof returns "function" for HTML <object> elements
      // (i.e., `typeof document.createElement( "object" ) === "function"`).
      // We don't want to classify *any* DOM node as a function.
      return typeof obj === "function" && typeof obj.nodeType !== "number";
  };


var isWindow = function isWindow( obj ) {
		return obj != null && obj === obj.window;
	};


var document = window.document;



	var preservedScriptAttributes = {
		type: true,
		src: true,
		nonce: true,
		noModule: true
	};

	function DOMEval( code, node, doc ) {
		doc = doc || document;

		var i, val,
			script = doc.createElement( "script" );

		script.text = code;
		if ( node ) {
			for ( i in preservedScriptAttributes ) {

				// Support: Firefox 64+, Edge 18+
				// Some browsers don't support the "nonce" property on scripts.
				// On the other hand, just using `getAttribute` is not enough as
				// the `nonce` attribute is reset to an empty string whenever it
				// becomes browsing-context connected.
				// See https://github.com/whatwg/html/issues/2369
				// See https://html.spec.whatwg.org/#nonce-attributes
				// The `node.getAttribute` check was added for the sake of
				// `jQuery.globalEval` so that it can fake a nonce-containing node
				// via an object.
				val = node[ i ] || node.getAttribute && node.getAttribute( i );
				if ( val ) {
					script.setAttribute( i, val );
				}
			}
		}
		doc.head.appendChild( script ).parentNode.removeChild( script );
	}


function toType( obj ) {
	if ( obj == null ) {
		return obj + "";
	}

	// Support: Android <=2.3 only (functionish RegExp)
	return typeof obj === "object" || typeof obj === "function" ?
		class2type[ toString.call( obj ) ] || "object" :
		typeof obj;
}
/* global Symbol */
// Defining this global in .eslintrc.json would create a danger of using the global
// unguarded in another place, it seems safer to define global only for this module



var
	version = "3.5.1",

	// Define a local copy of jQuery
	jQuery = function( selector, context ) {

		// The jQuery object is actually just the init constructor 'enhanced'
		// Need init if jQuery is called (just allow error to be thrown if not included)
		return new jQuery.fn.init( selector, context );
	};

jQuery.fn = jQuery.prototype = {

	// The current version of jQuery being used
	jquery: version,

	constructor: jQuery,

	// The default length of a jQuery object is 0
	length: 0,

	toArray: function() {
		return slice.call( this );
	},

	// Get the Nth element in the matched element set OR
	// Get the whole matched element set as a clean array
	get: function( num ) {

		// Return all the elements in a clean array
		if ( num == null ) {
			return slice.call( this );
		}

		// Return just the one element from the set
		return num < 0 ? this[ num + this.length ] : this[ num ];
	},

	// Take an array of elements and push it onto the stack
	// (returning the new matched element set)
	pushStack: function( elems ) {

		// Build a new jQuery matched element set
		var ret = jQuery.merge( this.constructor(), elems );

		// Add the old object onto the stack (as a reference)
		ret.prevObject = this;

		// Return the newly-formed element set
		return ret;
	},

	// Execute a callback for every element in the matched set.
	each: function( callback ) {
		return jQuery.each( this, callback );
	},

	map: function( callback ) {
		return this.pushStack( jQuery.map( this, function( elem, i ) {
			return callback.call( elem, i, elem );
		} ) );
	},

	slice: function() {
		return this.pushStack( slice.apply( this, arguments ) );
	},

	first: function() {
		return this.eq( 0 );
	},

	last: function() {
		return this.eq( -1 );
	},

	even: function() {
		return this.pushStack( jQuery.grep( this, function( _elem, i ) {
			return ( i + 1 ) % 2;
		} ) );
	},

	odd: function() {
		return this.pushStack( jQuery.grep( this, function( _elem, i ) {
			return i % 2;
		} ) );
	},

	eq: function( i ) {
		var len = this.length,
			j = +i + ( i < 0 ? len : 0 );
		return this.pushStack( j >= 0 && j < len ? [ this[ j ] ] : [] );
	},

	end: function() {
		return this.prevObject || this.constructor();
	},

	// For internal use only.
	// Behaves like an Array's method, not like a jQuery method.
	push: push,
	sort: arr.sort,
	splice: arr.splice
};

jQuery.extend = jQuery.fn.extend = function() {
	var options, name, src, copy, copyIsArray, clone,
		target = arguments[ 0 ] || {},
		i = 1,
		length = arguments.length,
		deep = false;

	// Handle a deep copy situation
	if ( typeof target === "boolean" ) {
		deep = target;

		// Skip the boolean and the target
		target = arguments[ i ] || {};
		i++;
	}

	// Handle case when target is a string or something (possible in deep copy)
	if ( typeof target !== "object" && !isFunction( target ) ) {
		target = {};
	}

	// Extend jQuery itself if only one argument is passed
	if ( i === length ) {
		target = this;
		i--;
	}

	for ( ; i < length; i++ ) {

		// Only deal with non-null/undefined values
		if ( ( options = arguments[ i ] ) != null ) {

			// Extend the base object
			for ( name in options ) {
				copy = options[ name ];

				// Prevent Object.prototype pollution
				// Prevent never-ending loop
				if ( name === "__proto__" || target === copy ) {
					continue;
				}

				// Recurse if we're merging plain objects or arrays
				if ( deep && copy && ( jQuery.isPlainObject( copy ) ||
					( copyIsArray = Array.isArray( copy ) ) ) ) {
					src = target[ name ];

					// Ensure proper type for the source value
					if ( copyIsArray && !Array.isArray( src ) ) {
						clone = [];
					} else if ( !copyIsArray && !jQuery.isPlainObject( src ) ) {
						clone = {};
					} else {
						clone = src;
					}
					copyIsArray = false;

					// Never move original objects, clone them
					target[ name ] = jQuery.extend( deep, clone, copy );

				// Don't bring in undefined values
				} else if ( copy !== undefined ) {
					target[ name ] = copy;
				}
			}
		}
	}

	// Return the modified object
	return target;
};

jQuery.extend( {

	// Unique for each copy of jQuery on the page
	expando: "jQuery" + ( version + Math.random() ).replace( /\D/g, "" ),

	// Assume jQuery is ready without the ready module
	isReady: true,

	error: function( msg ) {
		throw new Error( msg );
	},

	noop: function() {},

	isPlainObject: function( obj ) {
		var proto, Ctor;

		// Detect obvious negatives
		// Use toString instead of jQuery.type to catch host objects
		if ( !obj || toString.call( obj ) !== "[object Object]" ) {
			return false;
		}

		proto = getProto( obj );

		// Objects with no prototype (e.g., `Object.create( null )`) are plain
		if ( !proto ) {
			return true;
		}

		// Objects with prototype are plain iff they were constructed by a global Object function
		Ctor = hasOwn.call( proto, "constructor" ) && proto.constructor;
		return typeof Ctor === "function" && fnToString.call( Ctor ) === ObjectFunctionString;
	},

	isEmptyObject: function( obj ) {
		var name;

		for ( name in obj ) {
			return false;
		}
		return true;
	},

	// Evaluates a script in a provided context; falls back to the global one
	// if not specified.
	globalEval: function( code, options, doc ) {
		DOMEval( code, { nonce: options && options.nonce }, doc );
	},

	each: function( obj, callback ) {
		var length, i = 0;

		if ( isArrayLike( obj ) ) {
			length = obj.length;
			for ( ; i < length; i++ ) {
				if ( callback.call( obj[ i ], i, obj[ i ] ) === false ) {
					break;
				}
			}
		} else {
			for ( i in obj ) {
				if ( callback.call( obj[ i ], i, obj[ i ] ) === false ) {
					break;
				}
			}
		}

		return obj;
	},

	// results is for internal usage only
	makeArray: function( arr, results ) {
		var ret = results || [];

		if ( arr != null ) {
			if ( isArrayLike( Object( arr ) ) ) {
				jQuery.merge( ret,
					typeof arr === "string" ?
					[ arr ] : arr
				);
			} else {
				push.call( ret, arr );
			}
		}

		return ret;
	},

	inArray: function( elem, arr, i ) {
		return arr == null ? -1 : indexOf.call( arr, elem, i );
	},

	// Support: Android <=4.0 only, PhantomJS 1 only
	// push.apply(_, arraylike) throws on ancient WebKit
	merge: function( first, second ) {
		var len = +second.length,
			j = 0,
			i = first.length;

		for ( ; j < len; j++ ) {
			first[ i++ ] = second[ j ];
		}

		first.length = i;

		return first;
	},

	grep: function( elems, callback, invert ) {
		var callbackInverse,
			matches = [],
			i = 0,
			length = elems.length,
			callbackExpect = !invert;

		// Go through the array, only saving the items
		// that pass the validator function
		for ( ; i < length; i++ ) {
			callbackInverse = !callback( elems[ i ], i );
			if ( callbackInverse !== callbackExpect ) {
				matches.push( elems[ i ] );
			}
		}

		return matches;
	},

	// arg is for internal usage only
	map: function( elems, callback, arg ) {
		var length, value,
			i = 0,
			ret = [];

		// Go through the array, translating each of the items to their new values
		if ( isArrayLike( elems ) ) {
			length = elems.length;
			for ( ; i < length; i++ ) {
				value = callback( elems[ i ], i, arg );

				if ( value != null ) {
					ret.push( value );
				}
			}

		// Go through every key on the object,
		} else {
			for ( i in elems ) {
				value = callback( elems[ i ], i, arg );

				if ( value != null ) {
					ret.push( value );
				}
			}
		}

		// Flatten any nested arrays
		return flat( ret );
	},

	// A global GUID counter for objects
	guid: 1,

	// jQuery.support is not used in Core but other projects attach their
	// properties to it so it needs to exist.
	support: support
} );

if ( typeof Symbol === "function" ) {
	jQuery.fn[ Symbol.iterator ] = arr[ Symbol.iterator ];
}

// Populate the class2type map
jQuery.each( "Boolean Number String Function Array Date RegExp Object Error Symbol".split( " " ),
function( _i, name ) {
	class2type[ "[object " + name + "]" ] = name.toLowerCase();
} );

function isArrayLike( obj ) {

	// Support: real iOS 8.2 only (not reproducible in simulator)
	// `in` check used to prevent JIT error (gh-2145)
	// hasOwn isn't used here due to false negatives
	// regarding Nodelist length in IE
	var length = !!obj && "length" in obj && obj.length,
		type = toType( obj );

	if ( isFunction( obj ) || isWindow( obj ) ) {
		return false;
	}

	return type === "array" || length === 0 ||
		typeof length === "number" && length > 0 && ( length - 1 ) in obj;
}
var Sizzle =
/*!
 * Sizzle CSS Selector Engine v2.3.5
 * https://sizzlejs.com/
 *
 * Copyright JS Foundation and other contributors
 * Released under the MIT license
 * https://js.foundation/
 *
 * Date: 2020-03-14
 */
( function( window ) {
var i,
	support,
	Expr,
	getText,
	isXML,
	tokenize,
	compile,
	select,
	outermostContext,
	sortInput,
	hasDuplicate,

	// Local document vars
	setDocument,
	document,
	docElem,
	documentIsHTML,
	rbuggyQSA,
	rbuggyMatches,
	matches,
	contains,

	// Instance-specific data
	expando = "sizzle" + 1 * new Date(),
	preferredDoc = window.document,
	dirruns = 0,
	done = 0,
	classCache = createCache(),
	tokenCache = createCache(),
	compilerCache = createCache(),
	nonnativeSelectorCache = createCache(),
	sortOrder = function( a, b ) {
		if ( a === b ) {
			hasDuplicate = true;
		}
		return 0;
	},

	// Instance methods
	hasOwn = ( {} ).hasOwnProperty,
	arr = [],
	pop = arr.pop,
	pushNative = arr.push,
	push = arr.push,
	slice = arr.slice,

	// Use a stripped-down indexOf as it's faster than native
	// https://jsperf.com/thor-indexof-vs-for/5
	indexOf = function( list, elem ) {
		var i = 0,
			len = list.length;
		for ( ; i < len; i++ ) {
			if ( list[ i ] === elem ) {
				return i;
			}
		}
		return -1;
	},

	booleans = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|" +
		"ismap|loop|multiple|open|readonly|required|scoped",

	// Regular expressions

	// http://www.w3.org/TR/css3-selectors/#whitespace
	whitespace = "[\\x20\\t\\r\\n\\f]",

	// https://www.w3.org/TR/css-syntax-3/#ident-token-diagram
	identifier = "(?:\\\\[\\da-fA-F]{1,6}" + whitespace +
		"?|\\\\[^\\r\\n\\f]|[\\w-]|[^\0-\\x7f])+",

	// Attribute selectors: http://www.w3.org/TR/selectors/#attribute-selectors
	attributes = "\\[" + whitespace + "*(" + identifier + ")(?:" + whitespace +

		// Operator (capture 2)
		"*([*^$|!~]?=)" + whitespace +

		// "Attribute values must be CSS identifiers [capture 5]
		// or strings [capture 3 or capture 4]"
		"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + identifier + "))|)" +
		whitespace + "*\\]",

	pseudos = ":(" + identifier + ")(?:\\((" +

		// To reduce the number of selectors needing tokenize in the preFilter, prefer arguments:
		// 1. quoted (capture 3; capture 4 or capture 5)
		"('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|" +

		// 2. simple (capture 6)
		"((?:\\\\.|[^\\\\()[\\]]|" + attributes + ")*)|" +

		// 3. anything else (capture 2)
		".*" +
		")\\)|)",

	// Leading and non-escaped trailing whitespace, capturing some non-whitespace characters preceding the latter
	rwhitespace = new RegExp( whitespace + "+", "g" ),
	rtrim = new RegExp( "^" + whitespace + "+|((?:^|[^\\\\])(?:\\\\.)*)" +
		whitespace + "+$", "g" ),

	rcomma = new RegExp( "^" + whitespace + "*," + whitespace + "*" ),
	rcombinators = new RegExp( "^" + whitespace + "*([>+~]|" + whitespace + ")" + whitespace +
		"*" ),
	rdescend = new RegExp( whitespace + "|>" ),

	rpseudo = new RegExp( pseudos ),
	ridentifier = new RegExp( "^" + identifier + "$" ),

	matchExpr = {
		"ID": new RegExp( "^#(" + identifier + ")" ),
		"CLASS": new RegExp( "^\\.(" + identifier + ")" ),
		"TAG": new RegExp( "^(" + identifier + "|[*])" ),
		"ATTR": new RegExp( "^" + attributes ),
		"PSEUDO": new RegExp( "^" + pseudos ),
		"CHILD": new RegExp( "^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" +
			whitespace + "*(even|odd|(([+-]|)(\\d*)n|)" + whitespace + "*(?:([+-]|)" +
			whitespace + "*(\\d+)|))" + whitespace + "*\\)|)", "i" ),
		"bool": new RegExp( "^(?:" + booleans + ")$", "i" ),

		// For use in libraries implementing .is()
		// We use this for POS matching in `select`
		"needsContext": new RegExp( "^" + whitespace +
			"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + whitespace +
			"*((?:-\\d)?\\d*)" + whitespace + "*\\)|)(?=[^-]|$)", "i" )
	},

	rhtml = /HTML$/i,
	rinputs = /^(?:input|select|textarea|button)$/i,
	rheader = /^h\d$/i,

	rnative = /^[^{]+\{\s*\[native \w/,

	// Easily-parseable/retrievable ID or TAG or CLASS selectors
	rquickExpr = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,

	rsibling = /[+~]/,

	// CSS escapes
	// http://www.w3.org/TR/CSS21/syndata.html#escaped-characters
	runescape = new RegExp( "\\\\[\\da-fA-F]{1,6}" + whitespace + "?|\\\\([^\\r\\n\\f])", "g" ),
	funescape = function( escape, nonHex ) {
		var high = "0x" + escape.slice( 1 ) - 0x10000;

		return nonHex ?

			// Strip the backslash prefix from a non-hex escape sequence
			nonHex :

			// Replace a hexadecimal escape sequence with the encoded Unicode code point
			// Support: IE <=11+
			// For values outside the Basic Multilingual Plane (BMP), manually construct a
			// surrogate pair
			high < 0 ?
				String.fromCharCode( high + 0x10000 ) :
				String.fromCharCode( high >> 10 | 0xD800, high & 0x3FF | 0xDC00 );
	},

	// CSS string/identifier serialization
	// https://drafts.csswg.org/cssom/#common-serializing-idioms
	rcssescape = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g,
	fcssescape = function( ch, asCodePoint ) {
		if ( asCodePoint ) {

			// U+0000 NULL becomes U+FFFD REPLACEMENT CHARACTER
			if ( ch === "\0" ) {
				return "\uFFFD";
			}

			// Control characters and (dependent upon position) numbers get escaped as code points
			return ch.slice( 0, -1 ) + "\\" +
				ch.charCodeAt( ch.length - 1 ).toString( 16 ) + " ";
		}

		// Other potentially-special ASCII characters get backslash-escaped
		return "\\" + ch;
	},

	// Used for iframes
	// See setDocument()
	// Removing the function wrapper causes a "Permission Denied"
	// error in IE
	unloadHandler = function() {
		setDocument();
	},

	inDisabledFieldset = addCombinator(
		function( elem ) {
			return elem.disabled === true && elem.nodeName.toLowerCase() === "fieldset";
		},
		{ dir: "parentNode", next: "legend" }
	);

// Optimize for push.apply( _, NodeList )
try {
	push.apply(
		( arr = slice.call( preferredDoc.childNodes ) ),
		preferredDoc.childNodes
	);

	// Support: Android<4.0
	// Detect silently failing push.apply
	// eslint-disable-next-line no-unused-expressions
	arr[ preferredDoc.childNodes.length ].nodeType;
} catch ( e ) {
	push = { apply: arr.length ?

		// Leverage slice if possible
		function( target, els ) {
			pushNative.apply( target, slice.call( els ) );
		} :

		// Support: IE<9
		// Otherwise append directly
		function( target, els ) {
			var j = target.length,
				i = 0;

			// Can't trust NodeList.length
			while ( ( target[ j++ ] = els[ i++ ] ) ) {}
			target.length = j - 1;
		}
	};
}

function Sizzle( selector, context, results, seed ) {
	var m, i, elem, nid, match, groups, newSelector,
		newContext = context && context.ownerDocument,

		// nodeType defaults to 9, since context defaults to document
		nodeType = context ? context.nodeType : 9;

	results = results || [];

	// Return early from calls with invalid selector or context
	if ( typeof selector !== "string" || !selector ||
		nodeType !== 1 && nodeType !== 9 && nodeType !== 11 ) {

		return results;
	}

	// Try to shortcut find operations (as opposed to filters) in HTML documents
	if ( !seed ) {
		setDocument( context );
		context = context || document;

		if ( documentIsHTML ) {

			// If the selector is sufficiently simple, try using a "get*By*" DOM method
			// (excepting DocumentFragment context, where the methods don't exist)
			if ( nodeType !== 11 && ( match = rquickExpr.exec( selector ) ) ) {

				// ID selector
				if ( ( m = match[ 1 ] ) ) {

					// Document context
					if ( nodeType === 9 ) {
						if ( ( elem = context.getElementById( m ) ) ) {

							// Support: IE, Opera, Webkit
							// TODO: identify versions
							// getElementById can match elements by name instead of ID
							if ( elem.id === m ) {
								results.push( elem );
								return results;
							}
						} else {
							return results;
						}

					// Element context
					} else {

						// Support: IE, Opera, Webkit
						// TODO: identify versions
						// getElementById can match elements by name instead of ID
						if ( newContext && ( elem = newContext.getElementById( m ) ) &&
							contains( context, elem ) &&
							elem.id === m ) {

							results.push( elem );
							return results;
						}
					}

				// Type selector
				} else if ( match[ 2 ] ) {
					push.apply( results, context.getElementsByTagName( selector ) );
					return results;

				// Class selector
				} else if ( ( m = match[ 3 ] ) && support.getElementsByClassName &&
					context.getElementsByClassName ) {

					push.apply( results, context.getElementsByClassName( m ) );
					return results;
				}
			}

			// Take advantage of querySelectorAll
			if ( support.qsa &&
				!nonnativeSelectorCache[ selector + " " ] &&
				( !rbuggyQSA || !rbuggyQSA.test( selector ) ) &&

				// Support: IE 8 only
				// Exclude object elements
				( nodeType !== 1 || context.nodeName.toLowerCase() !== "object" ) ) {

				newSelector = selector;
				newContext = context;

				// qSA considers elements outside a scoping root when evaluating child or
				// descendant combinators, which is not what we want.
				// In such cases, we work around the behavior by prefixing every selector in the
				// list with an ID selector referencing the scope context.
				// The technique has to be used as well when a leading combinator is used
				// as such selectors are not recognized by querySelectorAll.
				// Thanks to Andrew Dupont for this technique.
				if ( nodeType === 1 &&
					( rdescend.test( selector ) || rcombinators.test( selector ) ) ) {

					// Expand context for sibling selectors
					newContext = rsibling.test( selector ) && testContext( context.parentNode ) ||
						context;

					// We can use :scope instead of the ID hack if the browser
					// supports it & if we're not changing the context.
					if ( newContext !== context || !support.scope ) {

						// Capture the context ID, setting it first if necessary
						if ( ( nid = context.getAttribute( "id" ) ) ) {
							nid = nid.replace( rcssescape, fcssescape );
						} else {
							context.setAttribute( "id", ( nid = expando ) );
						}
					}

					// Prefix every selector in the list
					groups = tokenize( selector );
					i = groups.length;
					while ( i-- ) {
						groups[ i ] = ( nid ? "#" + nid : ":scope" ) + " " +
							toSelector( groups[ i ] );
					}
					newSelector = groups.join( "," );
				}

				try {
					push.apply( results,
						newContext.querySelectorAll( newSelector )
					);
					return results;
				} catch ( qsaError ) {
					nonnativeSelectorCache( selector, true );
				} finally {
					if ( nid === expando ) {
						context.removeAttribute( "id" );
					}
				}
			}
		}
	}

	// All others
	return select( selector.replace( rtrim, "$1" ), context, results, seed );
}

/**
 * Create key-value caches of limited size
 * @returns {function(string, object)} Returns the Object data after storing it on itself with
 *	property name the (space-suffixed) string and (if the cache is larger than Expr.cacheLength)
 *	deleting the oldest entry
 */
function createCache() {
	var keys = [];

	function cache( key, value ) {

		// Use (key + " ") to avoid collision with native prototype properties (see Issue #157)
		if ( keys.push( key + " " ) > Expr.cacheLength ) {

			// Only keep the most recent entries
			delete cache[ keys.shift() ];
		}
		return ( cache[ key + " " ] = value );
	}
	return cache;
}

/**
 * Mark a function for special use by Sizzle
 * @param {Function} fn The function to mark
 */
function markFunction( fn ) {
	fn[ expando ] = true;
	return fn;
}

/**
 * Support testing using an element
 * @param {Function} fn Passed the created element and returns a boolean result
 */
function assert( fn ) {
	var el = document.createElement( "fieldset" );

	try {
		return !!fn( el );
	} catch ( e ) {
		return false;
	} finally {

		// Remove from its parent by default
		if ( el.parentNode ) {
			el.parentNode.removeChild( el );
		}

		// release memory in IE
		el = null;
	}
}

/**
 * Adds the same handler for all of the specified attrs
 * @param {String} attrs Pipe-separated list of attributes
 * @param {Function} handler The method that will be applied
 */
function addHandle( attrs, handler ) {
	var arr = attrs.split( "|" ),
		i = arr.length;

	while ( i-- ) {
		Expr.attrHandle[ arr[ i ] ] = handler;
	}
}

/**
 * Checks document order of two siblings
 * @param {Element} a
 * @param {Element} b
 * @returns {Number} Returns less than 0 if a precedes b, greater than 0 if a follows b
 */
function siblingCheck( a, b ) {
	var cur = b && a,
		diff = cur && a.nodeType === 1 && b.nodeType === 1 &&
			a.sourceIndex - b.sourceIndex;

	// Use IE sourceIndex if available on both nodes
	if ( diff ) {
		return diff;
	}

	// Check if b follows a
	if ( cur ) {
		while ( ( cur = cur.nextSibling ) ) {
			if ( cur === b ) {
				return -1;
			}
		}
	}

	return a ? 1 : -1;
}

/**
 * Returns a function to use in pseudos for input types
 * @param {String} type
 */
function createInputPseudo( type ) {
	return function( elem ) {
		var name = elem.nodeName.toLowerCase();
		return name === "input" && elem.type === type;
	};
}

/**
 * Returns a function to use in pseudos for buttons
 * @param {String} type
 */
function createButtonPseudo( type ) {
	return function( elem ) {
		var name = elem.nodeName.toLowerCase();
		return ( name === "input" || name === "button" ) && elem.type === type;
	};
}

/**
 * Returns a function to use in pseudos for :enabled/:disabled
 * @param {Boolean} disabled true for :disabled; false for :enabled
 */
function createDisabledPseudo( disabled ) {

	// Known :disabled false positives: fieldset[disabled] > legend:nth-of-type(n+2) :can-disable
	return function( elem ) {

		// Only certain elements can match :enabled or :disabled
		// https://html.spec.whatwg.org/multipage/scripting.html#selector-enabled
		// https://html.spec.whatwg.org/multipage/scripting.html#selector-disabled
		if ( "form" in elem ) {

			// Check for inherited disabledness on relevant non-disabled elements:
			// * listed form-associated elements in a disabled fieldset
			//   https://html.spec.whatwg.org/multipage/forms.html#category-listed
			//   https://html.spec.whatwg.org/multipage/forms.html#concept-fe-disabled
			// * option elements in a disabled optgroup
			//   https://html.spec.whatwg.org/multipage/forms.html#concept-option-disabled
			// All such elements have a "form" property.
			if ( elem.parentNode && elem.disabled === false ) {

				// Option elements defer to a parent optgroup if present
				if ( "label" in elem ) {
					if ( "label" in elem.parentNode ) {
						return elem.parentNode.disabled === disabled;
					} else {
						return elem.disabled === disabled;
					}
				}

				// Support: IE 6 - 11
				// Use the isDisabled shortcut property to check for disabled fieldset ancestors
				return elem.isDisabled === disabled ||

					// Where there is no isDisabled, check manually
					/* jshint -W018 */
					elem.isDisabled !== !disabled &&
					inDisabledFieldset( elem ) === disabled;
			}

			return elem.disabled === disabled;

		// Try to winnow out elements that can't be disabled before trusting the disabled property.
		// Some victims get caught in our net (label, legend, menu, track), but it shouldn't
		// even exist on them, let alone have a boolean value.
		} else if ( "label" in elem ) {
			return elem.disabled === disabled;
		}

		// Remaining elements are neither :enabled nor :disabled
		return false;
	};
}

/**
 * Returns a function to use in pseudos for positionals
 * @param {Function} fn
 */
function createPositionalPseudo( fn ) {
	return markFunction( function( argument ) {
		argument = +argument;
		return markFunction( function( seed, matches ) {
			var j,
				matchIndexes = fn( [], seed.length, argument ),
				i = matchIndexes.length;

			// Match elements found at the specified indexes
			while ( i-- ) {
				if ( seed[ ( j = matchIndexes[ i ] ) ] ) {
					seed[ j ] = !( matches[ j ] = seed[ j ] );
				}
			}
		} );
	} );
}

/**
 * Checks a node for validity as a Sizzle context
 * @param {Element|Object=} context
 * @returns {Element|Object|Boolean} The input node if acceptable, otherwise a falsy value
 */
function testContext( context ) {
	return context && typeof context.getElementsByTagName !== "undefined" && context;
}

// Expose support vars for convenience
support = Sizzle.support = {};

/**
 * Detects XML nodes
 * @param {Element|Object} elem An element or a document
 * @returns {Boolean} True iff elem is a non-HTML XML node
 */
isXML = Sizzle.isXML = function( elem ) {
	var namespace = elem.namespaceURI,
		docElem = ( elem.ownerDocument || elem ).documentElement;

	// Support: IE <=8
	// Assume HTML when documentElement doesn't yet exist, such as inside loading iframes
	// https://bugs.jquery.com/ticket/4833
	return !rhtml.test( namespace || docElem && docElem.nodeName || "HTML" );
};

/**
 * Sets document-related variables once based on the current document
 * @param {Element|Object} [doc] An element or document object to use to set the document
 * @returns {Object} Returns the current document
 */
setDocument = Sizzle.setDocument = function( node ) {
	var hasCompare, subWindow,
		doc = node ? node.ownerDocument || node : preferredDoc;

	// Return early if doc is invalid or already selected
	// Support: IE 11+, Edge 17 - 18+
	// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
	// two documents; shallow comparisons work.
	// eslint-disable-next-line eqeqeq
	if ( doc == document || doc.nodeType !== 9 || !doc.documentElement ) {
		return document;
	}

	// Update global variables
	document = doc;
	docElem = document.documentElement;
	documentIsHTML = !isXML( document );

	// Support: IE 9 - 11+, Edge 12 - 18+
	// Accessing iframe documents after unload throws "permission denied" errors (jQuery #13936)
	// Support: IE 11+, Edge 17 - 18+
	// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
	// two documents; shallow comparisons work.
	// eslint-disable-next-line eqeqeq
	if ( preferredDoc != document &&
		( subWindow = document.defaultView ) && subWindow.top !== subWindow ) {

		// Support: IE 11, Edge
		if ( subWindow.addEventListener ) {
			subWindow.addEventListener( "unload", unloadHandler, false );

		// Support: IE 9 - 10 only
		} else if ( subWindow.attachEvent ) {
			subWindow.attachEvent( "onunload", unloadHandler );
		}
	}

	// Support: IE 8 - 11+, Edge 12 - 18+, Chrome <=16 - 25 only, Firefox <=3.6 - 31 only,
	// Safari 4 - 5 only, Opera <=11.6 - 12.x only
	// IE/Edge & older browsers don't support the :scope pseudo-class.
	// Support: Safari 6.0 only
	// Safari 6.0 supports :scope but it's an alias of :root there.
	support.scope = assert( function( el ) {
		docElem.appendChild( el ).appendChild( document.createElement( "div" ) );
		return typeof el.querySelectorAll !== "undefined" &&
			!el.querySelectorAll( ":scope fieldset div" ).length;
	} );

	/* Attributes
	---------------------------------------------------------------------- */

	// Support: IE<8
	// Verify that getAttribute really returns attributes and not properties
	// (excepting IE8 booleans)
	support.attributes = assert( function( el ) {
		el.className = "i";
		return !el.getAttribute( "className" );
	} );

	/* getElement(s)By*
	---------------------------------------------------------------------- */

	// Check if getElementsByTagName("*") returns only elements
	support.getElementsByTagName = assert( function( el ) {
		el.appendChild( document.createComment( "" ) );
		return !el.getElementsByTagName( "*" ).length;
	} );

	// Support: IE<9
	support.getElementsByClassName = rnative.test( document.getElementsByClassName );

	// Support: IE<10
	// Check if getElementById returns elements by name
	// The broken getElementById methods don't pick up programmatically-set names,
	// so use a roundabout getElementsByName test
	support.getById = assert( function( el ) {
		docElem.appendChild( el ).id = expando;
		return !document.getElementsByName || !document.getElementsByName( expando ).length;
	} );

	// ID filter and find
	if ( support.getById ) {
		Expr.filter[ "ID" ] = function( id ) {
			var attrId = id.replace( runescape, funescape );
			return function( elem ) {
				return elem.getAttribute( "id" ) === attrId;
			};
		};
		Expr.find[ "ID" ] = function( id, context ) {
			if ( typeof context.getElementById !== "undefined" && documentIsHTML ) {
				var elem = context.getElementById( id );
				return elem ? [ elem ] : [];
			}
		};
	} else {
		Expr.filter[ "ID" ] =  function( id ) {
			var attrId = id.replace( runescape, funescape );
			return function( elem ) {
				var node = typeof elem.getAttributeNode !== "undefined" &&
					elem.getAttributeNode( "id" );
				return node && node.value === attrId;
			};
		};

		// Support: IE 6 - 7 only
		// getElementById is not reliable as a find shortcut
		Expr.find[ "ID" ] = function( id, context ) {
			if ( typeof context.getElementById !== "undefined" && documentIsHTML ) {
				var node, i, elems,
					elem = context.getElementById( id );

				if ( elem ) {

					// Verify the id attribute
					node = elem.getAttributeNode( "id" );
					if ( node && node.value === id ) {
						return [ elem ];
					}

					// Fall back on getElementsByName
					elems = context.getElementsByName( id );
					i = 0;
					while ( ( elem = elems[ i++ ] ) ) {
						node = elem.getAttributeNode( "id" );
						if ( node && node.value === id ) {
							return [ elem ];
						}
					}
				}

				return [];
			}
		};
	}

	// Tag
	Expr.find[ "TAG" ] = support.getElementsByTagName ?
		function( tag, context ) {
			if ( typeof context.getElementsByTagName !== "undefined" ) {
				return context.getElementsByTagName( tag );

			// DocumentFragment nodes don't have gEBTN
			} else if ( support.qsa ) {
				return context.querySelectorAll( tag );
			}
		} :

		function( tag, context ) {
			var elem,
				tmp = [],
				i = 0,

				// By happy coincidence, a (broken) gEBTN appears on DocumentFragment nodes too
				results = context.getElementsByTagName( tag );

			// Filter out possible comments
			if ( tag === "*" ) {
				while ( ( elem = results[ i++ ] ) ) {
					if ( elem.nodeType === 1 ) {
						tmp.push( elem );
					}
				}

				return tmp;
			}
			return results;
		};

	// Class
	Expr.find[ "CLASS" ] = support.getElementsByClassName && function( className, context ) {
		if ( typeof context.getElementsByClassName !== "undefined" && documentIsHTML ) {
			return context.getElementsByClassName( className );
		}
	};

	/* QSA/matchesSelector
	---------------------------------------------------------------------- */

	// QSA and matchesSelector support

	// matchesSelector(:active) reports false when true (IE9/Opera 11.5)
	rbuggyMatches = [];

	// qSa(:focus) reports false when true (Chrome 21)
	// We allow this because of a bug in IE8/9 that throws an error
	// whenever `document.activeElement` is accessed on an iframe
	// So, we allow :focus to pass through QSA all the time to avoid the IE error
	// See https://bugs.jquery.com/ticket/13378
	rbuggyQSA = [];

	if ( ( support.qsa = rnative.test( document.querySelectorAll ) ) ) {

		// Build QSA regex
		// Regex strategy adopted from Diego Perini
		assert( function( el ) {

			var input;

			// Select is set to empty string on purpose
			// This is to test IE's treatment of not explicitly
			// setting a boolean content attribute,
			// since its presence should be enough
			// https://bugs.jquery.com/ticket/12359
			docElem.appendChild( el ).innerHTML = "<a id='" + expando + "'></a>" +
				"<select id='" + expando + "-\r\\' msallowcapture=''>" +
				"<option selected=''></option></select>";

			// Support: IE8, Opera 11-12.16
			// Nothing should be selected when empty strings follow ^= or $= or *=
			// The test attribute must be unknown in Opera but "safe" for WinRT
			// https://msdn.microsoft.com/en-us/library/ie/hh465388.aspx#attribute_section
			if ( el.querySelectorAll( "[msallowcapture^='']" ).length ) {
				rbuggyQSA.push( "[*^$]=" + whitespace + "*(?:''|\"\")" );
			}

			// Support: IE8
			// Boolean attributes and "value" are not treated correctly
			if ( !el.querySelectorAll( "[selected]" ).length ) {
				rbuggyQSA.push( "\\[" + whitespace + "*(?:value|" + booleans + ")" );
			}

			// Support: Chrome<29, Android<4.4, Safari<7.0+, iOS<7.0+, PhantomJS<1.9.8+
			if ( !el.querySelectorAll( "[id~=" + expando + "-]" ).length ) {
				rbuggyQSA.push( "~=" );
			}

			// Support: IE 11+, Edge 15 - 18+
			// IE 11/Edge don't find elements on a `[name='']` query in some cases.
			// Adding a temporary attribute to the document before the selection works
			// around the issue.
			// Interestingly, IE 10 & older don't seem to have the issue.
			input = document.createElement( "input" );
			input.setAttribute( "name", "" );
			el.appendChild( input );
			if ( !el.querySelectorAll( "[name='']" ).length ) {
				rbuggyQSA.push( "\\[" + whitespace + "*name" + whitespace + "*=" +
					whitespace + "*(?:''|\"\")" );
			}

			// Webkit/Opera - :checked should return selected option elements
			// http://www.w3.org/TR/2011/REC-css3-selectors-20110929/#checked
			// IE8 throws error here and will not see later tests
			if ( !el.querySelectorAll( ":checked" ).length ) {
				rbuggyQSA.push( ":checked" );
			}

			// Support: Safari 8+, iOS 8+
			// https://bugs.webkit.org/show_bug.cgi?id=136851
			// In-page `selector#id sibling-combinator selector` fails
			if ( !el.querySelectorAll( "a#" + expando + "+*" ).length ) {
				rbuggyQSA.push( ".#.+[+~]" );
			}

			// Support: Firefox <=3.6 - 5 only
			// Old Firefox doesn't throw on a badly-escaped identifier.
			el.querySelectorAll( "\\\f" );
			rbuggyQSA.push( "[\\r\\n\\f]" );
		} );

		assert( function( el ) {
			el.innerHTML = "<a href='' disabled='disabled'></a>" +
				"<select disabled='disabled'><option/></select>";

			// Support: Windows 8 Native Apps
			// The type and name attributes are restricted during .innerHTML assignment
			var input = document.createElement( "input" );
			input.setAttribute( "type", "hidden" );
			el.appendChild( input ).setAttribute( "name", "D" );

			// Support: IE8
			// Enforce case-sensitivity of name attribute
			if ( el.querySelectorAll( "[name=d]" ).length ) {
				rbuggyQSA.push( "name" + whitespace + "*[*^$|!~]?=" );
			}

			// FF 3.5 - :enabled/:disabled and hidden elements (hidden elements are still enabled)
			// IE8 throws error here and will not see later tests
			if ( el.querySelectorAll( ":enabled" ).length !== 2 ) {
				rbuggyQSA.push( ":enabled", ":disabled" );
			}

			// Support: IE9-11+
			// IE's :disabled selector does not pick up the children of disabled fieldsets
			docElem.appendChild( el ).disabled = true;
			if ( el.querySelectorAll( ":disabled" ).length !== 2 ) {
				rbuggyQSA.push( ":enabled", ":disabled" );
			}

			// Support: Opera 10 - 11 only
			// Opera 10-11 does not throw on post-comma invalid pseudos
			el.querySelectorAll( "*,:x" );
			rbuggyQSA.push( ",.*:" );
		} );
	}

	if ( ( support.matchesSelector = rnative.test( ( matches = docElem.matches ||
		docElem.webkitMatchesSelector ||
		docElem.mozMatchesSelector ||
		docElem.oMatchesSelector ||
		docElem.msMatchesSelector ) ) ) ) {

		assert( function( el ) {

			// Check to see if it's possible to do matchesSelector
			// on a disconnected node (IE 9)
			support.disconnectedMatch = matches.call( el, "*" );

			// This should fail with an exception
			// Gecko does not error, returns false instead
			matches.call( el, "[s!='']:x" );
			rbuggyMatches.push( "!=", pseudos );
		} );
	}

	rbuggyQSA = rbuggyQSA.length && new RegExp( rbuggyQSA.join( "|" ) );
	rbuggyMatches = rbuggyMatches.length && new RegExp( rbuggyMatches.join( "|" ) );

	/* Contains
	---------------------------------------------------------------------- */
	hasCompare = rnative.test( docElem.compareDocumentPosition );

	// Element contains another
	// Purposefully self-exclusive
	// As in, an element does not contain itself
	contains = hasCompare || rnative.test( docElem.contains ) ?
		function( a, b ) {
			var adown = a.nodeType === 9 ? a.documentElement : a,
				bup = b && b.parentNode;
			return a === bup || !!( bup && bup.nodeType === 1 && (
				adown.contains ?
					adown.contains( bup ) :
					a.compareDocumentPosition && a.compareDocumentPosition( bup ) & 16
			) );
		} :
		function( a, b ) {
			if ( b ) {
				while ( ( b = b.parentNode ) ) {
					if ( b === a ) {
						return true;
					}
				}
			}
			return false;
		};

	/* Sorting
	---------------------------------------------------------------------- */

	// Document order sorting
	sortOrder = hasCompare ?
	function( a, b ) {

		// Flag for duplicate removal
		if ( a === b ) {
			hasDuplicate = true;
			return 0;
		}

		// Sort on method existence if only one input has compareDocumentPosition
		var compare = !a.compareDocumentPosition - !b.compareDocumentPosition;
		if ( compare ) {
			return compare;
		}

		// Calculate position if both inputs belong to the same document
		// Support: IE 11+, Edge 17 - 18+
		// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
		// two documents; shallow comparisons work.
		// eslint-disable-next-line eqeqeq
		compare = ( a.ownerDocument || a ) == ( b.ownerDocument || b ) ?
			a.compareDocumentPosition( b ) :

			// Otherwise we know they are disconnected
			1;

		// Disconnected nodes
		if ( compare & 1 ||
			( !support.sortDetached && b.compareDocumentPosition( a ) === compare ) ) {

			// Choose the first element that is related to our preferred document
			// Support: IE 11+, Edge 17 - 18+
			// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
			// two documents; shallow comparisons work.
			// eslint-disable-next-line eqeqeq
			if ( a == document || a.ownerDocument == preferredDoc &&
				contains( preferredDoc, a ) ) {
				return -1;
			}

			// Support: IE 11+, Edge 17 - 18+
			// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
			// two documents; shallow comparisons work.
			// eslint-disable-next-line eqeqeq
			if ( b == document || b.ownerDocument == preferredDoc &&
				contains( preferredDoc, b ) ) {
				return 1;
			}

			// Maintain original order
			return sortInput ?
				( indexOf( sortInput, a ) - indexOf( sortInput, b ) ) :
				0;
		}

		return compare & 4 ? -1 : 1;
	} :
	function( a, b ) {

		// Exit early if the nodes are identical
		if ( a === b ) {
			hasDuplicate = true;
			return 0;
		}

		var cur,
			i = 0,
			aup = a.parentNode,
			bup = b.parentNode,
			ap = [ a ],
			bp = [ b ];

		// Parentless nodes are either documents or disconnected
		if ( !aup || !bup ) {

			// Support: IE 11+, Edge 17 - 18+
			// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
			// two documents; shallow comparisons work.
			/* eslint-disable eqeqeq */
			return a == document ? -1 :
				b == document ? 1 :
				/* eslint-enable eqeqeq */
				aup ? -1 :
				bup ? 1 :
				sortInput ?
				( indexOf( sortInput, a ) - indexOf( sortInput, b ) ) :
				0;

		// If the nodes are siblings, we can do a quick check
		} else if ( aup === bup ) {
			return siblingCheck( a, b );
		}

		// Otherwise we need full lists of their ancestors for comparison
		cur = a;
		while ( ( cur = cur.parentNode ) ) {
			ap.unshift( cur );
		}
		cur = b;
		while ( ( cur = cur.parentNode ) ) {
			bp.unshift( cur );
		}

		// Walk down the tree looking for a discrepancy
		while ( ap[ i ] === bp[ i ] ) {
			i++;
		}

		return i ?

			// Do a sibling check if the nodes have a common ancestor
			siblingCheck( ap[ i ], bp[ i ] ) :

			// Otherwise nodes in our document sort first
			// Support: IE 11+, Edge 17 - 18+
			// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
			// two documents; shallow comparisons work.
			/* eslint-disable eqeqeq */
			ap[ i ] == preferredDoc ? -1 :
			bp[ i ] == preferredDoc ? 1 :
			/* eslint-enable eqeqeq */
			0;
	};

	return document;
};

Sizzle.matches = function( expr, elements ) {
	return Sizzle( expr, null, null, elements );
};

Sizzle.matchesSelector = function( elem, expr ) {
	setDocument( elem );

	if ( support.matchesSelector && documentIsHTML &&
		!nonnativeSelectorCache[ expr + " " ] &&
		( !rbuggyMatches || !rbuggyMatches.test( expr ) ) &&
		( !rbuggyQSA     || !rbuggyQSA.test( expr ) ) ) {

		try {
			var ret = matches.call( elem, expr );

			// IE 9's matchesSelector returns false on disconnected nodes
			if ( ret || support.disconnectedMatch ||

				// As well, disconnected nodes are said to be in a document
				// fragment in IE 9
				elem.document && elem.document.nodeType !== 11 ) {
				return ret;
			}
		} catch ( e ) {
			nonnativeSelectorCache( expr, true );
		}
	}

	return Sizzle( expr, document, null, [ elem ] ).length > 0;
};

Sizzle.contains = function( context, elem ) {

	// Set document vars if needed
	// Support: IE 11+, Edge 17 - 18+
	// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
	// two documents; shallow comparisons work.
	// eslint-disable-next-line eqeqeq
	if ( ( context.ownerDocument || context ) != document ) {
		setDocument( context );
	}
	return contains( context, elem );
};

Sizzle.attr = function( elem, name ) {

	// Set document vars if needed
	// Support: IE 11+, Edge 17 - 18+
	// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
	// two documents; shallow comparisons work.
	// eslint-disable-next-line eqeqeq
	if ( ( elem.ownerDocument || elem ) != document ) {
		setDocument( elem );
	}

	var fn = Expr.attrHandle[ name.toLowerCase() ],

		// Don't get fooled by Object.prototype properties (jQuery #13807)
		val = fn && hasOwn.call( Expr.attrHandle, name.toLowerCase() ) ?
			fn( elem, name, !documentIsHTML ) :
			undefined;

	return val !== undefined ?
		val :
		support.attributes || !documentIsHTML ?
			elem.getAttribute( name ) :
			( val = elem.getAttributeNode( name ) ) && val.specified ?
				val.value :
				null;
};

Sizzle.escape = function( sel ) {
	return ( sel + "" ).replace( rcssescape, fcssescape );
};

Sizzle.error = function( msg ) {
	throw new Error( "Syntax error, unrecognized expression: " + msg );
};

/**
 * Document sorting and removing duplicates
 * @param {ArrayLike} results
 */
Sizzle.uniqueSort = function( results ) {
	var elem,
		duplicates = [],
		j = 0,
		i = 0;

	// Unless we *know* we can detect duplicates, assume their presence
	hasDuplicate = !support.detectDuplicates;
	sortInput = !support.sortStable && results.slice( 0 );
	results.sort( sortOrder );

	if ( hasDuplicate ) {
		while ( ( elem = results[ i++ ] ) ) {
			if ( elem === results[ i ] ) {
				j = duplicates.push( i );
			}
		}
		while ( j-- ) {
			results.splice( duplicates[ j ], 1 );
		}
	}

	// Clear input after sorting to release objects
	// See https://github.com/jquery/sizzle/pull/225
	sortInput = null;

	return results;
};

/**
 * Utility function for retrieving the text value of an array of DOM nodes
 * @param {Array|Element} elem
 */
getText = Sizzle.getText = function( elem ) {
	var node,
		ret = "",
		i = 0,
		nodeType = elem.nodeType;

	if ( !nodeType ) {

		// If no nodeType, this is expected to be an array
		while ( ( node = elem[ i++ ] ) ) {

			// Do not traverse comment nodes
			ret += getText( node );
		}
	} else if ( nodeType === 1 || nodeType === 9 || nodeType === 11 ) {

		// Use textContent for elements
		// innerText usage removed for consistency of new lines (jQuery #11153)
		if ( typeof elem.textContent === "string" ) {
			return elem.textContent;
		} else {

			// Traverse its children
			for ( elem = elem.firstChild; elem; elem = elem.nextSibling ) {
				ret += getText( elem );
			}
		}
	} else if ( nodeType === 3 || nodeType === 4 ) {
		return elem.nodeValue;
	}

	// Do not include comment or processing instruction nodes

	return ret;
};

Expr = Sizzle.selectors = {

	// Can be adjusted by the user
	cacheLength: 50,

	createPseudo: markFunction,

	match: matchExpr,

	attrHandle: {},

	find: {},

	relative: {
		">": { dir: "parentNode", first: true },
		" ": { dir: "parentNode" },
		"+": { dir: "previousSibling", first: true },
		"~": { dir: "previousSibling" }
	},

	preFilter: {
		"ATTR": function( match ) {
			match[ 1 ] = match[ 1 ].replace( runescape, funescape );

			// Move the given value to match[3] whether quoted or unquoted
			match[ 3 ] = ( match[ 3 ] || match[ 4 ] ||
				match[ 5 ] || "" ).replace( runescape, funescape );

			if ( match[ 2 ] === "~=" ) {
				match[ 3 ] = " " + match[ 3 ] + " ";
			}

			return match.slice( 0, 4 );
		},

		"CHILD": function( match ) {

			/* matches from matchExpr["CHILD"]
				1 type (only|nth|...)
				2 what (child|of-type)
				3 argument (even|odd|\d*|\d*n([+-]\d+)?|...)
				4 xn-component of xn+y argument ([+-]?\d*n|)
				5 sign of xn-component
				6 x of xn-component
				7 sign of y-component
				8 y of y-component
			*/
			match[ 1 ] = match[ 1 ].toLowerCase();

			if ( match[ 1 ].slice( 0, 3 ) === "nth" ) {

				// nth-* requires argument
				if ( !match[ 3 ] ) {
					Sizzle.error( match[ 0 ] );
				}

				// numeric x and y parameters for Expr.filter.CHILD
				// remember that false/true cast respectively to 0/1
				match[ 4 ] = +( match[ 4 ] ?
					match[ 5 ] + ( match[ 6 ] || 1 ) :
					2 * ( match[ 3 ] === "even" || match[ 3 ] === "odd" ) );
				match[ 5 ] = +( ( match[ 7 ] + match[ 8 ] ) || match[ 3 ] === "odd" );

				// other types prohibit arguments
			} else if ( match[ 3 ] ) {
				Sizzle.error( match[ 0 ] );
			}

			return match;
		},

		"PSEUDO": function( match ) {
			var excess,
				unquoted = !match[ 6 ] && match[ 2 ];

			if ( matchExpr[ "CHILD" ].test( match[ 0 ] ) ) {
				return null;
			}

			// Accept quoted arguments as-is
			if ( match[ 3 ] ) {
				match[ 2 ] = match[ 4 ] || match[ 5 ] || "";

			// Strip excess characters from unquoted arguments
			} else if ( unquoted && rpseudo.test( unquoted ) &&

				// Get excess from tokenize (recursively)
				( excess = tokenize( unquoted, true ) ) &&

				// advance to the next closing parenthesis
				( excess = unquoted.indexOf( ")", unquoted.length - excess ) - unquoted.length ) ) {

				// excess is a negative index
				match[ 0 ] = match[ 0 ].slice( 0, excess );
				match[ 2 ] = unquoted.slice( 0, excess );
			}

			// Return only captures needed by the pseudo filter method (type and argument)
			return match.slice( 0, 3 );
		}
	},

	filter: {

		"TAG": function( nodeNameSelector ) {
			var nodeName = nodeNameSelector.replace( runescape, funescape ).toLowerCase();
			return nodeNameSelector === "*" ?
				function() {
					return true;
				} :
				function( elem ) {
					return elem.nodeName && elem.nodeName.toLowerCase() === nodeName;
				};
		},

		"CLASS": function( className ) {
			var pattern = classCache[ className + " " ];

			return pattern ||
				( pattern = new RegExp( "(^|" + whitespace +
					")" + className + "(" + whitespace + "|$)" ) ) && classCache(
						className, function( elem ) {
							return pattern.test(
								typeof elem.className === "string" && elem.className ||
								typeof elem.getAttribute !== "undefined" &&
									elem.getAttribute( "class" ) ||
								""
							);
				} );
		},

		"ATTR": function( name, operator, check ) {
			return function( elem ) {
				var result = Sizzle.attr( elem, name );

				if ( result == null ) {
					return operator === "!=";
				}
				if ( !operator ) {
					return true;
				}

				result += "";

				/* eslint-disable max-len */

				return operator === "=" ? result === check :
					operator === "!=" ? result !== check :
					operator === "^=" ? check && result.indexOf( check ) === 0 :
					operator === "*=" ? check && result.indexOf( check ) > -1 :
					operator === "$=" ? check && result.slice( -check.length ) === check :
					operator === "~=" ? ( " " + result.replace( rwhitespace, " " ) + " " ).indexOf( check ) > -1 :
					operator === "|=" ? result === check || result.slice( 0, check.length + 1 ) === check + "-" :
					false;
				/* eslint-enable max-len */

			};
		},

		"CHILD": function( type, what, _argument, first, last ) {
			var simple = type.slice( 0, 3 ) !== "nth",
				forward = type.slice( -4 ) !== "last",
				ofType = what === "of-type";

			return first === 1 && last === 0 ?

				// Shortcut for :nth-*(n)
				function( elem ) {
					return !!elem.parentNode;
				} :

				function( elem, _context, xml ) {
					var cache, uniqueCache, outerCache, node, nodeIndex, start,
						dir = simple !== forward ? "nextSibling" : "previousSibling",
						parent = elem.parentNode,
						name = ofType && elem.nodeName.toLowerCase(),
						useCache = !xml && !ofType,
						diff = false;

					if ( parent ) {

						// :(first|last|only)-(child|of-type)
						if ( simple ) {
							while ( dir ) {
								node = elem;
								while ( ( node = node[ dir ] ) ) {
									if ( ofType ?
										node.nodeName.toLowerCase() === name :
										node.nodeType === 1 ) {

										return false;
									}
								}

								// Reverse direction for :only-* (if we haven't yet done so)
								start = dir = type === "only" && !start && "nextSibling";
							}
							return true;
						}

						start = [ forward ? parent.firstChild : parent.lastChild ];

						// non-xml :nth-child(...) stores cache data on `parent`
						if ( forward && useCache ) {

							// Seek `elem` from a previously-cached index

							// ...in a gzip-friendly way
							node = parent;
							outerCache = node[ expando ] || ( node[ expando ] = {} );

							// Support: IE <9 only
							// Defend against cloned attroperties (jQuery gh-1709)
							uniqueCache = outerCache[ node.uniqueID ] ||
								( outerCache[ node.uniqueID ] = {} );

							cache = uniqueCache[ type ] || [];
							nodeIndex = cache[ 0 ] === dirruns && cache[ 1 ];
							diff = nodeIndex && cache[ 2 ];
							node = nodeIndex && parent.childNodes[ nodeIndex ];

							while ( ( node = ++nodeIndex && node && node[ dir ] ||

								// Fallback to seeking `elem` from the start
								( diff = nodeIndex = 0 ) || start.pop() ) ) {

								// When found, cache indexes on `parent` and break
								if ( node.nodeType === 1 && ++diff && node === elem ) {
									uniqueCache[ type ] = [ dirruns, nodeIndex, diff ];
									break;
								}
							}

						} else {

							// Use previously-cached element index if available
							if ( useCache ) {

								// ...in a gzip-friendly way
								node = elem;
								outerCache = node[ expando ] || ( node[ expando ] = {} );

								// Support: IE <9 only
								// Defend against cloned attroperties (jQuery gh-1709)
								uniqueCache = outerCache[ node.uniqueID ] ||
									( outerCache[ node.uniqueID ] = {} );

								cache = uniqueCache[ type ] || [];
								nodeIndex = cache[ 0 ] === dirruns && cache[ 1 ];
								diff = nodeIndex;
							}

							// xml :nth-child(...)
							// or :nth-last-child(...) or :nth(-last)?-of-type(...)
							if ( diff === false ) {

								// Use the same loop as above to seek `elem` from the start
								while ( ( node = ++nodeIndex && node && node[ dir ] ||
									( diff = nodeIndex = 0 ) || start.pop() ) ) {

									if ( ( ofType ?
										node.nodeName.toLowerCase() === name :
										node.nodeType === 1 ) &&
										++diff ) {

										// Cache the index of each encountered element
										if ( useCache ) {
											outerCache = node[ expando ] ||
												( node[ expando ] = {} );

											// Support: IE <9 only
											// Defend against cloned attroperties (jQuery gh-1709)
											uniqueCache = outerCache[ node.uniqueID ] ||
												( outerCache[ node.uniqueID ] = {} );

											uniqueCache[ type ] = [ dirruns, diff ];
										}

										if ( node === elem ) {
											break;
										}
									}
								}
							}
						}

						// Incorporate the offset, then check against cycle size
						diff -= last;
						return diff === first || ( diff % first === 0 && diff / first >= 0 );
					}
				};
		},

		"PSEUDO": function( pseudo, argument ) {

			// pseudo-class names are case-insensitive
			// http://www.w3.org/TR/selectors/#pseudo-classes
			// Prioritize by case sensitivity in case custom pseudos are added with uppercase letters
			// Remember that setFilters inherits from pseudos
			var args,
				fn = Expr.pseudos[ pseudo ] || Expr.setFilters[ pseudo.toLowerCase() ] ||
					Sizzle.error( "unsupported pseudo: " + pseudo );

			// The user may use createPseudo to indicate that
			// arguments are needed to create the filter function
			// just as Sizzle does
			if ( fn[ expando ] ) {
				return fn( argument );
			}

			// But maintain support for old signatures
			if ( fn.length > 1 ) {
				args = [ pseudo, pseudo, "", argument ];
				return Expr.setFilters.hasOwnProperty( pseudo.toLowerCase() ) ?
					markFunction( function( seed, matches ) {
						var idx,
							matched = fn( seed, argument ),
							i = matched.length;
						while ( i-- ) {
							idx = indexOf( seed, matched[ i ] );
							seed[ idx ] = !( matches[ idx ] = matched[ i ] );
						}
					} ) :
					function( elem ) {
						return fn( elem, 0, args );
					};
			}

			return fn;
		}
	},

	pseudos: {

		// Potentially complex pseudos
		"not": markFunction( function( selector ) {

			// Trim the selector passed to compile
			// to avoid treating leading and trailing
			// spaces as combinators
			var input = [],
				results = [],
				matcher = compile( selector.replace( rtrim, "$1" ) );

			return matcher[ expando ] ?
				markFunction( function( seed, matches, _context, xml ) {
					var elem,
						unmatched = matcher( seed, null, xml, [] ),
						i = seed.length;

					// Match elements unmatched by `matcher`
					while ( i-- ) {
						if ( ( elem = unmatched[ i ] ) ) {
							seed[ i ] = !( matches[ i ] = elem );
						}
					}
				} ) :
				function( elem, _context, xml ) {
					input[ 0 ] = elem;
					matcher( input, null, xml, results );

					// Don't keep the element (issue #299)
					input[ 0 ] = null;
					return !results.pop();
				};
		} ),

		"has": markFunction( function( selector ) {
			return function( elem ) {
				return Sizzle( selector, elem ).length > 0;
			};
		} ),

		"contains": markFunction( function( text ) {
			text = text.replace( runescape, funescape );
			return function( elem ) {
				return ( elem.textContent || getText( elem ) ).indexOf( text ) > -1;
			};
		} ),

		// "Whether an element is represented by a :lang() selector
		// is based solely on the element's language value
		// being equal to the identifier C,
		// or beginning with the identifier C immediately followed by "-".
		// The matching of C against the element's language value is performed case-insensitively.
		// The identifier C does not have to be a valid language name."
		// http://www.w3.org/TR/selectors/#lang-pseudo
		"lang": markFunction( function( lang ) {

			// lang value must be a valid identifier
			if ( !ridentifier.test( lang || "" ) ) {
				Sizzle.error( "unsupported lang: " + lang );
			}
			lang = lang.replace( runescape, funescape ).toLowerCase();
			return function( elem ) {
				var elemLang;
				do {
					if ( ( elemLang = documentIsHTML ?
						elem.lang :
						elem.getAttribute( "xml:lang" ) || elem.getAttribute( "lang" ) ) ) {

						elemLang = elemLang.toLowerCase();
						return elemLang === lang || elemLang.indexOf( lang + "-" ) === 0;
					}
				} while ( ( elem = elem.parentNode ) && elem.nodeType === 1 );
				return false;
			};
		} ),

		// Miscellaneous
		"target": function( elem ) {
			var hash = window.location && window.location.hash;
			return hash && hash.slice( 1 ) === elem.id;
		},

		"root": function( elem ) {
			return elem === docElem;
		},

		"focus": function( elem ) {
			return elem === document.activeElement &&
				( !document.hasFocus || document.hasFocus() ) &&
				!!( elem.type || elem.href || ~elem.tabIndex );
		},

		// Boolean properties
		"enabled": createDisabledPseudo( false ),
		"disabled": createDisabledPseudo( true ),

		"checked": function( elem ) {

			// In CSS3, :checked should return both checked and selected elements
			// http://www.w3.org/TR/2011/REC-css3-selectors-20110929/#checked
			var nodeName = elem.nodeName.toLowerCase();
			return ( nodeName === "input" && !!elem.checked ) ||
				( nodeName === "option" && !!elem.selected );
		},

		"selected": function( elem ) {

			// Accessing this property makes selected-by-default
			// options in Safari work properly
			if ( elem.parentNode ) {
				// eslint-disable-next-line no-unused-expressions
				elem.parentNode.selectedIndex;
			}

			return elem.selected === true;
		},

		// Contents
		"empty": function( elem ) {

			// http://www.w3.org/TR/selectors/#empty-pseudo
			// :empty is negated by element (1) or content nodes (text: 3; cdata: 4; entity ref: 5),
			//   but not by others (comment: 8; processing instruction: 7; etc.)
			// nodeType < 6 works because attributes (2) do not appear as children
			for ( elem = elem.firstChild; elem; elem = elem.nextSibling ) {
				if ( elem.nodeType < 6 ) {
					return false;
				}
			}
			return true;
		},

		"parent": function( elem ) {
			return !Expr.pseudos[ "empty" ]( elem );
		},

		// Element/input types
		"header": function( elem ) {
			return rheader.test( elem.nodeName );
		},

		"input": function( elem ) {
			return rinputs.test( elem.nodeName );
		},

		"button": function( elem ) {
			var name = elem.nodeName.toLowerCase();
			return name === "input" && elem.type === "button" || name === "button";
		},

		"text": function( elem ) {
			var attr;
			return elem.nodeName.toLowerCase() === "input" &&
				elem.type === "text" &&

				// Support: IE<8
				// New HTML5 attribute values (e.g., "search") appear with elem.type === "text"
				( ( attr = elem.getAttribute( "type" ) ) == null ||
					attr.toLowerCase() === "text" );
		},

		// Position-in-collection
		"first": createPositionalPseudo( function() {
			return [ 0 ];
		} ),

		"last": createPositionalPseudo( function( _matchIndexes, length ) {
			return [ length - 1 ];
		} ),

		"eq": createPositionalPseudo( function( _matchIndexes, length, argument ) {
			return [ argument < 0 ? argument + length : argument ];
		} ),

		"even": createPositionalPseudo( function( matchIndexes, length ) {
			var i = 0;
			for ( ; i < length; i += 2 ) {
				matchIndexes.push( i );
			}
			return matchIndexes;
		} ),

		"odd": createPositionalPseudo( function( matchIndexes, length ) {
			var i = 1;
			for ( ; i < length; i += 2 ) {
				matchIndexes.push( i );
			}
			return matchIndexes;
		} ),

		"lt": createPositionalPseudo( function( matchIndexes, length, argument ) {
			var i = argument < 0 ?
				argument + length :
				argument > length ?
					length :
					argument;
			for ( ; --i >= 0; ) {
				matchIndexes.push( i );
			}
			return matchIndexes;
		} ),

		"gt": createPositionalPseudo( function( matchIndexes, length, argument ) {
			var i = argument < 0 ? argument + length : argument;
			for ( ; ++i < length; ) {
				matchIndexes.push( i );
			}
			return matchIndexes;
		} )
	}
};

Expr.pseudos[ "nth" ] = Expr.pseudos[ "eq" ];

// Add button/input type pseudos
for ( i in { radio: true, checkbox: true, file: true, password: true, image: true } ) {
	Expr.pseudos[ i ] = createInputPseudo( i );
}
for ( i in { submit: true, reset: true } ) {
	Expr.pseudos[ i ] = createButtonPseudo( i );
}

// Easy API for creating new setFilters
function setFilters() {}
setFilters.prototype = Expr.filters = Expr.pseudos;
Expr.setFilters = new setFilters();

tokenize = Sizzle.tokenize = function( selector, parseOnly ) {
	var matched, match, tokens, type,
		soFar, groups, preFilters,
		cached = tokenCache[ selector + " " ];

	if ( cached ) {
		return parseOnly ? 0 : cached.slice( 0 );
	}

	soFar = selector;
	groups = [];
	preFilters = Expr.preFilter;

	while ( soFar ) {

		// Comma and first run
		if ( !matched || ( match = rcomma.exec( soFar ) ) ) {
			if ( match ) {

				// Don't consume trailing commas as valid
				soFar = soFar.slice( match[ 0 ].length ) || soFar;
			}
			groups.push( ( tokens = [] ) );
		}

		matched = false;

		// Combinators
		if ( ( match = rcombinators.exec( soFar ) ) ) {
			matched = match.shift();
			tokens.push( {
				value: matched,

				// Cast descendant combinators to space
				type: match[ 0 ].replace( rtrim, " " )
			} );
			soFar = soFar.slice( matched.length );
		}

		// Filters
		for ( type in Expr.filter ) {
			if ( ( match = matchExpr[ type ].exec( soFar ) ) && ( !preFilters[ type ] ||
				( match = preFilters[ type ]( match ) ) ) ) {
				matched = match.shift();
				tokens.push( {
					value: matched,
					type: type,
					matches: match
				} );
				soFar = soFar.slice( matched.length );
			}
		}

		if ( !matched ) {
			break;
		}
	}

	// Return the length of the invalid excess
	// if we're just parsing
	// Otherwise, throw an error or return tokens
	return parseOnly ?
		soFar.length :
		soFar ?
			Sizzle.error( selector ) :

			// Cache the tokens
			tokenCache( selector, groups ).slice( 0 );
};

function toSelector( tokens ) {
	var i = 0,
		len = tokens.length,
		selector = "";
	for ( ; i < len; i++ ) {
		selector += tokens[ i ].value;
	}
	return selector;
}

function addCombinator( matcher, combinator, base ) {
	var dir = combinator.dir,
		skip = combinator.next,
		key = skip || dir,
		checkNonElements = base && key === "parentNode",
		doneName = done++;

	return combinator.first ?

		// Check against closest ancestor/preceding element
		function( elem, context, xml ) {
			while ( ( elem = elem[ dir ] ) ) {
				if ( elem.nodeType === 1 || checkNonElements ) {
					return matcher( elem, context, xml );
				}
			}
			return false;
		} :

		// Check against all ancestor/preceding elements
		function( elem, context, xml ) {
			var oldCache, uniqueCache, outerCache,
				newCache = [ dirruns, doneName ];

			// We can't set arbitrary data on XML nodes, so they don't benefit from combinator caching
			if ( xml ) {
				while ( ( elem = elem[ dir ] ) ) {
					if ( elem.nodeType === 1 || checkNonElements ) {
						if ( matcher( elem, context, xml ) ) {
							return true;
						}
					}
				}
			} else {
				while ( ( elem = elem[ dir ] ) ) {
					if ( elem.nodeType === 1 || checkNonElements ) {
						outerCache = elem[ expando ] || ( elem[ expando ] = {} );

						// Support: IE <9 only
						// Defend against cloned attroperties (jQuery gh-1709)
						uniqueCache = outerCache[ elem.uniqueID ] ||
							( outerCache[ elem.uniqueID ] = {} );

						if ( skip && skip === elem.nodeName.toLowerCase() ) {
							elem = elem[ dir ] || elem;
						} else if ( ( oldCache = uniqueCache[ key ] ) &&
							oldCache[ 0 ] === dirruns && oldCache[ 1 ] === doneName ) {

							// Assign to newCache so results back-propagate to previous elements
							return ( newCache[ 2 ] = oldCache[ 2 ] );
						} else {

							// Reuse newcache so results back-propagate to previous elements
							uniqueCache[ key ] = newCache;

							// A match means we're done; a fail means we have to keep checking
							if ( ( newCache[ 2 ] = matcher( elem, context, xml ) ) ) {
								return true;
							}
						}
					}
				}
			}
			return false;
		};
}

function elementMatcher( matchers ) {
	return matchers.length > 1 ?
		function( elem, context, xml ) {
			var i = matchers.length;
			while ( i-- ) {
				if ( !matchers[ i ]( elem, context, xml ) ) {
					return false;
				}
			}
			return true;
		} :
		matchers[ 0 ];
}

function multipleContexts( selector, contexts, results ) {
	var i = 0,
		len = contexts.length;
	for ( ; i < len; i++ ) {
		Sizzle( selector, contexts[ i ], results );
	}
	return results;
}

function condense( unmatched, map, filter, context, xml ) {
	var elem,
		newUnmatched = [],
		i = 0,
		len = unmatched.length,
		mapped = map != null;

	for ( ; i < len; i++ ) {
		if ( ( elem = unmatched[ i ] ) ) {
			if ( !filter || filter( elem, context, xml ) ) {
				newUnmatched.push( elem );
				if ( mapped ) {
					map.push( i );
				}
			}
		}
	}

	return newUnmatched;
}

function setMatcher( preFilter, selector, matcher, postFilter, postFinder, postSelector ) {
	if ( postFilter && !postFilter[ expando ] ) {
		postFilter = setMatcher( postFilter );
	}
	if ( postFinder && !postFinder[ expando ] ) {
		postFinder = setMatcher( postFinder, postSelector );
	}
	return markFunction( function( seed, results, context, xml ) {
		var temp, i, elem,
			preMap = [],
			postMap = [],
			preexisting = results.length,

			// Get initial elements from seed or context
			elems = seed || multipleContexts(
				selector || "*",
				context.nodeType ? [ context ] : context,
				[]
			),

			// Prefilter to get matcher input, preserving a map for seed-results synchronization
			matcherIn = preFilter && ( seed || !selector ) ?
				condense( elems, preMap, preFilter, context, xml ) :
				elems,

			matcherOut = matcher ?

				// If we have a postFinder, or filtered seed, or non-seed postFilter or preexisting results,
				postFinder || ( seed ? preFilter : preexisting || postFilter ) ?

					// ...intermediate processing is necessary
					[] :

					// ...otherwise use results directly
					results :
				matcherIn;

		// Find primary matches
		if ( matcher ) {
			matcher( matcherIn, matcherOut, context, xml );
		}

		// Apply postFilter
		if ( postFilter ) {
			temp = condense( matcherOut, postMap );
			postFilter( temp, [], context, xml );

			// Un-match failing elements by moving them back to matcherIn
			i = temp.length;
			while ( i-- ) {
				if ( ( elem = temp[ i ] ) ) {
					matcherOut[ postMap[ i ] ] = !( matcherIn[ postMap[ i ] ] = elem );
				}
			}
		}

		if ( seed ) {
			if ( postFinder || preFilter ) {
				if ( postFinder ) {

					// Get the final matcherOut by condensing this intermediate into postFinder contexts
					temp = [];
					i = matcherOut.length;
					while ( i-- ) {
						if ( ( elem = matcherOut[ i ] ) ) {

							// Restore matcherIn since elem is not yet a final match
							temp.push( ( matcherIn[ i ] = elem ) );
						}
					}
					postFinder( null, ( matcherOut = [] ), temp, xml );
				}

				// Move matched elements from seed to results to keep them synchronized
				i = matcherOut.length;
				while ( i-- ) {
					if ( ( elem = matcherOut[ i ] ) &&
						( temp = postFinder ? indexOf( seed, elem ) : preMap[ i ] ) > -1 ) {

						seed[ temp ] = !( results[ temp ] = elem );
					}
				}
			}

		// Add elements to results, through postFinder if defined
		} else {
			matcherOut = condense(
				matcherOut === results ?
					matcherOut.splice( preexisting, matcherOut.length ) :
					matcherOut
			);
			if ( postFinder ) {
				postFinder( null, results, matcherOut, xml );
			} else {
				push.apply( results, matcherOut );
			}
		}
	} );
}

function matcherFromTokens( tokens ) {
	var checkContext, matcher, j,
		len = tokens.length,
		leadingRelative = Expr.relative[ tokens[ 0 ].type ],
		implicitRelative = leadingRelative || Expr.relative[ " " ],
		i = leadingRelative ? 1 : 0,

		// The foundational matcher ensures that elements are reachable from top-level context(s)
		matchContext = addCombinator( function( elem ) {
			return elem === checkContext;
		}, implicitRelative, true ),
		matchAnyContext = addCombinator( function( elem ) {
			return indexOf( checkContext, elem ) > -1;
		}, implicitRelative, true ),
		matchers = [ function( elem, context, xml ) {
			var ret = ( !leadingRelative && ( xml || context !== outermostContext ) ) || (
				( checkContext = context ).nodeType ?
					matchContext( elem, context, xml ) :
					matchAnyContext( elem, context, xml ) );

			// Avoid hanging onto element (issue #299)
			checkContext = null;
			return ret;
		} ];

	for ( ; i < len; i++ ) {
		if ( ( matcher = Expr.relative[ tokens[ i ].type ] ) ) {
			matchers = [ addCombinator( elementMatcher( matchers ), matcher ) ];
		} else {
			matcher = Expr.filter[ tokens[ i ].type ].apply( null, tokens[ i ].matches );

			// Return special upon seeing a positional matcher
			if ( matcher[ expando ] ) {

				// Find the next relative operator (if any) for proper handling
				j = ++i;
				for ( ; j < len; j++ ) {
					if ( Expr.relative[ tokens[ j ].type ] ) {
						break;
					}
				}
				return setMatcher(
					i > 1 && elementMatcher( matchers ),
					i > 1 && toSelector(

					// If the preceding token was a descendant combinator, insert an implicit any-element `*`
					tokens
						.slice( 0, i - 1 )
						.concat( { value: tokens[ i - 2 ].type === " " ? "*" : "" } )
					).replace( rtrim, "$1" ),
					matcher,
					i < j && matcherFromTokens( tokens.slice( i, j ) ),
					j < len && matcherFromTokens( ( tokens = tokens.slice( j ) ) ),
					j < len && toSelector( tokens )
				);
			}
			matchers.push( matcher );
		}
	}

	return elementMatcher( matchers );
}

function matcherFromGroupMatchers( elementMatchers, setMatchers ) {
	var bySet = setMatchers.length > 0,
		byElement = elementMatchers.length > 0,
		superMatcher = function( seed, context, xml, results, outermost ) {
			var elem, j, matcher,
				matchedCount = 0,
				i = "0",
				unmatched = seed && [],
				setMatched = [],
				contextBackup = outermostContext,

				// We must always have either seed elements or outermost context
				elems = seed || byElement && Expr.find[ "TAG" ]( "*", outermost ),

				// Use integer dirruns iff this is the outermost matcher
				dirrunsUnique = ( dirruns += contextBackup == null ? 1 : Math.random() || 0.1 ),
				len = elems.length;

			if ( outermost ) {

				// Support: IE 11+, Edge 17 - 18+
				// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
				// two documents; shallow comparisons work.
				// eslint-disable-next-line eqeqeq
				outermostContext = context == document || context || outermost;
			}

			// Add elements passing elementMatchers directly to results
			// Support: IE<9, Safari
			// Tolerate NodeList properties (IE: "length"; Safari: <number>) matching elements by id
			for ( ; i !== len && ( elem = elems[ i ] ) != null; i++ ) {
				if ( byElement && elem ) {
					j = 0;

					// Support: IE 11+, Edge 17 - 18+
					// IE/Edge sometimes throw a "Permission denied" error when strict-comparing
					// two documents; shallow comparisons work.
					// eslint-disable-next-line eqeqeq
					if ( !context && elem.ownerDocument != document ) {
						setDocument( elem );
						xml = !documentIsHTML;
					}
					while ( ( matcher = elementMatchers[ j++ ] ) ) {
						if ( matcher( elem, context || document, xml ) ) {
							results.push( elem );
							break;
						}
					}
					if ( outermost ) {
						dirruns = dirrunsUnique;
					}
				}

				// Track unmatched elements for set filters
				if ( bySet ) {

					// They will have gone through all possible matchers
					if ( ( elem = !matcher && elem ) ) {
						matchedCount--;
					}

					// Lengthen the array for every element, matched or not
					if ( seed ) {
						unmatched.push( elem );
					}
				}
			}

			// `i` is now the count of elements visited above, and adding it to `matchedCount`
			// makes the latter nonnegative.
			matchedCount += i;

			// Apply set filters to unmatched elements
			// NOTE: This can be skipped if there are no unmatched elements (i.e., `matchedCount`
			// equals `i`), unless we didn't visit _any_ elements in the above loop because we have
			// no element matchers and no seed.
			// Incrementing an initially-string "0" `i` allows `i` to remain a string only in that
			// case, which will result in a "00" `matchedCount` that differs from `i` but is also
			// numerically zero.
			if ( bySet && i !== matchedCount ) {
				j = 0;
				while ( ( matcher = setMatchers[ j++ ] ) ) {
					matcher( unmatched, setMatched, context, xml );
				}

				if ( seed ) {

					// Reintegrate element matches to eliminate the need for sorting
					if ( matchedCount > 0 ) {
						while ( i-- ) {
							if ( !( unmatched[ i ] || setMatched[ i ] ) ) {
								setMatched[ i ] = pop.call( results );
							}
						}
					}

					// Discard index placeholder values to get only actual matches
					setMatched = condense( setMatched );
				}

				// Add matches to results
				push.apply( results, setMatched );

				// Seedless set matches succeeding multiple successful matchers stipulate sorting
				if ( outermost && !seed && setMatched.length > 0 &&
					( matchedCount + setMatchers.length ) > 1 ) {

					Sizzle.uniqueSort( results );
				}
			}

			// Override manipulation of globals by nested matchers
			if ( outermost ) {
				dirruns = dirrunsUnique;
				outermostContext = contextBackup;
			}

			return unmatched;
		};

	return bySet ?
		markFunction( superMatcher ) :
		superMatcher;
}

compile = Sizzle.compile = function( selector, match /* Internal Use Only */ ) {
	var i,
		setMatchers = [],
		elementMatchers = [],
		cached = compilerCache[ selector + " " ];

	if ( !cached ) {

		// Generate a function of recursive functions that can be used to check each element
		if ( !match ) {
			match = tokenize( selector );
		}
		i = match.length;
		while ( i-- ) {
			cached = matcherFromTokens( match[ i ] );
			if ( cached[ expando ] ) {
				setMatchers.push( cached );
			} else {
				elementMatchers.push( cached );
			}
		}

		// Cache the compiled function
		cached = compilerCache(
			selector,
			matcherFromGroupMatchers( elementMatchers, setMatchers )
		);

		// Save selector and tokenization
		cached.selector = selector;
	}
	return cached;
};

/**
 * A low-level selection function that works with Sizzle's compiled
 *  selector functions
 * @param {String|Function} selector A selector or a pre-compiled
 *  selector function built with Sizzle.compile
 * @param {Element} context
 * @param {Array} [results]
 * @param {Array} [seed] A set of elements to match against
 */
select = Sizzle.select = function( selector, context, results, seed ) {
	var i, tokens, token, type, find,
		compiled = typeof selector === "function" && selector,
		match = !seed && tokenize( ( selector = compiled.selector || selector ) );

	results = results || [];

	// Try to minimize operations if there is only one selector in the list and no seed
	// (the latter of which guarantees us context)
	if ( match.length === 1 ) {

		// Reduce context if the leading compound selector is an ID
		tokens = match[ 0 ] = match[ 0 ].slice( 0 );
		if ( tokens.length > 2 && ( token = tokens[ 0 ] ).type === "ID" &&
			context.nodeType === 9 && documentIsHTML && Expr.relative[ tokens[ 1 ].type ] ) {

			context = ( Expr.find[ "ID" ]( token.matches[ 0 ]
				.replace( runescape, funescape ), context ) || [] )[ 0 ];
			if ( !context ) {
				return results;

			// Precompiled matchers will still verify ancestry, so step up a level
			} else if ( compiled ) {
				context = context.parentNode;
			}

			selector = selector.slice( tokens.shift().value.length );
		}

		// Fetch a seed set for right-to-left matching
		i = matchExpr[ "needsContext" ].test( selector ) ? 0 : tokens.length;
		while ( i-- ) {
			token = tokens[ i ];

			// Abort if we hit a combinator
			if ( Expr.relative[ ( type = token.type ) ] ) {
				break;
			}
			if ( ( find = Expr.find[ type ] ) ) {

				// Search, expanding context for leading sibling combinators
				if ( ( seed = find(
					token.matches[ 0 ].replace( runescape, funescape ),
					rsibling.test( tokens[ 0 ].type ) && testContext( context.parentNode ) ||
						context
				) ) ) {

					// If seed is empty or no tokens remain, we can return early
					tokens.splice( i, 1 );
					selector = seed.length && toSelector( tokens );
					if ( !selector ) {
						push.apply( results, seed );
						return results;
					}

					break;
				}
			}
		}
	}

	// Compile and execute a filtering function if one is not provided
	// Provide `match` to avoid retokenization if we modified the selector above
	( compiled || compile( selector, match ) )(
		seed,
		context,
		!documentIsHTML,
		results,
		!context || rsibling.test( selector ) && testContext( context.parentNode ) || context
	);
	return results;
};

// One-time assignments

// Sort stability
support.sortStable = expando.split( "" ).sort( sortOrder ).join( "" ) === expando;

// Support: Chrome 14-35+
// Always assume duplicates if they aren't passed to the comparison function
support.detectDuplicates = !!hasDuplicate;

// Initialize against the default document
setDocument();

// Support: Webkit<537.32 - Safari 6.0.3/Chrome 25 (fixed in Chrome 27)
// Detached nodes confoundingly follow *each other*
support.sortDetached = assert( function( el ) {

	// Should return 1, but returns 4 (following)
	return el.compareDocumentPosition( document.createElement( "fieldset" ) ) & 1;
} );

// Support: IE<8
// Prevent attribute/property "interpolation"
// https://msdn.microsoft.com/en-us/library/ms536429%28VS.85%29.aspx
if ( !assert( function( el ) {
	el.innerHTML = "<a href='#'></a>";
	return el.firstChild.getAttribute( "href" ) === "#";
} ) ) {
	addHandle( "type|href|height|width", function( elem, name, isXML ) {
		if ( !isXML ) {
			return elem.getAttribute( name, name.toLowerCase() === "type" ? 1 : 2 );
		}
	} );
}

// Support: IE<9
// Use defaultValue in place of getAttribute("value")
if ( !support.attributes || !assert( function( el ) {
	el.innerHTML = "<input/>";
	el.firstChild.setAttribute( "value", "" );
	return el.firstChild.getAttribute( "value" ) === "";
} ) ) {
	addHandle( "value", function( elem, _name, isXML ) {
		if ( !isXML && elem.nodeName.toLowerCase() === "input" ) {
			return elem.defaultValue;
		}
	} );
}

// Support: IE<9
// Use getAttributeNode to fetch booleans when getAttribute lies
if ( !assert( function( el ) {
	return el.getAttribute( "disabled" ) == null;
} ) ) {
	addHandle( booleans, function( elem, name, isXML ) {
		var val;
		if ( !isXML ) {
			return elem[ name ] === true ? name.toLowerCase() :
				( val = elem.getAttributeNode( name ) ) && val.specified ?
					val.value :
					null;
		}
	} );
}

return Sizzle;

} )( window );



jQuery.find = Sizzle;
jQuery.expr = Sizzle.selectors;

// Deprecated
jQuery.expr[ ":" ] = jQuery.expr.pseudos;
jQuery.uniqueSort = jQuery.unique = Sizzle.uniqueSort;
jQuery.text = Sizzle.getText;
jQuery.isXMLDoc = Sizzle.isXML;
jQuery.contains = Sizzle.contains;
jQuery.escapeSelector = Sizzle.escape;




var dir = function( elem, dir, until ) {
	var matched = [],
		truncate = until !== undefined;

	while ( ( elem = elem[ dir ] ) && elem.nodeType !== 9 ) {
		if ( elem.nodeType === 1 ) {
			if ( truncate && jQuery( elem ).is( until ) ) {
				break;
			}
			matched.push( elem );
		}
	}
	return matched;
};


var siblings = function( n, elem ) {
	var matched = [];

	for ( ; n; n = n.nextSibling ) {
		if ( n.nodeType === 1 && n !== elem ) {
			matched.push( n );
		}
	}

	return matched;
};


var rneedsContext = jQuery.expr.match.needsContext;



function nodeName( elem, name ) {

  return elem.nodeName && elem.nodeName.toLowerCase() === name.toLowerCase();

};
var rsingleTag = ( /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i );



// Implement the identical functionality for filter and not
function winnow( elements, qualifier, not ) {
	if ( isFunction( qualifier ) ) {
		return jQuery.grep( elements, function( elem, i ) {
			return !!qualifier.call( elem, i, elem ) !== not;
		} );
	}

	// Single element
	if ( qualifier.nodeType ) {
		return jQuery.grep( elements, function( elem ) {
			return ( elem === qualifier ) !== not;
		} );
	}

	// Arraylike of elements (jQuery, arguments, Array)
	if ( typeof qualifier !== "string" ) {
		return jQuery.grep( elements, function( elem ) {
			return ( indexOf.call( qualifier, elem ) > -1 ) !== not;
		} );
	}

	// Filtered directly for both simple and complex selectors
	return jQuery.filter( qualifier, elements, not );
}

jQuery.filter = function( expr, elems, not ) {
	var elem = elems[ 0 ];

	if ( not ) {
		expr = ":not(" + expr + ")";
	}

	if ( elems.length === 1 && elem.nodeType === 1 ) {
		return jQuery.find.matchesSelector( elem, expr ) ? [ elem ] : [];
	}

	return jQuery.find.matches( expr, jQuery.grep( elems, function( elem ) {
		return elem.nodeType === 1;
	} ) );
};

jQuery.fn.extend( {
	find: function( selector ) {
		var i, ret,
			len = this.length,
			self = this;

		if ( typeof selector !== "string" ) {
			return this.pushStack( jQuery( selector ).filter( function() {
				for ( i = 0; i < len; i++ ) {
					if ( jQuery.contains( self[ i ], this ) ) {
						return true;
					}
				}
			} ) );
		}

		ret = this.pushStack( [] );

		for ( i = 0; i < len; i++ ) {
			jQuery.find( selector, self[ i ], ret );
		}

		return len > 1 ? jQuery.uniqueSort( ret ) : ret;
	},
	filter: function( selector ) {
		return this.pushStack( winnow( this, selector || [], false ) );
	},
	not: function( selector ) {
		return this.pushStack( winnow( this, selector || [], true ) );
	},
	is: function( selector ) {
		return !!winnow(
			this,

			// If this is a positional/relative selector, check membership in the returned set
			// so $("p:first").is("p:last") won't return true for a doc with two "p".
			typeof selector === "string" && rneedsContext.test( selector ) ?
				jQuery( selector ) :
				selector || [],
			false
		).length;
	}
} );


// Initialize a jQuery object


// A central reference to the root jQuery(document)
var rootjQuery,

	// A simple way to check for HTML strings
	// Prioritize #id over <tag> to avoid XSS via location.hash (#9521)
	// Strict HTML recognition (#11290: must start with <)
	// Shortcut simple #id case for speed
	rquickExpr = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/,

	init = jQuery.fn.init = function( selector, context, root ) {
		var match, elem;

		// HANDLE: $(""), $(null), $(undefined), $(false)
		if ( !selector ) {
			return this;
		}

		// Method init() accepts an alternate rootjQuery
		// so migrate can support jQuery.sub (gh-2101)
		root = root || rootjQuery;

		// Handle HTML strings
		if ( typeof selector === "string" ) {
			if ( selector[ 0 ] === "<" &&
				selector[ selector.length - 1 ] === ">" &&
				selector.length >= 3 ) {

				// Assume that strings that start and end with <> are HTML and skip the regex check
				match = [ null, selector, null ];

			} else {
				match = rquickExpr.exec( selector );
			}

			// Match html or make sure no context is specified for #id
			if ( match && ( match[ 1 ] || !context ) ) {

				// HANDLE: $(html) -> $(array)
				if ( match[ 1 ] ) {
					context = context instanceof jQuery ? context[ 0 ] : context;

					// Option to run scripts is true for back-compat
					// Intentionally let the error be thrown if parseHTML is not present
					jQuery.merge( this, jQuery.parseHTML(
						match[ 1 ],
						context && context.nodeType ? context.ownerDocument || context : document,
						true
					) );

					// HANDLE: $(html, props)
					if ( rsingleTag.test( match[ 1 ] ) && jQuery.isPlainObject( context ) ) {
						for ( match in context ) {

							// Properties of context are called as methods if possible
							if ( isFunction( this[ match ] ) ) {
								this[ match ]( context[ match ] );

							// ...and otherwise set as attributes
							} else {
								this.attr( match, context[ match ] );
							}
						}
					}

					return this;

				// HANDLE: $(#id)
				} else {
					elem = document.getElementById( match[ 2 ] );

					if ( elem ) {

						// Inject the element directly into the jQuery object
						this[ 0 ] = elem;
						this.length = 1;
					}
					return this;
				}

			// HANDLE: $(expr, $(...))
			} else if ( !context || context.jquery ) {
				return ( context || root ).find( selector );

			// HANDLE: $(expr, context)
			// (which is just equivalent to: $(context).find(expr)
			} else {
				return this.constructor( context ).find( selector );
			}

		// HANDLE: $(DOMElement)
		} else if ( selector.nodeType ) {
			this[ 0 ] = selector;
			this.length = 1;
			return this;

		// HANDLE: $(function)
		// Shortcut for document ready
		} else if ( isFunction( selector ) ) {
			return root.ready !== undefined ?
				root.ready( selector ) :

				// Execute immediately if ready is not present
				selector( jQuery );
		}

		return jQuery.makeArray( selector, this );
	};

// Give the init function the jQuery prototype for later instantiation
init.prototype = jQuery.fn;

// Initialize central reference
rootjQuery = jQuery( document );


var rparentsprev = /^(?:parents|prev(?:Until|All))/,

	// Methods guaranteed to produce a unique set when starting from a unique set
	guaranteedUnique = {
		children: true,
		contents: true,
		next: true,
		prev: true
	};

jQuery.fn.extend( {
	has: function( target ) {
		var targets = jQuery( target, this ),
			l = targets.length;

		return this.filter( function() {
			var i = 0;
			for ( ; i < l; i++ ) {
				if ( jQuery.contains( this, targets[ i ] ) ) {
					return true;
				}
			}
		} );
	},

	closest: function( selectors, context ) {
		var cur,
			i = 0,
			l = this.length,
			matched = [],
			targets = typeof selectors !== "string" && jQuery( selectors );

		// Positional selectors never match, since there's no _selection_ context
		if ( !rneedsContext.test( selectors ) ) {
			for ( ; i < l; i++ ) {
				for ( cur = this[ i ]; cur && cur !== context; cur = cur.parentNode ) {

					// Always skip document fragments
					if ( cur.nodeType < 11 && ( targets ?
						targets.index( cur ) > -1 :

						// Don't pass non-elements to Sizzle
						cur.nodeType === 1 &&
							jQuery.find.matchesSelector( cur, selectors ) ) ) {

						matched.push( cur );
						break;
					}
				}
			}
		}

		return this.pushStack( matched.length > 1 ? jQuery.uniqueSort( matched ) : matched );
	},

	// Determine the position of an element within the set
	index: function( elem ) {

		// No argument, return index in parent
		if ( !elem ) {
			return ( this[ 0 ] && this[ 0 ].parentNode ) ? this.first().prevAll().length : -1;
		}

		// Index in selector
		if ( typeof elem === "string" ) {
			return indexOf.call( jQuery( elem ), this[ 0 ] );
		}

		// Locate the position of the desired element
		return indexOf.call( this,

			// If it receives a jQuery object, the first element is used
			elem.jquery ? elem[ 0 ] : elem
		);
	},

	add: function( selector, context ) {
		return this.pushStack(
			jQuery.uniqueSort(
				jQuery.merge( this.get(), jQuery( selector, context ) )
			)
		);
	},

	addBack: function( selector ) {
		return this.add( selector == null ?
			this.prevObject : this.prevObject.filter( selector )
		);
	}
} );

function sibling( cur, dir ) {
	while ( ( cur = cur[ dir ] ) && cur.nodeType !== 1 ) {}
	return cur;
}

jQuery.each( {
	parent: function( elem ) {
		var parent = elem.parentNode;
		return parent && parent.nodeType !== 11 ? parent : null;
	},
	parents: function( elem ) {
		return dir( elem, "parentNode" );
	},
	parentsUntil: function( elem, _i, until ) {
		return dir( elem, "parentNode", until );
	},
	next: function( elem ) {
		return sibling( elem, "nextSibling" );
	},
	prev: function( elem ) {
		return sibling( elem, "previousSibling" );
	},
	nextAll: function( elem ) {
		return dir( elem, "nextSibling" );
	},
	prevAll: function( elem ) {
		return dir( elem, "previousSibling" );
	},
	nextUntil: function( elem, _i, until ) {
		return dir( elem, "nextSibling", until );
	},
	prevUntil: function( elem, _i, until ) {
		return dir( elem, "previousSibling", until );
	},
	siblings: function( elem ) {
		return siblings( ( elem.parentNode || {} ).firstChild, elem );
	},
	children: function( elem ) {
		return siblings( elem.firstChild );
	},
	contents: function( elem ) {
		if ( elem.contentDocument != null &&

			// Support: IE 11+
			// <object> elements with no `data` attribute has an object
			// `contentDocument` with a `null` prototype.
			getProto( elem.contentDocument ) ) {

			return elem.contentDocument;
		}

		// Support: IE 9 - 11 only, iOS 7 only, Android Browser <=4.3 only
		// Treat the template element as a regular one in browsers that
		// don't support it.
		if ( nodeName( elem, "template" ) ) {
			elem = elem.content || elem;
		}

		return jQuery.merge( [], elem.childNodes );
	}
}, function( name, fn ) {
	jQuery.fn[ name ] = function( until, selector ) {
		var matched = jQuery.map( this, fn, until );

		if ( name.slice( -5 ) !== "Until" ) {
			selector = until;
		}

		if ( selector && typeof selector === "string" ) {
			matched = jQuery.filter( selector, matched );
		}

		if ( this.length > 1 ) {

			// Remove duplicates
			if ( !guaranteedUnique[ name ] ) {
				jQuery.uniqueSort( matched );
			}

			// Reverse order for parents* and prev-derivatives
			if ( rparentsprev.test( name ) ) {
				matched.reverse();
			}
		}

		return this.pushStack( matched );
	};
} );
var rnothtmlwhite = ( /[^\x20\t\r\n\f]+/g );



// Convert String-formatted options into Object-formatted ones
function createOptions( options ) {
	var object = {};
	jQuery.each( options.match( rnothtmlwhite ) || [], function( _, flag ) {
		object[ flag ] = true;
	} );
	return object;
}

/*
 * Create a callback list using the following parameters:
 *
 *	options: an optional list of space-separated options that will change how
 *			the callback list behaves or a more traditional option object
 *
 * By default a callback list will act like an event callback list and can be
 * "fired" multiple times.
 *
 * Possible options:
 *
 *	once:			will ensure the callback list can only be fired once (like a Deferred)
 *
 *	memory:			will keep track of previous values and will call any callback added
 *					after the list has been fired right away with the latest "memorized"
 *					values (like a Deferred)
 *
 *	unique:			will ensure a callback can only be added once (no duplicate in the list)
 *
 *	stopOnFalse:	interrupt callings when a callback returns false
 *
 */
jQuery.Callbacks = function( options ) {

	// Convert options from String-formatted to Object-formatted if needed
	// (we check in cache first)
	options = typeof options === "string" ?
		createOptions( options ) :
		jQuery.extend( {}, options );

	var // Flag to know if list is currently firing
		firing,

		// Last fire value for non-forgettable lists
		memory,

		// Flag to know if list was already fired
		fired,

		// Flag to prevent firing
		locked,

		// Actual callback list
		list = [],

		// Queue of execution data for repeatable lists
		queue = [],

		// Index of currently firing callback (modified by add/remove as needed)
		firingIndex = -1,

		// Fire callbacks
		fire = function() {

			// Enforce single-firing
			locked = locked || options.once;

			// Execute callbacks for all pending executions,
			// respecting firingIndex overrides and runtime changes
			fired = firing = true;
			for ( ; queue.length; firingIndex = -1 ) {
				memory = queue.shift();
				while ( ++firingIndex < list.length ) {

					// Run callback and check for early termination
					if ( list[ firingIndex ].apply( memory[ 0 ], memory[ 1 ] ) === false &&
						options.stopOnFalse ) {

						// Jump to end and forget the data so .add doesn't re-fire
						firingIndex = list.length;
						memory = false;
					}
				}
			}

			// Forget the data if we're done with it
			if ( !options.memory ) {
				memory = false;
			}

			firing = false;

			// Clean up if we're done firing for good
			if ( locked ) {

				// Keep an empty list if we have data for future add calls
				if ( memory ) {
					list = [];

				// Otherwise, this object is spent
				} else {
					list = "";
				}
			}
		},

		// Actual Callbacks object
		self = {

			// Add a callback or a collection of callbacks to the list
			add: function() {
				if ( list ) {

					// If we have memory from a past run, we should fire after adding
					if ( memory && !firing ) {
						firingIndex = list.length - 1;
						queue.push( memory );
					}

					( function add( args ) {
						jQuery.each( args, function( _, arg ) {
							if ( isFunction( arg ) ) {
								if ( !options.unique || !self.has( arg ) ) {
									list.push( arg );
								}
							} else if ( arg && arg.length && toType( arg ) !== "string" ) {

								// Inspect recursively
								add( arg );
							}
						} );
					} )( arguments );

					if ( memory && !firing ) {
						fire();
					}
				}
				return this;
			},

			// Remove a callback from the list
			remove: function() {
				jQuery.each( arguments, function( _, arg ) {
					var index;
					while ( ( index = jQuery.inArray( arg, list, index ) ) > -1 ) {
						list.splice( index, 1 );

						// Handle firing indexes
						if ( index <= firingIndex ) {
							firingIndex--;
						}
					}
				} );
				return this;
			},

			// Check if a given callback is in the list.
			// If no argument is given, return whether or not list has callbacks attached.
			has: function( fn ) {
				return fn ?
					jQuery.inArray( fn, list ) > -1 :
					list.length > 0;
			},

			// Remove all callbacks from the list
			empty: function() {
				if ( list ) {
					list = [];
				}
				return this;
			},

			// Disable .fire and .add
			// Abort any current/pending executions
			// Clear all callbacks and values
			disable: function() {
				locked = queue = [];
				list = memory = "";
				return this;
			},
			disabled: function() {
				return !list;
			},

			// Disable .fire
			// Also disable .add unless we have memory (since it would have no effect)
			// Abort any pending executions
			lock: function() {
				locked = queue = [];
				if ( !memory && !firing ) {
					list = memory = "";
				}
				return this;
			},
			locked: function() {
				return !!locked;
			},

			// Call all callbacks with the given context and arguments
			fireWith: function( context, args ) {
				if ( !locked ) {
					args = args || [];
					args = [ context, args.slice ? args.slice() : args ];
					queue.push( args );
					if ( !firing ) {
						fire();
					}
				}
				return this;
			},

			// Call all the callbacks with the given arguments
			fire: function() {
				self.fireWith( this, arguments );
				return this;
			},

			// To know if the callbacks have already been called at least once
			fired: function() {
				return !!fired;
			}
		};

	return self;
};


function Identity( v ) {
	return v;
}
function Thrower( ex ) {
	throw ex;
}

function adoptValue( value, resolve, reject, noValue ) {
	var method;

	try {

		// Check for promise aspect first to privilege synchronous behavior
		if ( value && isFunction( ( method = value.promise ) ) ) {
			method.call( value ).done( resolve ).fail( reject );

		// Other thenables
		} else if ( value && isFunction( ( method = value.then ) ) ) {
			method.call( value, resolve, reject );

		// Other non-thenables
		} else {

			// Control `resolve` arguments by letting Array#slice cast boolean `noValue` to integer:
			// * false: [ value ].slice( 0 ) => resolve( value )
			// * true: [ value ].slice( 1 ) => resolve()
			resolve.apply( undefined, [ value ].slice( noValue ) );
		}

	// For Promises/A+, convert exceptions into rejections
	// Since jQuery.when doesn't unwrap thenables, we can skip the extra checks appearing in
	// Deferred#then to conditionally suppress rejection.
	} catch ( value ) {

		// Support: Android 4.0 only
		// Strict mode functions invoked without .call/.apply get global-object context
		reject.apply( undefined, [ value ] );
	}
}

jQuery.extend( {

	Deferred: function( func ) {
		var tuples = [

				// action, add listener, callbacks,
				// ... .then handlers, argument index, [final state]
				[ "notify", "progress", jQuery.Callbacks( "memory" ),
					jQuery.Callbacks( "memory" ), 2 ],
				[ "resolve", "done", jQuery.Callbacks( "once memory" ),
					jQuery.Callbacks( "once memory" ), 0, "resolved" ],
				[ "reject", "fail", jQuery.Callbacks( "once memory" ),
					jQuery.Callbacks( "once memory" ), 1, "rejected" ]
			],
			state = "pending",
			promise = {
				state: function() {
					return state;
				},
				always: function() {
					deferred.done( arguments ).fail( arguments );
					return this;
				},
				"catch": function( fn ) {
					return promise.then( null, fn );
				},

				// Keep pipe for back-compat
				pipe: function( /* fnDone, fnFail, fnProgress */ ) {
					var fns = arguments;

					return jQuery.Deferred( function( newDefer ) {
						jQuery.each( tuples, function( _i, tuple ) {

							// Map tuples (progress, done, fail) to arguments (done, fail, progress)
							var fn = isFunction( fns[ tuple[ 4 ] ] ) && fns[ tuple[ 4 ] ];

							// deferred.progress(function() { bind to newDefer or newDefer.notify })
							// deferred.done(function() { bind to newDefer or newDefer.resolve })
							// deferred.fail(function() { bind to newDefer or newDefer.reject })
							deferred[ tuple[ 1 ] ]( function() {
								var returned = fn && fn.apply( this, arguments );
								if ( returned && isFunction( returned.promise ) ) {
									returned.promise()
										.progress( newDefer.notify )
										.done( newDefer.resolve )
										.fail( newDefer.reject );
								} else {
									newDefer[ tuple[ 0 ] + "With" ](
										this,
										fn ? [ returned ] : arguments
									);
								}
							} );
						} );
						fns = null;
					} ).promise();
				},
				then: function( onFulfilled, onRejected, onProgress ) {
					var maxDepth = 0;
					function resolve( depth, deferred, handler, special ) {
						return function() {
							var that = this,
								args = arguments,
								mightThrow = function() {
									var returned, then;

									// Support: Promises/A+ section 2.3.3.3.3
									// https://promisesaplus.com/#point-59
									// Ignore double-resolution attempts
									if ( depth < maxDepth ) {
										return;
									}

									returned = handler.apply( that, args );

									// Support: Promises/A+ section 2.3.1
									// https://promisesaplus.com/#point-48
									if ( returned === deferred.promise() ) {
										throw new TypeError( "Thenable self-resolution" );
									}

									// Support: Promises/A+ sections 2.3.3.1, 3.5
									// https://promisesaplus.com/#point-54
									// https://promisesaplus.com/#point-75
									// Retrieve `then` only once
									then = returned &&

										// Support: Promises/A+ section 2.3.4
										// https://promisesaplus.com/#point-64
										// Only check objects and functions for thenability
										( typeof returned === "object" ||
											typeof returned === "function" ) &&
										returned.then;

									// Handle a returned thenable
									if ( isFunction( then ) ) {

										// Special processors (notify) just wait for resolution
										if ( special ) {
											then.call(
												returned,
												resolve( maxDepth, deferred, Identity, special ),
												resolve( maxDepth, deferred, Thrower, special )
											);

										// Normal processors (resolve) also hook into progress
										} else {

											// ...and disregard older resolution values
											maxDepth++;

											then.call(
												returned,
												resolve( maxDepth, deferred, Identity, special ),
												resolve( maxDepth, deferred, Thrower, special ),
												resolve( maxDepth, deferred, Identity,
													deferred.notifyWith )
											);
										}

									// Handle all other returned values
									} else {

										// Only substitute handlers pass on context
										// and multiple values (non-spec behavior)
										if ( handler !== Identity ) {
											that = undefined;
											args = [ returned ];
										}

										// Process the value(s)
										// Default process is resolve
										( special || deferred.resolveWith )( that, args );
									}
								},

								// Only normal processors (resolve) catch and reject exceptions
								process = special ?
									mightThrow :
									function() {
										try {
											mightThrow();
										} catch ( e ) {

											if ( jQuery.Deferred.exceptionHook ) {
												jQuery.Deferred.exceptionHook( e,
													process.stackTrace );
											}

											// Support: Promises/A+ section 2.3.3.3.4.1
											// https://promisesaplus.com/#point-61
											// Ignore post-resolution exceptions
											if ( depth + 1 >= maxDepth ) {

												// Only substitute handlers pass on context
												// and multiple values (non-spec behavior)
												if ( handler !== Thrower ) {
													that = undefined;
													args = [ e ];
												}

												deferred.rejectWith( that, args );
											}
										}
									};

							// Support: Promises/A+ section 2.3.3.3.1
							// https://promisesaplus.com/#point-57
							// Re-resolve promises immediately to dodge false rejection from
							// subsequent errors
							if ( depth ) {
								process();
							} else {

								// Call an optional hook to record the stack, in case of exception
								// since it's otherwise lost when execution goes async
								if ( jQuery.Deferred.getStackHook ) {
									process.stackTrace = jQuery.Deferred.getStackHook();
								}
								window.setTimeout( process );
							}
						};
					}

					return jQuery.Deferred( function( newDefer ) {

						// progress_handlers.add( ... )
						tuples[ 0 ][ 3 ].add(
							resolve(
								0,
								newDefer,
								isFunction( onProgress ) ?
									onProgress :
									Identity,
								newDefer.notifyWith
							)
						);

						// fulfilled_handlers.add( ... )
						tuples[ 1 ][ 3 ].add(
							resolve(
								0,
								newDefer,
								isFunction( onFulfilled ) ?
									onFulfilled :
									Identity
							)
						);

						// rejected_handlers.add( ... )
						tuples[ 2 ][ 3 ].add(
							resolve(
								0,
								newDefer,
								isFunction( onRejected ) ?
									onRejected :
									Thrower
							)
						);
					} ).promise();
				},

				// Get a promise for this deferred
				// If obj is provided, the promise aspect is added to the object
				promise: function( obj ) {
					return obj != null ? jQuery.extend( obj, promise ) : promise;
				}
			},
			deferred = {};

		// Add list-specific methods
		jQuery.each( tuples, function( i, tuple ) {
			var list = tuple[ 2 ],
				stateString = tuple[ 5 ];

			// promise.progress = list.add
			// promise.done = list.add
			// promise.fail = list.add
			promise[ tuple[ 1 ] ] = list.add;

			// Handle state
			if ( stateString ) {
				list.add(
					function() {

						// state = "resolved" (i.e., fulfilled)
						// state = "rejected"
						state = stateString;
					},

					// rejected_callbacks.disable
					// fulfilled_callbacks.disable
					tuples[ 3 - i ][ 2 ].disable,

					// rejected_handlers.disable
					// fulfilled_handlers.disable
					tuples[ 3 - i ][ 3 ].disable,

					// progress_callbacks.lock
					tuples[ 0 ][ 2 ].lock,

					// progress_handlers.lock
					tuples[ 0 ][ 3 ].lock
				);
			}

			// progress_handlers.fire
			// fulfilled_handlers.fire
			// rejected_handlers.fire
			list.add( tuple[ 3 ].fire );

			// deferred.notify = function() { deferred.notifyWith(...) }
			// deferred.resolve = function() { deferred.resolveWith(...) }
			// deferred.reject = function() { deferred.rejectWith(...) }
			deferred[ tuple[ 0 ] ] = function() {
				deferred[ tuple[ 0 ] + "With" ]( this === deferred ? undefined : this, arguments );
				return this;
			};

			// deferred.notifyWith = list.fireWith
			// deferred.resolveWith = list.fireWith
			// deferred.rejectWith = list.fireWith
			deferred[ tuple[ 0 ] + "With" ] = list.fireWith;
		} );

		// Make the deferred a promise
		promise.promise( deferred );

		// Call given func if any
		if ( func ) {
			func.call( deferred, deferred );
		}

		// All done!
		return deferred;
	},

	// Deferred helper
	when: function( singleValue ) {
		var

			// count of uncompleted subordinates
			remaining = arguments.length,

			// count of unprocessed arguments
			i = remaining,

			// subordinate fulfillment data
			resolveContexts = Array( i ),
			resolveValues = slice.call( arguments ),

			// the master Deferred
			master = jQuery.Deferred(),

			// subordinate callback factory
			updateFunc = function( i ) {
				return function( value ) {
					resolveContexts[ i ] = this;
					resolveValues[ i ] = arguments.length > 1 ? slice.call( arguments ) : value;
					if ( !( --remaining ) ) {
						master.resolveWith( resolveContexts, resolveValues );
					}
				};
			};

		// Single- and empty arguments are adopted like Promise.resolve
		if ( remaining <= 1 ) {
			adoptValue( singleValue, master.done( updateFunc( i ) ).resolve, master.reject,
				!remaining );

			// Use .then() to unwrap secondary thenables (cf. gh-3000)
			if ( master.state() === "pending" ||
				isFunction( resolveValues[ i ] && resolveValues[ i ].then ) ) {

				return master.then();
			}
		}

		// Multiple arguments are aggregated like Promise.all array elements
		while ( i-- ) {
			adoptValue( resolveValues[ i ], updateFunc( i ), master.reject );
		}

		return master.promise();
	}
} );


// These usually indicate a programmer mistake during development,
// warn about them ASAP rather than swallowing them by default.
var rerrorNames = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;

jQuery.Deferred.exceptionHook = function( error, stack ) {

	// Support: IE 8 - 9 only
	// Console exists when dev tools are open, which can happen at any time
	if ( window.console && window.console.warn && error && rerrorNames.test( error.name ) ) {
		window.console.warn( "jQuery.Deferred exception: " + error.message, error.stack, stack );
	}
};




jQuery.readyException = function( error ) {
	window.setTimeout( function() {
		throw error;
	} );
};




// The deferred used on DOM ready
var readyList = jQuery.Deferred();

jQuery.fn.ready = function( fn ) {

	readyList
		.then( fn )

		// Wrap jQuery.readyException in a function so that the lookup
		// happens at the time of error handling instead of callback
		// registration.
		.catch( function( error ) {
			jQuery.readyException( error );
		} );

	return this;
};

jQuery.extend( {

	// Is the DOM ready to be used? Set to true once it occurs.
	isReady: false,

	// A counter to track how many items to wait for before
	// the ready event fires. See #6781
	readyWait: 1,

	// Handle when the DOM is ready
	ready: function( wait ) {

		// Abort if there are pending holds or we're already ready
		if ( wait === true ? --jQuery.readyWait : jQuery.isReady ) {
			return;
		}

		// Remember that the DOM is ready
		jQuery.isReady = true;

		// If a normal DOM Ready event fired, decrement, and wait if need be
		if ( wait !== true && --jQuery.readyWait > 0 ) {
			return;
		}

		// If there are functions bound, to execute
		readyList.resolveWith( document, [ jQuery ] );
	}
} );

jQuery.ready.then = readyList.then;

// The ready event handler and self cleanup method
function completed() {
	document.removeEventListener( "DOMContentLoaded", completed );
	window.removeEventListener( "load", completed );
	jQuery.ready();
}

// Catch cases where $(document).ready() is called
// after the browser event has already occurred.
// Support: IE <=9 - 10 only
// Older IE sometimes signals "interactive" too soon
if ( document.readyState === "complete" ||
	( document.readyState !== "loading" && !document.documentElement.doScroll ) ) {

	// Handle it asynchronously to allow scripts the opportunity to delay ready
	window.setTimeout( jQuery.ready );

} else {

	// Use the handy event callback
	document.addEventListener( "DOMContentLoaded", completed );

	// A fallback to window.onload, that will always work
	window.addEventListener( "load", completed );
}




// Multifunctional method to get and set values of a collection
// The value/s can optionally be executed if it's a function
var access = function( elems, fn, key, value, chainable, emptyGet, raw ) {
	var i = 0,
		len = elems.length,
		bulk = key == null;

	// Sets many values
	if ( toType( key ) === "object" ) {
		chainable = true;
		for ( i in key ) {
			access( elems, fn, i, key[ i ], true, emptyGet, raw );
		}

	// Sets one value
	} else if ( value !== undefined ) {
		chainable = true;

		if ( !isFunction( value ) ) {
			raw = true;
		}

		if ( bulk ) {

			// Bulk operations run against the entire set
			if ( raw ) {
				fn.call( elems, value );
				fn = null;

			// ...except when executing function values
			} else {
				bulk = fn;
				fn = function( elem, _key, value ) {
					return bulk.call( jQuery( elem ), value );
				};
			}
		}

		if ( fn ) {
			for ( ; i < len; i++ ) {
				fn(
					elems[ i ], key, raw ?
					value :
					value.call( elems[ i ], i, fn( elems[ i ], key ) )
				);
			}
		}
	}

	if ( chainable ) {
		return elems;
	}

	// Gets
	if ( bulk ) {
		return fn.call( elems );
	}

	return len ? fn( elems[ 0 ], key ) : emptyGet;
};


// Matches dashed string for camelizing
var rmsPrefix = /^-ms-/,
	rdashAlpha = /-([a-z])/g;

// Used by camelCase as callback to replace()
function fcamelCase( _all, letter ) {
	return letter.toUpperCase();
}

// Convert dashed to camelCase; used by the css and data modules
// Support: IE <=9 - 11, Edge 12 - 15
// Microsoft forgot to hump their vendor prefix (#9572)
function camelCase( string ) {
	return string.replace( rmsPrefix, "ms-" ).replace( rdashAlpha, fcamelCase );
}
var acceptData = function( owner ) {

	// Accepts only:
	//  - Node
	//    - Node.ELEMENT_NODE
	//    - Node.DOCUMENT_NODE
	//  - Object
	//    - Any
	return owner.nodeType === 1 || owner.nodeType === 9 || !( +owner.nodeType );
};




function Data() {
	this.expando = jQuery.expando + Data.uid++;
}

Data.uid = 1;

Data.prototype = {

	cache: function( owner ) {

		// Check if the owner object already has a cache
		var value = owner[ this.expando ];

		// If not, create one
		if ( !value ) {
			value = {};

			// We can accept data for non-element nodes in modern browsers,
			// but we should not, see #8335.
			// Always return an empty object.
			if ( acceptData( owner ) ) {

				// If it is a node unlikely to be stringify-ed or looped over
				// use plain assignment
				if ( owner.nodeType ) {
					owner[ this.expando ] = value;

				// Otherwise secure it in a non-enumerable property
				// configurable must be true to allow the property to be
				// deleted when data is removed
				} else {
					Object.defineProperty( owner, this.expando, {
						value: value,
						configurable: true
					} );
				}
			}
		}

		return value;
	},
	set: function( owner, data, value ) {
		var prop,
			cache = this.cache( owner );

		// Handle: [ owner, key, value ] args
		// Always use camelCase key (gh-2257)
		if ( typeof data === "string" ) {
			cache[ camelCase( data ) ] = value;

		// Handle: [ owner, { properties } ] args
		} else {

			// Copy the properties one-by-one to the cache object
			for ( prop in data ) {
				cache[ camelCase( prop ) ] = data[ prop ];
			}
		}
		return cache;
	},
	get: function( owner, key ) {
		return key === undefined ?
			this.cache( owner ) :

			// Always use camelCase key (gh-2257)
			owner[ this.expando ] && owner[ this.expando ][ camelCase( key ) ];
	},
	access: function( owner, key, value ) {

		// In cases where either:
		//
		//   1. No key was specified
		//   2. A string key was specified, but no value provided
		//
		// Take the "read" path and allow the get method to determine
		// which value to return, respectively either:
		//
		//   1. The entire cache object
		//   2. The data stored at the key
		//
		if ( key === undefined ||
				( ( key && typeof key === "string" ) && value === undefined ) ) {

			return this.get( owner, key );
		}

		// When the key is not a string, or both a key and value
		// are specified, set or extend (existing objects) with either:
		//
		//   1. An object of properties
		//   2. A key and value
		//
		this.set( owner, key, value );

		// Since the "set" path can have two possible entry points
		// return the expected data based on which path was taken[*]
		return value !== undefined ? value : key;
	},
	remove: function( owner, key ) {
		var i,
			cache = owner[ this.expando ];

		if ( cache === undefined ) {
			return;
		}

		if ( key !== undefined ) {

			// Support array or space separated string of keys
			if ( Array.isArray( key ) ) {

				// If key is an array of keys...
				// We always set camelCase keys, so remove that.
				key = key.map( camelCase );
			} else {
				key = camelCase( key );

				// If a key with the spaces exists, use it.
				// Otherwise, create an array by matching non-whitespace
				key = key in cache ?
					[ key ] :
					( key.match( rnothtmlwhite ) || [] );
			}

			i = key.length;

			while ( i-- ) {
				delete cache[ key[ i ] ];
			}
		}

		// Remove the expando if there's no more data
		if ( key === undefined || jQuery.isEmptyObject( cache ) ) {

			// Support: Chrome <=35 - 45
			// Webkit & Blink performance suffers when deleting properties
			// from DOM nodes, so set to undefined instead
			// https://bugs.chromium.org/p/chromium/issues/detail?id=378607 (bug restricted)
			if ( owner.nodeType ) {
				owner[ this.expando ] = undefined;
			} else {
				delete owner[ this.expando ];
			}
		}
	},
	hasData: function( owner ) {
		var cache = owner[ this.expando ];
		return cache !== undefined && !jQuery.isEmptyObject( cache );
	}
};
var dataPriv = new Data();

var dataUser = new Data();



//	Implementation Summary
//
//	1. Enforce API surface and semantic compatibility with 1.9.x branch
//	2. Improve the module's maintainability by reducing the storage
//		paths to a single mechanism.
//	3. Use the same single mechanism to support "private" and "user" data.
//	4. _Never_ expose "private" data to user code (TODO: Drop _data, _removeData)
//	5. Avoid exposing implementation details on user objects (eg. expando properties)
//	6. Provide a clear path for implementation upgrade to WeakMap in 2014

var rbrace = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
	rmultiDash = /[A-Z]/g;

function getData( data ) {
	if ( data === "true" ) {
		return true;
	}

	if ( data === "false" ) {
		return false;
	}

	if ( data === "null" ) {
		return null;
	}

	// Only convert to a number if it doesn't change the string
	if ( data === +data + "" ) {
		return +data;
	}

	if ( rbrace.test( data ) ) {
		return JSON.parse( data );
	}

	return data;
}

function dataAttr( elem, key, data ) {
	var name;

	// If nothing was found internally, try to fetch any
	// data from the HTML5 data-* attribute
	if ( data === undefined && elem.nodeType === 1 ) {
		name = "data-" + key.replace( rmultiDash, "-$&" ).toLowerCase();
		data = elem.getAttribute( name );

		if ( typeof data === "string" ) {
			try {
				data = getData( data );
			} catch ( e ) {}

			// Make sure we set the data so it isn't changed later
			dataUser.set( elem, key, data );
		} else {
			data = undefined;
		}
	}
	return data;
}

jQuery.extend( {
	hasData: function( elem ) {
		return dataUser.hasData( elem ) || dataPriv.hasData( elem );
	},

	data: function( elem, name, data ) {
		return dataUser.access( elem, name, data );
	},

	removeData: function( elem, name ) {
		dataUser.remove( elem, name );
	},

	// TODO: Now that all calls to _data and _removeData have been replaced
	// with direct calls to dataPriv methods, these can be deprecated.
	_data: function( elem, name, data ) {
		return dataPriv.access( elem, name, data );
	},

	_removeData: function( elem, name ) {
		dataPriv.remove( elem, name );
	}
} );

jQuery.fn.extend( {
	data: function( key, value ) {
		var i, name, data,
			elem = this[ 0 ],
			attrs = elem && elem.attributes;

		// Gets all values
		if ( key === undefined ) {
			if ( this.length ) {
				data = dataUser.get( elem );

				if ( elem.nodeType === 1 && !dataPriv.get( elem, "hasDataAttrs" ) ) {
					i = attrs.length;
					while ( i-- ) {

						// Support: IE 11 only
						// The attrs elements can be null (#14894)
						if ( attrs[ i ] ) {
							name = attrs[ i ].name;
							if ( name.indexOf( "data-" ) === 0 ) {
								name = camelCase( name.slice( 5 ) );
								dataAttr( elem, name, data[ name ] );
							}
						}
					}
					dataPriv.set( elem, "hasDataAttrs", true );
				}
			}

			return data;
		}

		// Sets multiple values
		if ( typeof key === "object" ) {
			return this.each( function() {
				dataUser.set( this, key );
			} );
		}

		return access( this, function( value ) {
			var data;

			// The calling jQuery object (element matches) is not empty
			// (and therefore has an element appears at this[ 0 ]) and the
			// `value` parameter was not undefined. An empty jQuery object
			// will result in `undefined` for elem = this[ 0 ] which will
			// throw an exception if an attempt to read a data cache is made.
			if ( elem && value === undefined ) {

				// Attempt to get data from the cache
				// The key will always be camelCased in Data
				data = dataUser.get( elem, key );
				if ( data !== undefined ) {
					return data;
				}

				// Attempt to "discover" the data in
				// HTML5 custom data-* attrs
				data = dataAttr( elem, key );
				if ( data !== undefined ) {
					return data;
				}

				// We tried really hard, but the data doesn't exist.
				return;
			}

			// Set the data...
			this.each( function() {

				// We always store the camelCased key
				dataUser.set( this, key, value );
			} );
		}, null, value, arguments.length > 1, null, true );
	},

	removeData: function( key ) {
		return this.each( function() {
			dataUser.remove( this, key );
		} );
	}
} );


jQuery.extend( {
	queue: function( elem, type, data ) {
		var queue;

		if ( elem ) {
			type = ( type || "fx" ) + "queue";
			queue = dataPriv.get( elem, type );

			// Speed up dequeue by getting out quickly if this is just a lookup
			if ( data ) {
				if ( !queue || Array.isArray( data ) ) {
					queue = dataPriv.access( elem, type, jQuery.makeArray( data ) );
				} else {
					queue.push( data );
				}
			}
			return queue || [];
		}
	},

	dequeue: function( elem, type ) {
		type = type || "fx";

		var queue = jQuery.queue( elem, type ),
			startLength = queue.length,
			fn = queue.shift(),
			hooks = jQuery._queueHooks( elem, type ),
			next = function() {
				jQuery.dequeue( elem, type );
			};

		// If the fx queue is dequeued, always remove the progress sentinel
		if ( fn === "inprogress" ) {
			fn = queue.shift();
			startLength--;
		}

		if ( fn ) {

			// Add a progress sentinel to prevent the fx queue from being
			// automatically dequeued
			if ( type === "fx" ) {
				queue.unshift( "inprogress" );
			}

			// Clear up the last queue stop function
			delete hooks.stop;
			fn.call( elem, next, hooks );
		}

		if ( !startLength && hooks ) {
			hooks.empty.fire();
		}
	},

	// Not public - generate a queueHooks object, or return the current one
	_queueHooks: function( elem, type ) {
		var key = type + "queueHooks";
		return dataPriv.get( elem, key ) || dataPriv.access( elem, key, {
			empty: jQuery.Callbacks( "once memory" ).add( function() {
				dataPriv.remove( elem, [ type + "queue", key ] );
			} )
		} );
	}
} );

jQuery.fn.extend( {
	queue: function( type, data ) {
		var setter = 2;

		if ( typeof type !== "string" ) {
			data = type;
			type = "fx";
			setter--;
		}

		if ( arguments.length < setter ) {
			return jQuery.queue( this[ 0 ], type );
		}

		return data === undefined ?
			this :
			this.each( function() {
				var queue = jQuery.queue( this, type, data );

				// Ensure a hooks for this queue
				jQuery._queueHooks( this, type );

				if ( type === "fx" && queue[ 0 ] !== "inprogress" ) {
					jQuery.dequeue( this, type );
				}
			} );
	},
	dequeue: function( type ) {
		return this.each( function() {
			jQuery.dequeue( this, type );
		} );
	},
	clearQueue: function( type ) {
		return this.queue( type || "fx", [] );
	},

	// Get a promise resolved when queues of a certain type
	// are emptied (fx is the type by default)
	promise: function( type, obj ) {
		var tmp,
			count = 1,
			defer = jQuery.Deferred(),
			elements = this,
			i = this.length,
			resolve = function() {
				if ( !( --count ) ) {
					defer.resolveWith( elements, [ elements ] );
				}
			};

		if ( typeof type !== "string" ) {
			obj = type;
			type = undefined;
		}
		type = type || "fx";

		while ( i-- ) {
			tmp = dataPriv.get( elements[ i ], type + "queueHooks" );
			if ( tmp && tmp.empty ) {
				count++;
				tmp.empty.add( resolve );
			}
		}
		resolve();
		return defer.promise( obj );
	}
} );
var pnum = ( /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/ ).source;

var rcssNum = new RegExp( "^(?:([+-])=|)(" + pnum + ")([a-z%]*)$", "i" );


var cssExpand = [ "Top", "Right", "Bottom", "Left" ];

var documentElement = document.documentElement;



	var isAttached = function( elem ) {
			return jQuery.contains( elem.ownerDocument, elem );
		},
		composed = { composed: true };

	// Support: IE 9 - 11+, Edge 12 - 18+, iOS 10.0 - 10.2 only
	// Check attachment across shadow DOM boundaries when possible (gh-3504)
	// Support: iOS 10.0-10.2 only
	// Early iOS 10 versions support `attachShadow` but not `getRootNode`,
	// leading to errors. We need to check for `getRootNode`.
	if ( documentElement.getRootNode ) {
		isAttached = function( elem ) {
			return jQuery.contains( elem.ownerDocument, elem ) ||
				elem.getRootNode( composed ) === elem.ownerDocument;
		};
	}
var isHiddenWithinTree = function( elem, el ) {

		// isHiddenWithinTree might be called from jQuery#filter function;
		// in that case, element will be second argument
		elem = el || elem;

		// Inline style trumps all
		return elem.style.display === "none" ||
			elem.style.display === "" &&

			// Otherwise, check computed style
			// Support: Firefox <=43 - 45
			// Disconnected elements can have computed display: none, so first confirm that elem is
			// in the document.
			isAttached( elem ) &&

			jQuery.css( elem, "display" ) === "none";
	};



function adjustCSS( elem, prop, valueParts, tween ) {
	var adjusted, scale,
		maxIterations = 20,
		currentValue = tween ?
			function() {
				return tween.cur();
			} :
			function() {
				return jQuery.css( elem, prop, "" );
			},
		initial = currentValue(),
		unit = valueParts && valueParts[ 3 ] || ( jQuery.cssNumber[ prop ] ? "" : "px" ),

		// Starting value computation is required for potential unit mismatches
		initialInUnit = elem.nodeType &&
			( jQuery.cssNumber[ prop ] || unit !== "px" && +initial ) &&
			rcssNum.exec( jQuery.css( elem, prop ) );

	if ( initialInUnit && initialInUnit[ 3 ] !== unit ) {

		// Support: Firefox <=54
		// Halve the iteration target value to prevent interference from CSS upper bounds (gh-2144)
		initial = initial / 2;

		// Trust units reported by jQuery.css
		unit = unit || initialInUnit[ 3 ];

		// Iteratively approximate from a nonzero starting point
		initialInUnit = +initial || 1;

		while ( maxIterations-- ) {

			// Evaluate and update our best guess (doubling guesses that zero out).
			// Finish if the scale equals or crosses 1 (making the old*new product non-positive).
			jQuery.style( elem, prop, initialInUnit + unit );
			if ( ( 1 - scale ) * ( 1 - ( scale = currentValue() / initial || 0.5 ) ) <= 0 ) {
				maxIterations = 0;
			}
			initialInUnit = initialInUnit / scale;

		}

		initialInUnit = initialInUnit * 2;
		jQuery.style( elem, prop, initialInUnit + unit );

		// Make sure we update the tween properties later on
		valueParts = valueParts || [];
	}

	if ( valueParts ) {
		initialInUnit = +initialInUnit || +initial || 0;

		// Apply relative offset (+=/-=) if specified
		adjusted = valueParts[ 1 ] ?
			initialInUnit + ( valueParts[ 1 ] + 1 ) * valueParts[ 2 ] :
			+valueParts[ 2 ];
		if ( tween ) {
			tween.unit = unit;
			tween.start = initialInUnit;
			tween.end = adjusted;
		}
	}
	return adjusted;
}


var defaultDisplayMap = {};

function getDefaultDisplay( elem ) {
	var temp,
		doc = elem.ownerDocument,
		nodeName = elem.nodeName,
		display = defaultDisplayMap[ nodeName ];

	if ( display ) {
		return display;
	}

	temp = doc.body.appendChild( doc.createElement( nodeName ) );
	display = jQuery.css( temp, "display" );

	temp.parentNode.removeChild( temp );

	if ( display === "none" ) {
		display = "block";
	}
	defaultDisplayMap[ nodeName ] = display;

	return display;
}

function showHide( elements, show ) {
	var display, elem,
		values = [],
		index = 0,
		length = elements.length;

	// Determine new display value for elements that need to change
	for ( ; index < length; index++ ) {
		elem = elements[ index ];
		if ( !elem.style ) {
			continue;
		}

		display = elem.style.display;
		if ( show ) {

			// Since we force visibility upon cascade-hidden elements, an immediate (and slow)
			// check is required in this first loop unless we have a nonempty display value (either
			// inline or about-to-be-restored)
			if ( display === "none" ) {
				values[ index ] = dataPriv.get( elem, "display" ) || null;
				if ( !values[ index ] ) {
					elem.style.display = "";
				}
			}
			if ( elem.style.display === "" && isHiddenWithinTree( elem ) ) {
				values[ index ] = getDefaultDisplay( elem );
			}
		} else {
			if ( display !== "none" ) {
				values[ index ] = "none";

				// Remember what we're overwriting
				dataPriv.set( elem, "display", display );
			}
		}
	}

	// Set the display of the elements in a second loop to avoid constant reflow
	for ( index = 0; index < length; index++ ) {
		if ( values[ index ] != null ) {
			elements[ index ].style.display = values[ index ];
		}
	}

	return elements;
}

jQuery.fn.extend( {
	show: function() {
		return showHide( this, true );
	},
	hide: function() {
		return showHide( this );
	},
	toggle: function( state ) {
		if ( typeof state === "boolean" ) {
			return state ? this.show() : this.hide();
		}

		return this.each( function() {
			if ( isHiddenWithinTree( this ) ) {
				jQuery( this ).show();
			} else {
				jQuery( this ).hide();
			}
		} );
	}
} );
var rcheckableType = ( /^(?:checkbox|radio)$/i );

var rtagName = ( /<([a-z][^\/\0>\x20\t\r\n\f]*)/i );

var rscriptType = ( /^$|^module$|\/(?:java|ecma)script/i );



( function() {
	var fragment = document.createDocumentFragment(),
		div = fragment.appendChild( document.createElement( "div" ) ),
		input = document.createElement( "input" );

	// Support: Android 4.0 - 4.3 only
	// Check state lost if the name is set (#11217)
	// Support: Windows Web Apps (WWA)
	// `name` and `type` must use .setAttribute for WWA (#14901)
	input.setAttribute( "type", "radio" );
	input.setAttribute( "checked", "checked" );
	input.setAttribute( "name", "t" );

	div.appendChild( input );

	// Support: Android <=4.1 only
	// Older WebKit doesn't clone checked state correctly in fragments
	support.checkClone = div.cloneNode( true ).cloneNode( true ).lastChild.checked;

	// Support: IE <=11 only
	// Make sure textarea (and checkbox) defaultValue is properly cloned
	div.innerHTML = "<textarea>x</textarea>";
	support.noCloneChecked = !!div.cloneNode( true ).lastChild.defaultValue;

	// Support: IE <=9 only
	// IE <=9 replaces <option> tags with their contents when inserted outside of
	// the select element.
	div.innerHTML = "<option></option>";
	support.option = !!div.lastChild;
} )();


// We have to close these tags to support XHTML (#13200)
var wrapMap = {

	// XHTML parsers do not magically insert elements in the
	// same way that tag soup parsers do. So we cannot shorten
	// this by omitting <tbody> or other required elements.
	thead: [ 1, "<table>", "</table>" ],
	col: [ 2, "<table><colgroup>", "</colgroup></table>" ],
	tr: [ 2, "<table><tbody>", "</tbody></table>" ],
	td: [ 3, "<table><tbody><tr>", "</tr></tbody></table>" ],

	_default: [ 0, "", "" ]
};

wrapMap.tbody = wrapMap.tfoot = wrapMap.colgroup = wrapMap.caption = wrapMap.thead;
wrapMap.th = wrapMap.td;

// Support: IE <=9 only
if ( !support.option ) {
	wrapMap.optgroup = wrapMap.option = [ 1, "<select multiple='multiple'>", "</select>" ];
}


function getAll( context, tag ) {

	// Support: IE <=9 - 11 only
	// Use typeof to avoid zero-argument method invocation on host objects (#15151)
	var ret;

	if ( typeof context.getElementsByTagName !== "undefined" ) {
		ret = context.getElementsByTagName( tag || "*" );

	} else if ( typeof context.querySelectorAll !== "undefined" ) {
		ret = context.querySelectorAll( tag || "*" );

	} else {
		ret = [];
	}

	if ( tag === undefined || tag && nodeName( context, tag ) ) {
		return jQuery.merge( [ context ], ret );
	}

	return ret;
}


// Mark scripts as having already been evaluated
function setGlobalEval( elems, refElements ) {
	var i = 0,
		l = elems.length;

	for ( ; i < l; i++ ) {
		dataPriv.set(
			elems[ i ],
			"globalEval",
			!refElements || dataPriv.get( refElements[ i ], "globalEval" )
		);
	}
}


var rhtml = /<|&#?\w+;/;

function buildFragment( elems, context, scripts, selection, ignored ) {
	var elem, tmp, tag, wrap, attached, j,
		fragment = context.createDocumentFragment(),
		nodes = [],
		i = 0,
		l = elems.length;

	for ( ; i < l; i++ ) {
		elem = elems[ i ];

		if ( elem || elem === 0 ) {

			// Add nodes directly
			if ( toType( elem ) === "object" ) {

				// Support: Android <=4.0 only, PhantomJS 1 only
				// push.apply(_, arraylike) throws on ancient WebKit
				jQuery.merge( nodes, elem.nodeType ? [ elem ] : elem );

			// Convert non-html into a text node
			} else if ( !rhtml.test( elem ) ) {
				nodes.push( context.createTextNode( elem ) );

			// Convert html into DOM nodes
			} else {
				tmp = tmp || fragment.appendChild( context.createElement( "div" ) );

				// Deserialize a standard representation
				tag = ( rtagName.exec( elem ) || [ "", "" ] )[ 1 ].toLowerCase();
				wrap = wrapMap[ tag ] || wrapMap._default;
				tmp.innerHTML = wrap[ 1 ] + jQuery.htmlPrefilter( elem ) + wrap[ 2 ];

				// Descend through wrappers to the right content
				j = wrap[ 0 ];
				while ( j-- ) {
					tmp = tmp.lastChild;
				}

				// Support: Android <=4.0 only, PhantomJS 1 only
				// push.apply(_, arraylike) throws on ancient WebKit
				jQuery.merge( nodes, tmp.childNodes );

				// Remember the top-level container
				tmp = fragment.firstChild;

				// Ensure the created nodes are orphaned (#12392)
				tmp.textContent = "";
			}
		}
	}

	// Remove wrapper from fragment
	fragment.textContent = "";

	i = 0;
	while ( ( elem = nodes[ i++ ] ) ) {

		// Skip elements already in the context collection (trac-4087)
		if ( selection && jQuery.inArray( elem, selection ) > -1 ) {
			if ( ignored ) {
				ignored.push( elem );
			}
			continue;
		}

		attached = isAttached( elem );

		// Append to fragment
		tmp = getAll( fragment.appendChild( elem ), "script" );

		// Preserve script evaluation history
		if ( attached ) {
			setGlobalEval( tmp );
		}

		// Capture executables
		if ( scripts ) {
			j = 0;
			while ( ( elem = tmp[ j++ ] ) ) {
				if ( rscriptType.test( elem.type || "" ) ) {
					scripts.push( elem );
				}
			}
		}
	}

	return fragment;
}


var
	rkeyEvent = /^key/,
	rmouseEvent = /^(?:mouse|pointer|contextmenu|drag|drop)|click/,
	rtypenamespace = /^([^.]*)(?:\.(.+)|)/;

function returnTrue() {
	return true;
}

function returnFalse() {
	return false;
}

// Support: IE <=9 - 11+
// focus() and blur() are asynchronous, except when they are no-op.
// So expect focus to be synchronous when the element is already active,
// and blur to be synchronous when the element is not already active.
// (focus and blur are always synchronous in other supported browsers,
// this just defines when we can count on it).
function expectSync( elem, type ) {
	return ( elem === safeActiveElement() ) === ( type === "focus" );
}

// Support: IE <=9 only
// Accessing document.activeElement can throw unexpectedly
// https://bugs.jquery.com/ticket/13393
function safeActiveElement() {
	try {
		return document.activeElement;
	} catch ( err ) { }
}

function on( elem, types, selector, data, fn, one ) {
	var origFn, type;

	// Types can be a map of types/handlers
	if ( typeof types === "object" ) {

		// ( types-Object, selector, data )
		if ( typeof selector !== "string" ) {

			// ( types-Object, data )
			data = data || selector;
			selector = undefined;
		}
		for ( type in types ) {
			on( elem, type, selector, data, types[ type ], one );
		}
		return elem;
	}

	if ( data == null && fn == null ) {

		// ( types, fn )
		fn = selector;
		data = selector = undefined;
	} else if ( fn == null ) {
		if ( typeof selector === "string" ) {

			// ( types, selector, fn )
			fn = data;
			data = undefined;
		} else {

			// ( types, data, fn )
			fn = data;
			data = selector;
			selector = undefined;
		}
	}
	if ( fn === false ) {
		fn = returnFalse;
	} else if ( !fn ) {
		return elem;
	}

	if ( one === 1 ) {
		origFn = fn;
		fn = function( event ) {

			// Can use an empty set, since event contains the info
			jQuery().off( event );
			return origFn.apply( this, arguments );
		};

		// Use same guid so caller can remove using origFn
		fn.guid = origFn.guid || ( origFn.guid = jQuery.guid++ );
	}
	return elem.each( function() {
		jQuery.event.add( this, types, fn, data, selector );
	} );
}

/*
 * Helper functions for managing events -- not part of the public interface.
 * Props to Dean Edwards' addEvent library for many of the ideas.
 */
jQuery.event = {

	global: {},

	add: function( elem, types, handler, data, selector ) {

		var handleObjIn, eventHandle, tmp,
			events, t, handleObj,
			special, handlers, type, namespaces, origType,
			elemData = dataPriv.get( elem );

		// Only attach events to objects that accept data
		if ( !acceptData( elem ) ) {
			return;
		}

		// Caller can pass in an object of custom data in lieu of the handler
		if ( handler.handler ) {
			handleObjIn = handler;
			handler = handleObjIn.handler;
			selector = handleObjIn.selector;
		}

		// Ensure that invalid selectors throw exceptions at attach time
		// Evaluate against documentElement in case elem is a non-element node (e.g., document)
		if ( selector ) {
			jQuery.find.matchesSelector( documentElement, selector );
		}

		// Make sure that the handler has a unique ID, used to find/remove it later
		if ( !handler.guid ) {
			handler.guid = jQuery.guid++;
		}

		// Init the element's event structure and main handler, if this is the first
		if ( !( events = elemData.events ) ) {
			events = elemData.events = Object.create( null );
		}
		if ( !( eventHandle = elemData.handle ) ) {
			eventHandle = elemData.handle = function( e ) {

				// Discard the second event of a jQuery.event.trigger() and
				// when an event is called after a page has unloaded
				return typeof jQuery !== "undefined" && jQuery.event.triggered !== e.type ?
					jQuery.event.dispatch.apply( elem, arguments ) : undefined;
			};
		}

		// Handle multiple events separated by a space
		types = ( types || "" ).match( rnothtmlwhite ) || [ "" ];
		t = types.length;
		while ( t-- ) {
			tmp = rtypenamespace.exec( types[ t ] ) || [];
			type = origType = tmp[ 1 ];
			namespaces = ( tmp[ 2 ] || "" ).split( "." ).sort();

			// There *must* be a type, no attaching namespace-only handlers
			if ( !type ) {
				continue;
			}

			// If event changes its type, use the special event handlers for the changed type
			special = jQuery.event.special[ type ] || {};

			// If selector defined, determine special event api type, otherwise given type
			type = ( selector ? special.delegateType : special.bindType ) || type;

			// Update special based on newly reset type
			special = jQuery.event.special[ type ] || {};

			// handleObj is passed to all event handlers
			handleObj = jQuery.extend( {
				type: type,
				origType: origType,
				data: data,
				handler: handler,
				guid: handler.guid,
				selector: selector,
				needsContext: selector && jQuery.expr.match.needsContext.test( selector ),
				namespace: namespaces.join( "." )
			}, handleObjIn );

			// Init the event handler queue if we're the first
			if ( !( handlers = events[ type ] ) ) {
				handlers = events[ type ] = [];
				handlers.delegateCount = 0;

				// Only use addEventListener if the special events handler returns false
				if ( !special.setup ||
					special.setup.call( elem, data, namespaces, eventHandle ) === false ) {

					if ( elem.addEventListener ) {
						elem.addEventListener( type, eventHandle );
					}
				}
			}

			if ( special.add ) {
				special.add.call( elem, handleObj );

				if ( !handleObj.handler.guid ) {
					handleObj.handler.guid = handler.guid;
				}
			}

			// Add to the element's handler list, delegates in front
			if ( selector ) {
				handlers.splice( handlers.delegateCount++, 0, handleObj );
			} else {
				handlers.push( handleObj );
			}

			// Keep track of which events have ever been used, for event optimization
			jQuery.event.global[ type ] = true;
		}

	},

	// Detach an event or set of events from an element
	remove: function( elem, types, handler, selector, mappedTypes ) {

		var j, origCount, tmp,
			events, t, handleObj,
			special, handlers, type, namespaces, origType,
			elemData = dataPriv.hasData( elem ) && dataPriv.get( elem );

		if ( !elemData || !( events = elemData.events ) ) {
			return;
		}

		// Once for each type.namespace in types; type may be omitted
		types = ( types || "" ).match( rnothtmlwhite ) || [ "" ];
		t = types.length;
		while ( t-- ) {
			tmp = rtypenamespace.exec( types[ t ] ) || [];
			type = origType = tmp[ 1 ];
			namespaces = ( tmp[ 2 ] || "" ).split( "." ).sort();

			// Unbind all events (on this namespace, if provided) for the element
			if ( !type ) {
				for ( type in events ) {
					jQuery.event.remove( elem, type + types[ t ], handler, selector, true );
				}
				continue;
			}

			special = jQuery.event.special[ type ] || {};
			type = ( selector ? special.delegateType : special.bindType ) || type;
			handlers = events[ type ] || [];
			tmp = tmp[ 2 ] &&
				new RegExp( "(^|\\.)" + namespaces.join( "\\.(?:.*\\.|)" ) + "(\\.|$)" );

			// Remove matching events
			origCount = j = handlers.length;
			while ( j-- ) {
				handleObj = handlers[ j ];

				if ( ( mappedTypes || origType === handleObj.origType ) &&
					( !handler || handler.guid === handleObj.guid ) &&
					( !tmp || tmp.test( handleObj.namespace ) ) &&
					( !selector || selector === handleObj.selector ||
						selector === "**" && handleObj.selector ) ) {
					handlers.splice( j, 1 );

					if ( handleObj.selector ) {
						handlers.delegateCount--;
					}
					if ( special.remove ) {
						special.remove.call( elem, handleObj );
					}
				}
			}

			// Remove generic event handler if we removed something and no more handlers exist
			// (avoids potential for endless recursion during removal of special event handlers)
			if ( origCount && !handlers.length ) {
				if ( !special.teardown ||
					special.teardown.call( elem, namespaces, elemData.handle ) === false ) {

					jQuery.removeEvent( elem, type, elemData.handle );
				}

				delete events[ type ];
			}
		}

		// Remove data and the expando if it's no longer used
		if ( jQuery.isEmptyObject( events ) ) {
			dataPriv.remove( elem, "handle events" );
		}
	},

	dispatch: function( nativeEvent ) {

		var i, j, ret, matched, handleObj, handlerQueue,
			args = new Array( arguments.length ),

			// Make a writable jQuery.Event from the native event object
			event = jQuery.event.fix( nativeEvent ),

			handlers = (
					dataPriv.get( this, "events" ) || Object.create( null )
				)[ event.type ] || [],
			special = jQuery.event.special[ event.type ] || {};

		// Use the fix-ed jQuery.Event rather than the (read-only) native event
		args[ 0 ] = event;

		for ( i = 1; i < arguments.length; i++ ) {
			args[ i ] = arguments[ i ];
		}

		event.delegateTarget = this;

		// Call the preDispatch hook for the mapped type, and let it bail if desired
		if ( special.preDispatch && special.preDispatch.call( this, event ) === false ) {
			return;
		}

		// Determine handlers
		handlerQueue = jQuery.event.handlers.call( this, event, handlers );

		// Run delegates first; they may want to stop propagation beneath us
		i = 0;
		while ( ( matched = handlerQueue[ i++ ] ) && !event.isPropagationStopped() ) {
			event.currentTarget = matched.elem;

			j = 0;
			while ( ( handleObj = matched.handlers[ j++ ] ) &&
				!event.isImmediatePropagationStopped() ) {

				// If the event is namespaced, then each handler is only invoked if it is
				// specially universal or its namespaces are a superset of the event's.
				if ( !event.rnamespace || handleObj.namespace === false ||
					event.rnamespace.test( handleObj.namespace ) ) {

					event.handleObj = handleObj;
					event.data = handleObj.data;

					ret = ( ( jQuery.event.special[ handleObj.origType ] || {} ).handle ||
						handleObj.handler ).apply( matched.elem, args );

					if ( ret !== undefined ) {
						if ( ( event.result = ret ) === false ) {
							event.preventDefault();
							event.stopPropagation();
						}
					}
				}
			}
		}

		// Call the postDispatch hook for the mapped type
		if ( special.postDispatch ) {
			special.postDispatch.call( this, event );
		}

		return event.result;
	},

	handlers: function( event, handlers ) {
		var i, handleObj, sel, matchedHandlers, matchedSelectors,
			handlerQueue = [],
			delegateCount = handlers.delegateCount,
			cur = event.target;

		// Find delegate handlers
		if ( delegateCount &&

			// Support: IE <=9
			// Black-hole SVG <use> instance trees (trac-13180)
			cur.nodeType &&

			// Support: Firefox <=42
			// Suppress spec-violating clicks indicating a non-primary pointer button (trac-3861)
			// https://www.w3.org/TR/DOM-Level-3-Events/#event-type-click
			// Support: IE 11 only
			// ...but not arrow key "clicks" of radio inputs, which can have `button` -1 (gh-2343)
			!( event.type === "click" && event.button >= 1 ) ) {

			for ( ; cur !== this; cur = cur.parentNode || this ) {

				// Don't check non-elements (#13208)
				// Don't process clicks on disabled elements (#6911, #8165, #11382, #11764)
				if ( cur.nodeType === 1 && !( event.type === "click" && cur.disabled === true ) ) {
					matchedHandlers = [];
					matchedSelectors = {};
					for ( i = 0; i < delegateCount; i++ ) {
						handleObj = handlers[ i ];

						// Don't conflict with Object.prototype properties (#13203)
						sel = handleObj.selector + " ";

						if ( matchedSelectors[ sel ] === undefined ) {
							matchedSelectors[ sel ] = handleObj.needsContext ?
								jQuery( sel, this ).index( cur ) > -1 :
								jQuery.find( sel, this, null, [ cur ] ).length;
						}
						if ( matchedSelectors[ sel ] ) {
							matchedHandlers.push( handleObj );
						}
					}
					if ( matchedHandlers.length ) {
						handlerQueue.push( { elem: cur, handlers: matchedHandlers } );
					}
				}
			}
		}

		// Add the remaining (directly-bound) handlers
		cur = this;
		if ( delegateCount < handlers.length ) {
			handlerQueue.push( { elem: cur, handlers: handlers.slice( delegateCount ) } );
		}

		return handlerQueue;
	},

	addProp: function( name, hook ) {
		Object.defineProperty( jQuery.Event.prototype, name, {
			enumerable: true,
			configurable: true,

			get: isFunction( hook ) ?
				function() {
					if ( this.originalEvent ) {
							return hook( this.originalEvent );
					}
				} :
				function() {
					if ( this.originalEvent ) {
							return this.originalEvent[ name ];
					}
				},

			set: function( value ) {
				Object.defineProperty( this, name, {
					enumerable: true,
					configurable: true,
					writable: true,
					value: value
				} );
			}
		} );
	},

	fix: function( originalEvent ) {
		return originalEvent[ jQuery.expando ] ?
			originalEvent :
			new jQuery.Event( originalEvent );
	},

	special: {
		load: {

			// Prevent triggered image.load events from bubbling to window.load
			noBubble: true
		},
		click: {

			// Utilize native event to ensure correct state for checkable inputs
			setup: function( data ) {

				// For mutual compressibility with _default, replace `this` access with a local var.
				// `|| data` is dead code meant only to preserve the variable through minification.
				var el = this || data;

				// Claim the first handler
				if ( rcheckableType.test( el.type ) &&
					el.click && nodeName( el, "input" ) ) {

					// dataPriv.set( el, "click", ... )
					leverageNative( el, "click", returnTrue );
				}

				// Return false to allow normal processing in the caller
				return false;
			},
			trigger: function( data ) {

				// For mutual compressibility with _default, replace `this` access with a local var.
				// `|| data` is dead code meant only to preserve the variable through minification.
				var el = this || data;

				// Force setup before triggering a click
				if ( rcheckableType.test( el.type ) &&
					el.click && nodeName( el, "input" ) ) {

					leverageNative( el, "click" );
				}

				// Return non-false to allow normal event-path propagation
				return true;
			},

			// For cross-browser consistency, suppress native .click() on links
			// Also prevent it if we're currently inside a leveraged native-event stack
			_default: function( event ) {
				var target = event.target;
				return rcheckableType.test( target.type ) &&
					target.click && nodeName( target, "input" ) &&
					dataPriv.get( target, "click" ) ||
					nodeName( target, "a" );
			}
		},

		beforeunload: {
			postDispatch: function( event ) {

				// Support: Firefox 20+
				// Firefox doesn't alert if the returnValue field is not set.
				if ( event.result !== undefined && event.originalEvent ) {
					event.originalEvent.returnValue = event.result;
				}
			}
		}
	}
};

// Ensure the presence of an event listener that handles manually-triggered
// synthetic events by interrupting progress until reinvoked in response to
// *native* events that it fires directly, ensuring that state changes have
// already occurred before other listeners are invoked.
function leverageNative( el, type, expectSync ) {

	// Missing expectSync indicates a trigger call, which must force setup through jQuery.event.add
	if ( !expectSync ) {
		if ( dataPriv.get( el, type ) === undefined ) {
			jQuery.event.add( el, type, returnTrue );
		}
		return;
	}

	// Register the controller as a special universal handler for all event namespaces
	dataPriv.set( el, type, false );
	jQuery.event.add( el, type, {
		namespace: false,
		handler: function( event ) {
			var notAsync, result,
				saved = dataPriv.get( this, type );

			if ( ( event.isTrigger & 1 ) && this[ type ] ) {

				// Interrupt processing of the outer synthetic .trigger()ed event
				// Saved data should be false in such cases, but might be a leftover capture object
				// from an async native handler (gh-4350)
				if ( !saved.length ) {

					// Store arguments for use when handling the inner native event
					// There will always be at least one argument (an event object), so this array
					// will not be confused with a leftover capture object.
					saved = slice.call( arguments );
					dataPriv.set( this, type, saved );

					// Trigger the native event and capture its result
					// Support: IE <=9 - 11+
					// focus() and blur() are asynchronous
					notAsync = expectSync( this, type );
					this[ type ]();
					result = dataPriv.get( this, type );
					if ( saved !== result || notAsync ) {
						dataPriv.set( this, type, false );
					} else {
						result = {};
					}
					if ( saved !== result ) {

						// Cancel the outer synthetic event
						event.stopImmediatePropagation();
						event.preventDefault();
						return result.value;
					}

				// If this is an inner synthetic event for an event with a bubbling surrogate
				// (focus or blur), assume that the surrogate already propagated from triggering the
				// native event and prevent that from happening again here.
				// This technically gets the ordering wrong w.r.t. to `.trigger()` (in which the
				// bubbling surrogate propagates *after* the non-bubbling base), but that seems
				// less bad than duplication.
				} else if ( ( jQuery.event.special[ type ] || {} ).delegateType ) {
					event.stopPropagation();
				}

			// If this is a native event triggered above, everything is now in order
			// Fire an inner synthetic event with the original arguments
			} else if ( saved.length ) {

				// ...and capture the result
				dataPriv.set( this, type, {
					value: jQuery.event.trigger(

						// Support: IE <=9 - 11+
						// Extend with the prototype to reset the above stopImmediatePropagation()
						jQuery.extend( saved[ 0 ], jQuery.Event.prototype ),
						saved.slice( 1 ),
						this
					)
				} );

				// Abort handling of the native event
				event.stopImmediatePropagation();
			}
		}
	} );
}

jQuery.removeEvent = function( elem, type, handle ) {

	// This "if" is needed for plain objects
	if ( elem.removeEventListener ) {
		elem.removeEventListener( type, handle );
	}
};

jQuery.Event = function( src, props ) {

	// Allow instantiation without the 'new' keyword
	if ( !( this instanceof jQuery.Event ) ) {
		return new jQuery.Event( src, props );
	}

	// Event object
	if ( src && src.type ) {
		this.originalEvent = src;
		this.type = src.type;

		// Events bubbling up the document may have been marked as prevented
		// by a handler lower down the tree; reflect the correct value.
		this.isDefaultPrevented = src.defaultPrevented ||
				src.defaultPrevented === undefined &&

				// Support: Android <=2.3 only
				src.returnValue === false ?
			returnTrue :
			returnFalse;

		// Create target properties
		// Support: Safari <=6 - 7 only
		// Target should not be a text node (#504, #13143)
		this.target = ( src.target && src.target.nodeType === 3 ) ?
			src.target.parentNode :
			src.target;

		this.currentTarget = src.currentTarget;
		this.relatedTarget = src.relatedTarget;

	// Event type
	} else {
		this.type = src;
	}

	// Put explicitly provided properties onto the event object
	if ( props ) {
		jQuery.extend( this, props );
	}

	// Create a timestamp if incoming event doesn't have one
	this.timeStamp = src && src.timeStamp || Date.now();

	// Mark it as fixed
	this[ jQuery.expando ] = true;
};

// jQuery.Event is based on DOM3 Events as specified by the ECMAScript Language Binding
// https://www.w3.org/TR/2003/WD-DOM-Level-3-Events-20030331/ecma-script-binding.html
jQuery.Event.prototype = {
	constructor: jQuery.Event,
	isDefaultPrevented: returnFalse,
	isPropagationStopped: returnFalse,
	isImmediatePropagationStopped: returnFalse,
	isSimulated: false,

	preventDefault: function() {
		var e = this.originalEvent;

		this.isDefaultPrevented = returnTrue;

		if ( e && !this.isSimulated ) {
			e.preventDefault();
		}
	},
	stopPropagation: function() {
		var e = this.originalEvent;

		this.isPropagationStopped = returnTrue;

		if ( e && !this.isSimulated ) {
			e.stopPropagation();
		}
	},
	stopImmediatePropagation: function() {
		var e = this.originalEvent;

		this.isImmediatePropagationStopped = returnTrue;

		if ( e && !this.isSimulated ) {
			e.stopImmediatePropagation();
		}

		this.stopPropagation();
	}
};

// Includes all common event props including KeyEvent and MouseEvent specific props
jQuery.each( {
	altKey: true,
	bubbles: true,
	cancelable: true,
	changedTouches: true,
	ctrlKey: true,
	detail: true,
	eventPhase: true,
	metaKey: true,
	pageX: true,
	pageY: true,
	shiftKey: true,
	view: true,
	"char": true,
	code: true,
	charCode: true,
	key: true,
	keyCode: true,
	button: true,
	buttons: true,
	clientX: true,
	clientY: true,
	offsetX: true,
	offsetY: true,
	pointerId: true,
	pointerType: true,
	screenX: true,
	screenY: true,
	targetTouches: true,
	toElement: true,
	touches: true,

	which: function( event ) {
		var button = event.button;

		// Add which for key events
		if ( event.which == null && rkeyEvent.test( event.type ) ) {
			return event.charCode != null ? event.charCode : event.keyCode;
		}

		// Add which for click: 1 === left; 2 === middle; 3 === right
		if ( !event.which && button !== undefined && rmouseEvent.test( event.type ) ) {
			if ( button & 1 ) {
				return 1;
			}

			if ( button & 2 ) {
				return 3;
			}

			if ( button & 4 ) {
				return 2;
			}

			return 0;
		}

		return event.which;
	}
}, jQuery.event.addProp );

jQuery.each( { focus: "focusin", blur: "focusout" }, function( type, delegateType ) {
	jQuery.event.special[ type ] = {

		// Utilize native event if possible so blur/focus sequence is correct
		setup: function() {

			// Claim the first handler
			// dataPriv.set( this, "focus", ... )
			// dataPriv.set( this, "blur", ... )
			leverageNative( this, type, expectSync );

			// Return false to allow normal processing in the caller
			return false;
		},
		trigger: function() {

			// Force setup before trigger
			leverageNative( this, type );

			// Return non-false to allow normal event-path propagation
			return true;
		},

		delegateType: delegateType
	};
} );

// Create mouseenter/leave events using mouseover/out and event-time checks
// so that event delegation works in jQuery.
// Do the same for pointerenter/pointerleave and pointerover/pointerout
//
// Support: Safari 7 only
// Safari sends mouseenter too often; see:
// https://bugs.chromium.org/p/chromium/issues/detail?id=470258
// for the description of the bug (it existed in older Chrome versions as well).
jQuery.each( {
	mouseenter: "mouseover",
	mouseleave: "mouseout",
	pointerenter: "pointerover",
	pointerleave: "pointerout"
}, function( orig, fix ) {
	jQuery.event.special[ orig ] = {
		delegateType: fix,
		bindType: fix,

		handle: function( event ) {
			var ret,
				target = this,
				related = event.relatedTarget,
				handleObj = event.handleObj;

			// For mouseenter/leave call the handler if related is outside the target.
			// NB: No relatedTarget if the mouse left/entered the browser window
			if ( !related || ( related !== target && !jQuery.contains( target, related ) ) ) {
				event.type = handleObj.origType;
				ret = handleObj.handler.apply( this, arguments );
				event.type = fix;
			}
			return ret;
		}
	};
} );

jQuery.fn.extend( {

	on: function( types, selector, data, fn ) {
		return on( this, types, selector, data, fn );
	},
	one: function( types, selector, data, fn ) {
		return on( this, types, selector, data, fn, 1 );
	},
	off: function( types, selector, fn ) {
		var handleObj, type;
		if ( types && types.preventDefault && types.handleObj ) {

			// ( event )  dispatched jQuery.Event
			handleObj = types.handleObj;
			jQuery( types.delegateTarget ).off(
				handleObj.namespace ?
					handleObj.origType + "." + handleObj.namespace :
					handleObj.origType,
				handleObj.selector,
				handleObj.handler
			);
			return this;
		}
		if ( typeof types === "object" ) {

			// ( types-object [, selector] )
			for ( type in types ) {
				this.off( type, selector, types[ type ] );
			}
			return this;
		}
		if ( selector === false || typeof selector === "function" ) {

			// ( types [, fn] )
			fn = selector;
			selector = undefined;
		}
		if ( fn === false ) {
			fn = returnFalse;
		}
		return this.each( function() {
			jQuery.event.remove( this, types, fn, selector );
		} );
	}
} );


var

	// Support: IE <=10 - 11, Edge 12 - 13 only
	// In IE/Edge using regex groups here causes severe slowdowns.
	// See https://connect.microsoft.com/IE/feedback/details/1736512/
	rnoInnerhtml = /<script|<style|<link/i,

	// checked="checked" or checked
	rchecked = /checked\s*(?:[^=]|=\s*.checked.)/i,
	rcleanScript = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;

// Prefer a tbody over its parent table for containing new rows
function manipulationTarget( elem, content ) {
	if ( nodeName( elem, "table" ) &&
		nodeName( content.nodeType !== 11 ? content : content.firstChild, "tr" ) ) {

		return jQuery( elem ).children( "tbody" )[ 0 ] || elem;
	}

	return elem;
}

// Replace/restore the type attribute of script elements for safe DOM manipulation
function disableScript( elem ) {
	elem.type = ( elem.getAttribute( "type" ) !== null ) + "/" + elem.type;
	return elem;
}
function restoreScript( elem ) {
	if ( ( elem.type || "" ).slice( 0, 5 ) === "true/" ) {
		elem.type = elem.type.slice( 5 );
	} else {
		elem.removeAttribute( "type" );
	}

	return elem;
}

function cloneCopyEvent( src, dest ) {
	var i, l, type, pdataOld, udataOld, udataCur, events;

	if ( dest.nodeType !== 1 ) {
		return;
	}

	// 1. Copy private data: events, handlers, etc.
	if ( dataPriv.hasData( src ) ) {
		pdataOld = dataPriv.get( src );
		events = pdataOld.events;

		if ( events ) {
			dataPriv.remove( dest, "handle events" );

			for ( type in events ) {
				for ( i = 0, l = events[ type ].length; i < l; i++ ) {
					jQuery.event.add( dest, type, events[ type ][ i ] );
				}
			}
		}
	}

	// 2. Copy user data
	if ( dataUser.hasData( src ) ) {
		udataOld = dataUser.access( src );
		udataCur = jQuery.extend( {}, udataOld );

		dataUser.set( dest, udataCur );
	}
}

// Fix IE bugs, see support tests
function fixInput( src, dest ) {
	var nodeName = dest.nodeName.toLowerCase();

	// Fails to persist the checked state of a cloned checkbox or radio button.
	if ( nodeName === "input" && rcheckableType.test( src.type ) ) {
		dest.checked = src.checked;

	// Fails to return the selected option to the default selected state when cloning options
	} else if ( nodeName === "input" || nodeName === "textarea" ) {
		dest.defaultValue = src.defaultValue;
	}
}

function domManip( collection, args, callback, ignored ) {

	// Flatten any nested arrays
	args = flat( args );

	var fragment, first, scripts, hasScripts, node, doc,
		i = 0,
		l = collection.length,
		iNoClone = l - 1,
		value = args[ 0 ],
		valueIsFunction = isFunction( value );

	// We can't cloneNode fragments that contain checked, in WebKit
	if ( valueIsFunction ||
			( l > 1 && typeof value === "string" &&
				!support.checkClone && rchecked.test( value ) ) ) {
		return collection.each( function( index ) {
			var self = collection.eq( index );
			if ( valueIsFunction ) {
				args[ 0 ] = value.call( this, index, self.html() );
			}
			domManip( self, args, callback, ignored );
		} );
	}

	if ( l ) {
		fragment = buildFragment( args, collection[ 0 ].ownerDocument, false, collection, ignored );
		first = fragment.firstChild;

		if ( fragment.childNodes.length === 1 ) {
			fragment = first;
		}

		// Require either new content or an interest in ignored elements to invoke the callback
		if ( first || ignored ) {
			scripts = jQuery.map( getAll( fragment, "script" ), disableScript );
			hasScripts = scripts.length;

			// Use the original fragment for the last item
			// instead of the first because it can end up
			// being emptied incorrectly in certain situations (#8070).
			for ( ; i < l; i++ ) {
				node = fragment;

				if ( i !== iNoClone ) {
					node = jQuery.clone( node, true, true );

					// Keep references to cloned scripts for later restoration
					if ( hasScripts ) {

						// Support: Android <=4.0 only, PhantomJS 1 only
						// push.apply(_, arraylike) throws on ancient WebKit
						jQuery.merge( scripts, getAll( node, "script" ) );
					}
				}

				callback.call( collection[ i ], node, i );
			}

			if ( hasScripts ) {
				doc = scripts[ scripts.length - 1 ].ownerDocument;

				// Reenable scripts
				jQuery.map( scripts, restoreScript );

				// Evaluate executable scripts on first document insertion
				for ( i = 0; i < hasScripts; i++ ) {
					node = scripts[ i ];
					if ( rscriptType.test( node.type || "" ) &&
						!dataPriv.access( node, "globalEval" ) &&
						jQuery.contains( doc, node ) ) {

						if ( node.src && ( node.type || "" ).toLowerCase()  !== "module" ) {

							// Optional AJAX dependency, but won't run scripts if not present
							if ( jQuery._evalUrl && !node.noModule ) {
								jQuery._evalUrl( node.src, {
									nonce: node.nonce || node.getAttribute( "nonce" )
								}, doc );
							}
						} else {
							DOMEval( node.textContent.replace( rcleanScript, "" ), node, doc );
						}
					}
				}
			}
		}
	}

	return collection;
}

function remove( elem, selector, keepData ) {
	var node,
		nodes = selector ? jQuery.filter( selector, elem ) : elem,
		i = 0;

	for ( ; ( node = nodes[ i ] ) != null; i++ ) {
		if ( !keepData && node.nodeType === 1 ) {
			jQuery.cleanData( getAll( node ) );
		}

		if ( node.parentNode ) {
			if ( keepData && isAttached( node ) ) {
				setGlobalEval( getAll( node, "script" ) );
			}
			node.parentNode.removeChild( node );
		}
	}

	return elem;
}

jQuery.extend( {
	htmlPrefilter: function( html ) {
		return html;
	},

	clone: function( elem, dataAndEvents, deepDataAndEvents ) {
		var i, l, srcElements, destElements,
			clone = elem.cloneNode( true ),
			inPage = isAttached( elem );

		// Fix IE cloning issues
		if ( !support.noCloneChecked && ( elem.nodeType === 1 || elem.nodeType === 11 ) &&
				!jQuery.isXMLDoc( elem ) ) {

			// We eschew Sizzle here for performance reasons: https://jsperf.com/getall-vs-sizzle/2
			destElements = getAll( clone );
			srcElements = getAll( elem );

			for ( i = 0, l = srcElements.length; i < l; i++ ) {
				fixInput( srcElements[ i ], destElements[ i ] );
			}
		}

		// Copy the events from the original to the clone
		if ( dataAndEvents ) {
			if ( deepDataAndEvents ) {
				srcElements = srcElements || getAll( elem );
				destElements = destElements || getAll( clone );

				for ( i = 0, l = srcElements.length; i < l; i++ ) {
					cloneCopyEvent( srcElements[ i ], destElements[ i ] );
				}
			} else {
				cloneCopyEvent( elem, clone );
			}
		}

		// Preserve script evaluation history
		destElements = getAll( clone, "script" );
		if ( destElements.length > 0 ) {
			setGlobalEval( destElements, !inPage && getAll( elem, "script" ) );
		}

		// Return the cloned set
		return clone;
	},

	cleanData: function( elems ) {
		var data, elem, type,
			special = jQuery.event.special,
			i = 0;

		for ( ; ( elem = elems[ i ] ) !== undefined; i++ ) {
			if ( acceptData( elem ) ) {
				if ( ( data = elem[ dataPriv.expando ] ) ) {
					if ( data.events ) {
						for ( type in data.events ) {
							if ( special[ type ] ) {
								jQuery.event.remove( elem, type );

							// This is a shortcut to avoid jQuery.event.remove's overhead
							} else {
								jQuery.removeEvent( elem, type, data.handle );
							}
						}
					}

					// Support: Chrome <=35 - 45+
					// Assign undefined instead of using delete, see Data#remove
					elem[ dataPriv.expando ] = undefined;
				}
				if ( elem[ dataUser.expando ] ) {

					// Support: Chrome <=35 - 45+
					// Assign undefined instead of using delete, see Data#remove
					elem[ dataUser.expando ] = undefined;
				}
			}
		}
	}
} );

jQuery.fn.extend( {
	detach: function( selector ) {
		return remove( this, selector, true );
	},

	remove: function( selector ) {
		return remove( this, selector );
	},

	text: function( value ) {
		return access( this, function( value ) {
			return value === undefined ?
				jQuery.text( this ) :
				this.empty().each( function() {
					if ( this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9 ) {
						this.textContent = value;
					}
				} );
		}, null, value, arguments.length );
	},

	append: function() {
		return domManip( this, arguments, function( elem ) {
			if ( this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9 ) {
				var target = manipulationTarget( this, elem );
				target.appendChild( elem );
			}
		} );
	},

	prepend: function() {
		return domManip( this, arguments, function( elem ) {
			if ( this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9 ) {
				var target = manipulationTarget( this, elem );
				target.insertBefore( elem, target.firstChild );
			}
		} );
	},

	before: function() {
		return domManip( this, arguments, function( elem ) {
			if ( this.parentNode ) {
				this.parentNode.insertBefore( elem, this );
			}
		} );
	},

	after: function() {
		return domManip( this, arguments, function( elem ) {
			if ( this.parentNode ) {
				this.parentNode.insertBefore( elem, this.nextSibling );
			}
		} );
	},

	empty: function() {
		var elem,
			i = 0;

		for ( ; ( elem = this[ i ] ) != null; i++ ) {
			if ( elem.nodeType === 1 ) {

				// Prevent memory leaks
				jQuery.cleanData( getAll( elem, false ) );

				// Remove any remaining nodes
				elem.textContent = "";
			}
		}

		return this;
	},

	clone: function( dataAndEvents, deepDataAndEvents ) {
		dataAndEvents = dataAndEvents == null ? false : dataAndEvents;
		deepDataAndEvents = deepDataAndEvents == null ? dataAndEvents : deepDataAndEvents;

		return this.map( function() {
			return jQuery.clone( this, dataAndEvents, deepDataAndEvents );
		} );
	},

	html: function( value ) {
		return access( this, function( value ) {
			var elem = this[ 0 ] || {},
				i = 0,
				l = this.length;

			if ( value === undefined && elem.nodeType === 1 ) {
				return elem.innerHTML;
			}

			// See if we can take a shortcut and just use innerHTML
			if ( typeof value === "string" && !rnoInnerhtml.test( value ) &&
				!wrapMap[ ( rtagName.exec( value ) || [ "", "" ] )[ 1 ].toLowerCase() ] ) {

				value = jQuery.htmlPrefilter( value );

				try {
					for ( ; i < l; i++ ) {
						elem = this[ i ] || {};

						// Remove element nodes and prevent memory leaks
						if ( elem.nodeType === 1 ) {
							jQuery.cleanData( getAll( elem, false ) );
							elem.innerHTML = value;
						}
					}

					elem = 0;

				// If using innerHTML throws an exception, use the fallback method
				} catch ( e ) {}
			}

			if ( elem ) {
				this.empty().append( value );
			}
		}, null, value, arguments.length );
	},

	replaceWith: function() {
		var ignored = [];

		// Make the changes, replacing each non-ignored context element with the new content
		return domManip( this, arguments, function( elem ) {
			var parent = this.parentNode;

			if ( jQuery.inArray( this, ignored ) < 0 ) {
				jQuery.cleanData( getAll( this ) );
				if ( parent ) {
					parent.replaceChild( elem, this );
				}
			}

		// Force callback invocation
		}, ignored );
	}
} );

jQuery.each( {
	appendTo: "append",
	prependTo: "prepend",
	insertBefore: "before",
	insertAfter: "after",
	replaceAll: "replaceWith"
}, function( name, original ) {
	jQuery.fn[ name ] = function( selector ) {
		var elems,
			ret = [],
			insert = jQuery( selector ),
			last = insert.length - 1,
			i = 0;

		for ( ; i <= last; i++ ) {
			elems = i === last ? this : this.clone( true );
			jQuery( insert[ i ] )[ original ]( elems );

			// Support: Android <=4.0 only, PhantomJS 1 only
			// .get() because push.apply(_, arraylike) throws on ancient WebKit
			push.apply( ret, elems.get() );
		}

		return this.pushStack( ret );
	};
} );
var rnumnonpx = new RegExp( "^(" + pnum + ")(?!px)[a-z%]+$", "i" );

var getStyles = function( elem ) {

		// Support: IE <=11 only, Firefox <=30 (#15098, #14150)
		// IE throws on elements created in popups
		// FF meanwhile throws on frame elements through "defaultView.getComputedStyle"
		var view = elem.ownerDocument.defaultView;

		if ( !view || !view.opener ) {
			view = window;
		}

		return view.getComputedStyle( elem );
	};

var swap = function( elem, options, callback ) {
	var ret, name,
		old = {};

	// Remember the old values, and insert the new ones
	for ( name in options ) {
		old[ name ] = elem.style[ name ];
		elem.style[ name ] = options[ name ];
	}

	ret = callback.call( elem );

	// Revert the old values
	for ( name in options ) {
		elem.style[ name ] = old[ name ];
	}

	return ret;
};


var rboxStyle = new RegExp( cssExpand.join( "|" ), "i" );



( function() {

	// Executing both pixelPosition & boxSizingReliable tests require only one layout
	// so they're executed at the same time to save the second computation.
	function computeStyleTests() {

		// This is a singleton, we need to execute it only once
		if ( !div ) {
			return;
		}

		container.style.cssText = "position:absolute;left:-11111px;width:60px;" +
			"margin-top:1px;padding:0;border:0";
		div.style.cssText =
			"position:relative;display:block;box-sizing:border-box;overflow:scroll;" +
			"margin:auto;border:1px;padding:1px;" +
			"width:60%;top:1%";
		documentElement.appendChild( container ).appendChild( div );

		var divStyle = window.getComputedStyle( div );
		pixelPositionVal = divStyle.top !== "1%";

		// Support: Android 4.0 - 4.3 only, Firefox <=3 - 44
		reliableMarginLeftVal = roundPixelMeasures( divStyle.marginLeft ) === 12;

		// Support: Android 4.0 - 4.3 only, Safari <=9.1 - 10.1, iOS <=7.0 - 9.3
		// Some styles come back with percentage values, even though they shouldn't
		div.style.right = "60%";
		pixelBoxStylesVal = roundPixelMeasures( divStyle.right ) === 36;

		// Support: IE 9 - 11 only
		// Detect misreporting of content dimensions for box-sizing:border-box elements
		boxSizingReliableVal = roundPixelMeasures( divStyle.width ) === 36;

		// Support: IE 9 only
		// Detect overflow:scroll screwiness (gh-3699)
		// Support: Chrome <=64
		// Don't get tricked when zoom affects offsetWidth (gh-4029)
		div.style.position = "absolute";
		scrollboxSizeVal = roundPixelMeasures( div.offsetWidth / 3 ) === 12;

		documentElement.removeChild( container );

		// Nullify the div so it wouldn't be stored in the memory and
		// it will also be a sign that checks already performed
		div = null;
	}

	function roundPixelMeasures( measure ) {
		return Math.round( parseFloat( measure ) );
	}

	var pixelPositionVal, boxSizingReliableVal, scrollboxSizeVal, pixelBoxStylesVal,
		reliableTrDimensionsVal, reliableMarginLeftVal,
		container = document.createElement( "div" ),
		div = document.createElement( "div" );

	// Finish early in limited (non-browser) environments
	if ( !div.style ) {
		return;
	}

	// Support: IE <=9 - 11 only
	// Style of cloned element affects source element cloned (#8908)
	div.style.backgroundClip = "content-box";
	div.cloneNode( true ).style.backgroundClip = "";
	support.clearCloneStyle = div.style.backgroundClip === "content-box";

	jQuery.extend( support, {
		boxSizingReliable: function() {
			computeStyleTests();
			return boxSizingReliableVal;
		},
		pixelBoxStyles: function() {
			computeStyleTests();
			return pixelBoxStylesVal;
		},
		pixelPosition: function() {
			computeStyleTests();
			return pixelPositionVal;
		},
		reliableMarginLeft: function() {
			computeStyleTests();
			return reliableMarginLeftVal;
		},
		scrollboxSize: function() {
			computeStyleTests();
			return scrollboxSizeVal;
		},

		// Support: IE 9 - 11+, Edge 15 - 18+
		// IE/Edge misreport `getComputedStyle` of table rows with width/height
		// set in CSS while `offset*` properties report correct values.
		// Behavior in IE 9 is more subtle than in newer versions & it passes
		// some versions of this test; make sure not to make it pass there!
		reliableTrDimensions: function() {
			var table, tr, trChild, trStyle;
			if ( reliableTrDimensionsVal == null ) {
				table = document.createElement( "table" );
				tr = document.createElement( "tr" );
				trChild = document.createElement( "div" );

				table.style.cssText = "position:absolute;left:-11111px";
				tr.style.height = "1px";
				trChild.style.height = "9px";

				documentElement
					.appendChild( table )
					.appendChild( tr )
					.appendChild( trChild );

				trStyle = window.getComputedStyle( tr );
				reliableTrDimensionsVal = parseInt( trStyle.height ) > 3;

				documentElement.removeChild( table );
			}
			return reliableTrDimensionsVal;
		}
	} );
} )();


function curCSS( elem, name, computed ) {
	var width, minWidth, maxWidth, ret,

		// Support: Firefox 51+
		// Retrieving style before computed somehow
		// fixes an issue with getting wrong values
		// on detached elements
		style = elem.style;

	computed = computed || getStyles( elem );

	// getPropertyValue is needed for:
	//   .css('filter') (IE 9 only, #12537)
	//   .css('--customProperty) (#3144)
	if ( computed ) {
		ret = computed.getPropertyValue( name ) || computed[ name ];

		if ( ret === "" && !isAttached( elem ) ) {
			ret = jQuery.style( elem, name );
		}

		// A tribute to the "awesome hack by Dean Edwards"
		// Android Browser returns percentage for some values,
		// but width seems to be reliably pixels.
		// This is against the CSSOM draft spec:
		// https://drafts.csswg.org/cssom/#resolved-values
		if ( !support.pixelBoxStyles() && rnumnonpx.test( ret ) && rboxStyle.test( name ) ) {

			// Remember the original values
			width = style.width;
			minWidth = style.minWidth;
			maxWidth = style.maxWidth;

			// Put in the new values to get a computed value out
			style.minWidth = style.maxWidth = style.width = ret;
			ret = computed.width;

			// Revert the changed values
			style.width = width;
			style.minWidth = minWidth;
			style.maxWidth = maxWidth;
		}
	}

	return ret !== undefined ?

		// Support: IE <=9 - 11 only
		// IE returns zIndex value as an integer.
		ret + "" :
		ret;
}


function addGetHookIf( conditionFn, hookFn ) {

	// Define the hook, we'll check on the first run if it's really needed.
	return {
		get: function() {
			if ( conditionFn() ) {

				// Hook not needed (or it's not possible to use it due
				// to missing dependency), remove it.
				delete this.get;
				return;
			}

			// Hook needed; redefine it so that the support test is not executed again.
			return ( this.get = hookFn ).apply( this, arguments );
		}
	};
}


var cssPrefixes = [ "Webkit", "Moz", "ms" ],
	emptyStyle = document.createElement( "div" ).style,
	vendorProps = {};

// Return a vendor-prefixed property or undefined
function vendorPropName( name ) {

	// Check for vendor prefixed names
	var capName = name[ 0 ].toUpperCase() + name.slice( 1 ),
		i = cssPrefixes.length;

	while ( i-- ) {
		name = cssPrefixes[ i ] + capName;
		if ( name in emptyStyle ) {
			return name;
		}
	}
}

// Return a potentially-mapped jQuery.cssProps or vendor prefixed property
function finalPropName( name ) {
	var final = jQuery.cssProps[ name ] || vendorProps[ name ];

	if ( final ) {
		return final;
	}
	if ( name in emptyStyle ) {
		return name;
	}
	return vendorProps[ name ] = vendorPropName( name ) || name;
}


var

	// Swappable if display is none or starts with table
	// except "table", "table-cell", or "table-caption"
	// See here for display values: https://developer.mozilla.org/en-US/docs/CSS/display
	rdisplayswap = /^(none|table(?!-c[ea]).+)/,
	rcustomProp = /^--/,
	cssShow = { position: "absolute", visibility: "hidden", display: "block" },
	cssNormalTransform = {
		letterSpacing: "0",
		fontWeight: "400"
	};

function setPositiveNumber( _elem, value, subtract ) {

	// Any relative (+/-) values have already been
	// normalized at this point
	var matches = rcssNum.exec( value );
	return matches ?

		// Guard against undefined "subtract", e.g., when used as in cssHooks
		Math.max( 0, matches[ 2 ] - ( subtract || 0 ) ) + ( matches[ 3 ] || "px" ) :
		value;
}

function boxModelAdjustment( elem, dimension, box, isBorderBox, styles, computedVal ) {
	var i = dimension === "width" ? 1 : 0,
		extra = 0,
		delta = 0;

	// Adjustment may not be necessary
	if ( box === ( isBorderBox ? "border" : "content" ) ) {
		return 0;
	}

	for ( ; i < 4; i += 2 ) {

		// Both box models exclude margin
		if ( box === "margin" ) {
			delta += jQuery.css( elem, box + cssExpand[ i ], true, styles );
		}

		// If we get here with a content-box, we're seeking "padding" or "border" or "margin"
		if ( !isBorderBox ) {

			// Add padding
			delta += jQuery.css( elem, "padding" + cssExpand[ i ], true, styles );

			// For "border" or "margin", add border
			if ( box !== "padding" ) {
				delta += jQuery.css( elem, "border" + cssExpand[ i ] + "Width", true, styles );

			// But still keep track of it otherwise
			} else {
				extra += jQuery.css( elem, "border" + cssExpand[ i ] + "Width", true, styles );
			}

		// If we get here with a border-box (content + padding + border), we're seeking "content" or
		// "padding" or "margin"
		} else {

			// For "content", subtract padding
			if ( box === "content" ) {
				delta -= jQuery.css( elem, "padding" + cssExpand[ i ], true, styles );
			}

			// For "content" or "padding", subtract border
			if ( box !== "margin" ) {
				delta -= jQuery.css( elem, "border" + cssExpand[ i ] + "Width", true, styles );
			}
		}
	}

	// Account for positive content-box scroll gutter when requested by providing computedVal
	if ( !isBorderBox && computedVal >= 0 ) {

		// offsetWidth/offsetHeight is a rounded sum of content, padding, scroll gutter, and border
		// Assuming integer scroll gutter, subtract the rest and round down
		delta += Math.max( 0, Math.ceil(
			elem[ "offset" + dimension[ 0 ].toUpperCase() + dimension.slice( 1 ) ] -
			computedVal -
			delta -
			extra -
			0.5

		// If offsetWidth/offsetHeight is unknown, then we can't determine content-box scroll gutter
		// Use an explicit zero to avoid NaN (gh-3964)
		) ) || 0;
	}

	return delta;
}

function getWidthOrHeight( elem, dimension, extra ) {

	// Start with computed style
	var styles = getStyles( elem ),

		// To avoid forcing a reflow, only fetch boxSizing if we need it (gh-4322).
		// Fake content-box until we know it's needed to know the true value.
		boxSizingNeeded = !support.boxSizingReliable() || extra,
		isBorderBox = boxSizingNeeded &&
			jQuery.css( elem, "boxSizing", false, styles ) === "border-box",
		valueIsBorderBox = isBorderBox,

		val = curCSS( elem, dimension, styles ),
		offsetProp = "offset" + dimension[ 0 ].toUpperCase() + dimension.slice( 1 );

	// Support: Firefox <=54
	// Return a confounding non-pixel value or feign ignorance, as appropriate.
	if ( rnumnonpx.test( val ) ) {
		if ( !extra ) {
			return val;
		}
		val = "auto";
	}


	// Support: IE 9 - 11 only
	// Use offsetWidth/offsetHeight for when box sizing is unreliable.
	// In those cases, the computed value can be trusted to be border-box.
	if ( ( !support.boxSizingReliable() && isBorderBox ||

		// Support: IE 10 - 11+, Edge 15 - 18+
		// IE/Edge misreport `getComputedStyle` of table rows with width/height
		// set in CSS while `offset*` properties report correct values.
		// Interestingly, in some cases IE 9 doesn't suffer from this issue.
		!support.reliableTrDimensions() && nodeName( elem, "tr" ) ||

		// Fall back to offsetWidth/offsetHeight when value is "auto"
		// This happens for inline elements with no explicit setting (gh-3571)
		val === "auto" ||

		// Support: Android <=4.1 - 4.3 only
		// Also use offsetWidth/offsetHeight for misreported inline dimensions (gh-3602)
		!parseFloat( val ) && jQuery.css( elem, "display", false, styles ) === "inline" ) &&

		// Make sure the element is visible & connected
		elem.getClientRects().length ) {

		isBorderBox = jQuery.css( elem, "boxSizing", false, styles ) === "border-box";

		// Where available, offsetWidth/offsetHeight approximate border box dimensions.
		// Where not available (e.g., SVG), assume unreliable box-sizing and interpret the
		// retrieved value as a content box dimension.
		valueIsBorderBox = offsetProp in elem;
		if ( valueIsBorderBox ) {
			val = elem[ offsetProp ];
		}
	}

	// Normalize "" and auto
	val = parseFloat( val ) || 0;

	// Adjust for the element's box model
	return ( val +
		boxModelAdjustment(
			elem,
			dimension,
			extra || ( isBorderBox ? "border" : "content" ),
			valueIsBorderBox,
			styles,

			// Provide the current computed size to request scroll gutter calculation (gh-3589)
			val
		)
	) + "px";
}

jQuery.extend( {

	// Add in style property hooks for overriding the default
	// behavior of getting and setting a style property
	cssHooks: {
		opacity: {
			get: function( elem, computed ) {
				if ( computed ) {

					// We should always get a number back from opacity
					var ret = curCSS( elem, "opacity" );
					return ret === "" ? "1" : ret;
				}
			}
		}
	},

	// Don't automatically add "px" to these possibly-unitless properties
	cssNumber: {
		"animationIterationCount": true,
		"columnCount": true,
		"fillOpacity": true,
		"flexGrow": true,
		"flexShrink": true,
		"fontWeight": true,
		"gridArea": true,
		"gridColumn": true,
		"gridColumnEnd": true,
		"gridColumnStart": true,
		"gridRow": true,
		"gridRowEnd": true,
		"gridRowStart": true,
		"lineHeight": true,
		"opacity": true,
		"order": true,
		"orphans": true,
		"widows": true,
		"zIndex": true,
		"zoom": true
	},

	// Add in properties whose names you wish to fix before
	// setting or getting the value
	cssProps: {},

	// Get and set the style property on a DOM Node
	style: function( elem, name, value, extra ) {

		// Don't set styles on text and comment nodes
		if ( !elem || elem.nodeType === 3 || elem.nodeType === 8 || !elem.style ) {
			return;
		}

		// Make sure that we're working with the right name
		var ret, type, hooks,
			origName = camelCase( name ),
			isCustomProp = rcustomProp.test( name ),
			style = elem.style;

		// Make sure that we're working with the right name. We don't
		// want to query the value if it is a CSS custom property
		// since they are user-defined.
		if ( !isCustomProp ) {
			name = finalPropName( origName );
		}

		// Gets hook for the prefixed version, then unprefixed version
		hooks = jQuery.cssHooks[ name ] || jQuery.cssHooks[ origName ];

		// Check if we're setting a value
		if ( value !== undefined ) {
			type = typeof value;

			// Convert "+=" or "-=" to relative numbers (#7345)
			if ( type === "string" && ( ret = rcssNum.exec( value ) ) && ret[ 1 ] ) {
				value = adjustCSS( elem, name, ret );

				// Fixes bug #9237
				type = "number";
			}

			// Make sure that null and NaN values aren't set (#7116)
			if ( value == null || value !== value ) {
				return;
			}

			// If a number was passed in, add the unit (except for certain CSS properties)
			// The isCustomProp check can be removed in jQuery 4.0 when we only auto-append
			// "px" to a few hardcoded values.
			if ( type === "number" && !isCustomProp ) {
				value += ret && ret[ 3 ] || ( jQuery.cssNumber[ origName ] ? "" : "px" );
			}

			// background-* props affect original clone's values
			if ( !support.clearCloneStyle && value === "" && name.indexOf( "background" ) === 0 ) {
				style[ name ] = "inherit";
			}

			// If a hook was provided, use that value, otherwise just set the specified value
			if ( !hooks || !( "set" in hooks ) ||
				( value = hooks.set( elem, value, extra ) ) !== undefined ) {

				if ( isCustomProp ) {
					style.setProperty( name, value );
				} else {
					style[ name ] = value;
				}
			}

		} else {

			// If a hook was provided get the non-computed value from there
			if ( hooks && "get" in hooks &&
				( ret = hooks.get( elem, false, extra ) ) !== undefined ) {

				return ret;
			}

			// Otherwise just get the value from the style object
			return style[ name ];
		}
	},

	css: function( elem, name, extra, styles ) {
		var val, num, hooks,
			origName = camelCase( name ),
			isCustomProp = rcustomProp.test( name );

		// Make sure that we're working with the right name. We don't
		// want to modify the value if it is a CSS custom property
		// since they are user-defined.
		if ( !isCustomProp ) {
			name = finalPropName( origName );
		}

		// Try prefixed name followed by the unprefixed name
		hooks = jQuery.cssHooks[ name ] || jQuery.cssHooks[ origName ];

		// If a hook was provided get the computed value from there
		if ( hooks && "get" in hooks ) {
			val = hooks.get( elem, true, extra );
		}

		// Otherwise, if a way to get the computed value exists, use that
		if ( val === undefined ) {
			val = curCSS( elem, name, styles );
		}

		// Convert "normal" to computed value
		if ( val === "normal" && name in cssNormalTransform ) {
			val = cssNormalTransform[ name ];
		}

		// Make numeric if forced or a qualifier was provided and val looks numeric
		if ( extra === "" || extra ) {
			num = parseFloat( val );
			return extra === true || isFinite( num ) ? num || 0 : val;
		}

		return val;
	}
} );

jQuery.each( [ "height", "width" ], function( _i, dimension ) {
	jQuery.cssHooks[ dimension ] = {
		get: function( elem, computed, extra ) {
			if ( computed ) {

				// Certain elements can have dimension info if we invisibly show them
				// but it must have a current display style that would benefit
				return rdisplayswap.test( jQuery.css( elem, "display" ) ) &&

					// Support: Safari 8+
					// Table columns in Safari have non-zero offsetWidth & zero
					// getBoundingClientRect().width unless display is changed.
					// Support: IE <=11 only
					// Running getBoundingClientRect on a disconnected node
					// in IE throws an error.
					( !elem.getClientRects().length || !elem.getBoundingClientRect().width ) ?
						swap( elem, cssShow, function() {
							return getWidthOrHeight( elem, dimension, extra );
						} ) :
						getWidthOrHeight( elem, dimension, extra );
			}
		},

		set: function( elem, value, extra ) {
			var matches,
				styles = getStyles( elem ),

				// Only read styles.position if the test has a chance to fail
				// to avoid forcing a reflow.
				scrollboxSizeBuggy = !support.scrollboxSize() &&
					styles.position === "absolute",

				// To avoid forcing a reflow, only fetch boxSizing if we need it (gh-3991)
				boxSizingNeeded = scrollboxSizeBuggy || extra,
				isBorderBox = boxSizingNeeded &&
					jQuery.css( elem, "boxSizing", false, styles ) === "border-box",
				subtract = extra ?
					boxModelAdjustment(
						elem,
						dimension,
						extra,
						isBorderBox,
						styles
					) :
					0;

			// Account for unreliable border-box dimensions by comparing offset* to computed and
			// faking a content-box to get border and padding (gh-3699)
			if ( isBorderBox && scrollboxSizeBuggy ) {
				subtract -= Math.ceil(
					elem[ "offset" + dimension[ 0 ].toUpperCase() + dimension.slice( 1 ) ] -
					parseFloat( styles[ dimension ] ) -
					boxModelAdjustment( elem, dimension, "border", false, styles ) -
					0.5
				);
			}

			// Convert to pixels if value adjustment is needed
			if ( subtract && ( matches = rcssNum.exec( value ) ) &&
				( matches[ 3 ] || "px" ) !== "px" ) {

				elem.style[ dimension ] = value;
				value = jQuery.css( elem, dimension );
			}

			return setPositiveNumber( elem, value, subtract );
		}
	};
} );

jQuery.cssHooks.marginLeft = addGetHookIf( support.reliableMarginLeft,
	function( elem, computed ) {
		if ( computed ) {
			return ( parseFloat( curCSS( elem, "marginLeft" ) ) ||
				elem.getBoundingClientRect().left -
					swap( elem, { marginLeft: 0 }, function() {
						return elem.getBoundingClientRect().left;
					} )
				) + "px";
		}
	}
);

// These hooks are used by animate to expand properties
jQuery.each( {
	margin: "",
	padding: "",
	border: "Width"
}, function( prefix, suffix ) {
	jQuery.cssHooks[ prefix + suffix ] = {
		expand: function( value ) {
			var i = 0,
				expanded = {},

				// Assumes a single number if not a string
				parts = typeof value === "string" ? value.split( " " ) : [ value ];

			for ( ; i < 4; i++ ) {
				expanded[ prefix + cssExpand[ i ] + suffix ] =
					parts[ i ] || parts[ i - 2 ] || parts[ 0 ];
			}

			return expanded;
		}
	};

	if ( prefix !== "margin" ) {
		jQuery.cssHooks[ prefix + suffix ].set = setPositiveNumber;
	}
} );

jQuery.fn.extend( {
	css: function( name, value ) {
		return access( this, function( elem, name, value ) {
			var styles, len,
				map = {},
				i = 0;

			if ( Array.isArray( name ) ) {
				styles = getStyles( elem );
				len = name.length;

				for ( ; i < len; i++ ) {
					map[ name[ i ] ] = jQuery.css( elem, name[ i ], false, styles );
				}

				return map;
			}

			return value !== undefined ?
				jQuery.style( elem, name, value ) :
				jQuery.css( elem, name );
		}, name, value, arguments.length > 1 );
	}
} );


function Tween( elem, options, prop, end, easing ) {
	return new Tween.prototype.init( elem, options, prop, end, easing );
}
jQuery.Tween = Tween;

Tween.prototype = {
	constructor: Tween,
	init: function( elem, options, prop, end, easing, unit ) {
		this.elem = elem;
		this.prop = prop;
		this.easing = easing || jQuery.easing._default;
		this.options = options;
		this.start = this.now = this.cur();
		this.end = end;
		this.unit = unit || ( jQuery.cssNumber[ prop ] ? "" : "px" );
	},
	cur: function() {
		var hooks = Tween.propHooks[ this.prop ];

		return hooks && hooks.get ?
			hooks.get( this ) :
			Tween.propHooks._default.get( this );
	},
	run: function( percent ) {
		var eased,
			hooks = Tween.propHooks[ this.prop ];

		if ( this.options.duration ) {
			this.pos = eased = jQuery.easing[ this.easing ](
				percent, this.options.duration * percent, 0, 1, this.options.duration
			);
		} else {
			this.pos = eased = percent;
		}
		this.now = ( this.end - this.start ) * eased + this.start;

		if ( this.options.step ) {
			this.options.step.call( this.elem, this.now, this );
		}

		if ( hooks && hooks.set ) {
			hooks.set( this );
		} else {
			Tween.propHooks._default.set( this );
		}
		return this;
	}
};

Tween.prototype.init.prototype = Tween.prototype;

Tween.propHooks = {
	_default: {
		get: function( tween ) {
			var result;

			// Use a property on the element directly when it is not a DOM element,
			// or when there is no matching style property that exists.
			if ( tween.elem.nodeType !== 1 ||
				tween.elem[ tween.prop ] != null && tween.elem.style[ tween.prop ] == null ) {
				return tween.elem[ tween.prop ];
			}

			// Passing an empty string as a 3rd parameter to .css will automatically
			// attempt a parseFloat and fallback to a string if the parse fails.
			// Simple values such as "10px" are parsed to Float;
			// complex values such as "rotate(1rad)" are returned as-is.
			result = jQuery.css( tween.elem, tween.prop, "" );

			// Empty strings, null, undefined and "auto" are converted to 0.
			return !result || result === "auto" ? 0 : result;
		},
		set: function( tween ) {

			// Use step hook for back compat.
			// Use cssHook if its there.
			// Use .style if available and use plain properties where available.
			if ( jQuery.fx.step[ tween.prop ] ) {
				jQuery.fx.step[ tween.prop ]( tween );
			} else if ( tween.elem.nodeType === 1 && (
					jQuery.cssHooks[ tween.prop ] ||
					tween.elem.style[ finalPropName( tween.prop ) ] != null ) ) {
				jQuery.style( tween.elem, tween.prop, tween.now + tween.unit );
			} else {
				tween.elem[ tween.prop ] = tween.now;
			}
		}
	}
};

// Support: IE <=9 only
// Panic based approach to setting things on disconnected nodes
Tween.propHooks.scrollTop = Tween.propHooks.scrollLeft = {
	set: function( tween ) {
		if ( tween.elem.nodeType && tween.elem.parentNode ) {
			tween.elem[ tween.prop ] = tween.now;
		}
	}
};

jQuery.easing = {
	linear: function( p ) {
		return p;
	},
	swing: function( p ) {
		return 0.5 - Math.cos( p * Math.PI ) / 2;
	},
	_default: "swing"
};

jQuery.fx = Tween.prototype.init;

// Back compat <1.8 extension point
jQuery.fx.step = {};




var
	fxNow, inProgress,
	rfxtypes = /^(?:toggle|show|hide)$/,
	rrun = /queueHooks$/;

function schedule() {
	if ( inProgress ) {
		if ( document.hidden === false && window.requestAnimationFrame ) {
			window.requestAnimationFrame( schedule );
		} else {
			window.setTimeout( schedule, jQuery.fx.interval );
		}

		jQuery.fx.tick();
	}
}

// Animations created synchronously will run synchronously
function createFxNow() {
	window.setTimeout( function() {
		fxNow = undefined;
	} );
	return ( fxNow = Date.now() );
}

// Generate parameters to create a standard animation
function genFx( type, includeWidth ) {
	var which,
		i = 0,
		attrs = { height: type };

	// If we include width, step value is 1 to do all cssExpand values,
	// otherwise step value is 2 to skip over Left and Right
	includeWidth = includeWidth ? 1 : 0;
	for ( ; i < 4; i += 2 - includeWidth ) {
		which = cssExpand[ i ];
		attrs[ "margin" + which ] = attrs[ "padding" + which ] = type;
	}

	if ( includeWidth ) {
		attrs.opacity = attrs.width = type;
	}

	return attrs;
}

function createTween( value, prop, animation ) {
	var tween,
		collection = ( Animation.tweeners[ prop ] || [] ).concat( Animation.tweeners[ "*" ] ),
		index = 0,
		length = collection.length;
	for ( ; index < length; index++ ) {
		if ( ( tween = collection[ index ].call( animation, prop, value ) ) ) {

			// We're done with this property
			return tween;
		}
	}
}

function defaultPrefilter( elem, props, opts ) {
	var prop, value, toggle, hooks, oldfire, propTween, restoreDisplay, display,
		isBox = "width" in props || "height" in props,
		anim = this,
		orig = {},
		style = elem.style,
		hidden = elem.nodeType && isHiddenWithinTree( elem ),
		dataShow = dataPriv.get( elem, "fxshow" );

	// Queue-skipping animations hijack the fx hooks
	if ( !opts.queue ) {
		hooks = jQuery._queueHooks( elem, "fx" );
		if ( hooks.unqueued == null ) {
			hooks.unqueued = 0;
			oldfire = hooks.empty.fire;
			hooks.empty.fire = function() {
				if ( !hooks.unqueued ) {
					oldfire();
				}
			};
		}
		hooks.unqueued++;

		anim.always( function() {

			// Ensure the complete handler is called before this completes
			anim.always( function() {
				hooks.unqueued--;
				if ( !jQuery.queue( elem, "fx" ).length ) {
					hooks.empty.fire();
				}
			} );
		} );
	}

	// Detect show/hide animations
	for ( prop in props ) {
		value = props[ prop ];
		if ( rfxtypes.test( value ) ) {
			delete props[ prop ];
			toggle = toggle || value === "toggle";
			if ( value === ( hidden ? "hide" : "show" ) ) {

				// Pretend to be hidden if this is a "show" and
				// there is still data from a stopped show/hide
				if ( value === "show" && dataShow && dataShow[ prop ] !== undefined ) {
					hidden = true;

				// Ignore all other no-op show/hide data
				} else {
					continue;
				}
			}
			orig[ prop ] = dataShow && dataShow[ prop ] || jQuery.style( elem, prop );
		}
	}

	// Bail out if this is a no-op like .hide().hide()
	propTween = !jQuery.isEmptyObject( props );
	if ( !propTween && jQuery.isEmptyObject( orig ) ) {
		return;
	}

	// Restrict "overflow" and "display" styles during box animations
	if ( isBox && elem.nodeType === 1 ) {

		// Support: IE <=9 - 11, Edge 12 - 15
		// Record all 3 overflow attributes because IE does not infer the shorthand
		// from identically-valued overflowX and overflowY and Edge just mirrors
		// the overflowX value there.
		opts.overflow = [ style.overflow, style.overflowX, style.overflowY ];

		// Identify a display type, preferring old show/hide data over the CSS cascade
		restoreDisplay = dataShow && dataShow.display;
		if ( restoreDisplay == null ) {
			restoreDisplay = dataPriv.get( elem, "display" );
		}
		display = jQuery.css( elem, "display" );
		if ( display === "none" ) {
			if ( restoreDisplay ) {
				display = restoreDisplay;
			} else {

				// Get nonempty value(s) by temporarily forcing visibility
				showHide( [ elem ], true );
				restoreDisplay = elem.style.display || restoreDisplay;
				display = jQuery.css( elem, "display" );
				showHide( [ elem ] );
			}
		}

		// Animate inline elements as inline-block
		if ( display === "inline" || display === "inline-block" && restoreDisplay != null ) {
			if ( jQuery.css( elem, "float" ) === "none" ) {

				// Restore the original display value at the end of pure show/hide animations
				if ( !propTween ) {
					anim.done( function() {
						style.display = restoreDisplay;
					} );
					if ( restoreDisplay == null ) {
						display = style.display;
						restoreDisplay = display === "none" ? "" : display;
					}
				}
				style.display = "inline-block";
			}
		}
	}

	if ( opts.overflow ) {
		style.overflow = "hidden";
		anim.always( function() {
			style.overflow = opts.overflow[ 0 ];
			style.overflowX = opts.overflow[ 1 ];
			style.overflowY = opts.overflow[ 2 ];
		} );
	}

	// Implement show/hide animations
	propTween = false;
	for ( prop in orig ) {

		// General show/hide setup for this element animation
		if ( !propTween ) {
			if ( dataShow ) {
				if ( "hidden" in dataShow ) {
					hidden = dataShow.hidden;
				}
			} else {
				dataShow = dataPriv.access( elem, "fxshow", { display: restoreDisplay } );
			}

			// Store hidden/visible for toggle so `.stop().toggle()` "reverses"
			if ( toggle ) {
				dataShow.hidden = !hidden;
			}

			// Show elements before animating them
			if ( hidden ) {
				showHide( [ elem ], true );
			}

			/* eslint-disable no-loop-func */

			anim.done( function() {

			/* eslint-enable no-loop-func */

				// The final step of a "hide" animation is actually hiding the element
				if ( !hidden ) {
					showHide( [ elem ] );
				}
				dataPriv.remove( elem, "fxshow" );
				for ( prop in orig ) {
					jQuery.style( elem, prop, orig[ prop ] );
				}
			} );
		}

		// Per-property setup
		propTween = createTween( hidden ? dataShow[ prop ] : 0, prop, anim );
		if ( !( prop in dataShow ) ) {
			dataShow[ prop ] = propTween.start;
			if ( hidden ) {
				propTween.end = propTween.start;
				propTween.start = 0;
			}
		}
	}
}

function propFilter( props, specialEasing ) {
	var index, name, easing, value, hooks;

	// camelCase, specialEasing and expand cssHook pass
	for ( index in props ) {
		name = camelCase( index );
		easing = specialEasing[ name ];
		value = props[ index ];
		if ( Array.isArray( value ) ) {
			easing = value[ 1 ];
			value = props[ index ] = value[ 0 ];
		}

		if ( index !== name ) {
			props[ name ] = value;
			delete props[ index ];
		}

		hooks = jQuery.cssHooks[ name ];
		if ( hooks && "expand" in hooks ) {
			value = hooks.expand( value );
			delete props[ name ];

			// Not quite $.extend, this won't overwrite existing keys.
			// Reusing 'index' because we have the correct "name"
			for ( index in value ) {
				if ( !( index in props ) ) {
					props[ index ] = value[ index ];
					specialEasing[ index ] = easing;
				}
			}
		} else {
			specialEasing[ name ] = easing;
		}
	}
}

function Animation( elem, properties, options ) {
	var result,
		stopped,
		index = 0,
		length = Animation.prefilters.length,
		deferred = jQuery.Deferred().always( function() {

			// Don't match elem in the :animated selector
			delete tick.elem;
		} ),
		tick = function() {
			if ( stopped ) {
				return false;
			}
			var currentTime = fxNow || createFxNow(),
				remaining = Math.max( 0, animation.startTime + animation.duration - currentTime ),

				// Support: Android 2.3 only
				// Archaic crash bug won't allow us to use `1 - ( 0.5 || 0 )` (#12497)
				temp = remaining / animation.duration || 0,
				percent = 1 - temp,
				index = 0,
				length = animation.tweens.length;

			for ( ; index < length; index++ ) {
				animation.tweens[ index ].run( percent );
			}

			deferred.notifyWith( elem, [ animation, percent, remaining ] );

			// If there's more to do, yield
			if ( percent < 1 && length ) {
				return remaining;
			}

			// If this was an empty animation, synthesize a final progress notification
			if ( !length ) {
				deferred.notifyWith( elem, [ animation, 1, 0 ] );
			}

			// Resolve the animation and report its conclusion
			deferred.resolveWith( elem, [ animation ] );
			return false;
		},
		animation = deferred.promise( {
			elem: elem,
			props: jQuery.extend( {}, properties ),
			opts: jQuery.extend( true, {
				specialEasing: {},
				easing: jQuery.easing._default
			}, options ),
			originalProperties: properties,
			originalOptions: options,
			startTime: fxNow || createFxNow(),
			duration: options.duration,
			tweens: [],
			createTween: function( prop, end ) {
				var tween = jQuery.Tween( elem, animation.opts, prop, end,
						animation.opts.specialEasing[ prop ] || animation.opts.easing );
				animation.tweens.push( tween );
				return tween;
			},
			stop: function( gotoEnd ) {
				var index = 0,

					// If we are going to the end, we want to run all the tweens
					// otherwise we skip this part
					length = gotoEnd ? animation.tweens.length : 0;
				if ( stopped ) {
					return this;
				}
				stopped = true;
				for ( ; index < length; index++ ) {
					animation.tweens[ index ].run( 1 );
				}

				// Resolve when we played the last frame; otherwise, reject
				if ( gotoEnd ) {
					deferred.notifyWith( elem, [ animation, 1, 0 ] );
					deferred.resolveWith( elem, [ animation, gotoEnd ] );
				} else {
					deferred.rejectWith( elem, [ animation, gotoEnd ] );
				}
				return this;
			}
		} ),
		props = animation.props;

	propFilter( props, animation.opts.specialEasing );

	for ( ; index < length; index++ ) {
		result = Animation.prefilters[ index ].call( animation, elem, props, animation.opts );
		if ( result ) {
			if ( isFunction( result.stop ) ) {
				jQuery._queueHooks( animation.elem, animation.opts.queue ).stop =
					result.stop.bind( result );
			}
			return result;
		}
	}

	jQuery.map( props, createTween, animation );

	if ( isFunction( animation.opts.start ) ) {
		animation.opts.start.call( elem, animation );
	}

	// Attach callbacks from options
	animation
		.progress( animation.opts.progress )
		.done( animation.opts.done, animation.opts.complete )
		.fail( animation.opts.fail )
		.always( animation.opts.always );

	jQuery.fx.timer(
		jQuery.extend( tick, {
			elem: elem,
			anim: animation,
			queue: animation.opts.queue
		} )
	);

	return animation;
}

jQuery.Animation = jQuery.extend( Animation, {

	tweeners: {
		"*": [ function( prop, value ) {
			var tween = this.createTween( prop, value );
			adjustCSS( tween.elem, prop, rcssNum.exec( value ), tween );
			return tween;
		} ]
	},

	tweener: function( props, callback ) {
		if ( isFunction( props ) ) {
			callback = props;
			props = [ "*" ];
		} else {
			props = props.match( rnothtmlwhite );
		}

		var prop,
			index = 0,
			length = props.length;

		for ( ; index < length; index++ ) {
			prop = props[ index ];
			Animation.tweeners[ prop ] = Animation.tweeners[ prop ] || [];
			Animation.tweeners[ prop ].unshift( callback );
		}
	},

	prefilters: [ defaultPrefilter ],

	prefilter: function( callback, prepend ) {
		if ( prepend ) {
			Animation.prefilters.unshift( callback );
		} else {
			Animation.prefilters.push( callback );
		}
	}
} );

jQuery.speed = function( speed, easing, fn ) {
	var opt = speed && typeof speed === "object" ? jQuery.extend( {}, speed ) : {
		complete: fn || !fn && easing ||
			isFunction( speed ) && speed,
		duration: speed,
		easing: fn && easing || easing && !isFunction( easing ) && easing
	};

	// Go to the end state if fx are off
	if ( jQuery.fx.off ) {
		opt.duration = 0;

	} else {
		if ( typeof opt.duration !== "number" ) {
			if ( opt.duration in jQuery.fx.speeds ) {
				opt.duration = jQuery.fx.speeds[ opt.duration ];

			} else {
				opt.duration = jQuery.fx.speeds._default;
			}
		}
	}

	// Normalize opt.queue - true/undefined/null -> "fx"
	if ( opt.queue == null || opt.queue === true ) {
		opt.queue = "fx";
	}

	// Queueing
	opt.old = opt.complete;

	opt.complete = function() {
		if ( isFunction( opt.old ) ) {
			opt.old.call( this );
		}

		if ( opt.queue ) {
			jQuery.dequeue( this, opt.queue );
		}
	};

	return opt;
};

jQuery.fn.extend( {
	fadeTo: function( speed, to, easing, callback ) {

		// Show any hidden elements after setting opacity to 0
		return this.filter( isHiddenWithinTree ).css( "opacity", 0 ).show()

			// Animate to the value specified
			.end().animate( { opacity: to }, speed, easing, callback );
	},
	animate: function( prop, speed, easing, callback ) {
		var empty = jQuery.isEmptyObject( prop ),
			optall = jQuery.speed( speed, easing, callback ),
			doAnimation = function() {

				// Operate on a copy of prop so per-property easing won't be lost
				var anim = Animation( this, jQuery.extend( {}, prop ), optall );

				// Empty animations, or finishing resolves immediately
				if ( empty || dataPriv.get( this, "finish" ) ) {
					anim.stop( true );
				}
			};
			doAnimation.finish = doAnimation;

		return empty || optall.queue === false ?
			this.each( doAnimation ) :
			this.queue( optall.queue, doAnimation );
	},
	stop: function( type, clearQueue, gotoEnd ) {
		var stopQueue = function( hooks ) {
			var stop = hooks.stop;
			delete hooks.stop;
			stop( gotoEnd );
		};

		if ( typeof type !== "string" ) {
			gotoEnd = clearQueue;
			clearQueue = type;
			type = undefined;
		}
		if ( clearQueue ) {
			this.queue( type || "fx", [] );
		}

		return this.each( function() {
			var dequeue = true,
				index = type != null && type + "queueHooks",
				timers = jQuery.timers,
				data = dataPriv.get( this );

			if ( index ) {
				if ( data[ index ] && data[ index ].stop ) {
					stopQueue( data[ index ] );
				}
			} else {
				for ( index in data ) {
					if ( data[ index ] && data[ index ].stop && rrun.test( index ) ) {
						stopQueue( data[ index ] );
					}
				}
			}

			for ( index = timers.length; index--; ) {
				if ( timers[ index ].elem === this &&
					( type == null || timers[ index ].queue === type ) ) {

					timers[ index ].anim.stop( gotoEnd );
					dequeue = false;
					timers.splice( index, 1 );
				}
			}

			// Start the next in the queue if the last step wasn't forced.
			// Timers currently will call their complete callbacks, which
			// will dequeue but only if they were gotoEnd.
			if ( dequeue || !gotoEnd ) {
				jQuery.dequeue( this, type );
			}
		} );
	},
	finish: function( type ) {
		if ( type !== false ) {
			type = type || "fx";
		}
		return this.each( function() {
			var index,
				data = dataPriv.get( this ),
				queue = data[ type + "queue" ],
				hooks = data[ type + "queueHooks" ],
				timers = jQuery.timers,
				length = queue ? queue.length : 0;

			// Enable finishing flag on private data
			data.finish = true;

			// Empty the queue first
			jQuery.queue( this, type, [] );

			if ( hooks && hooks.stop ) {
				hooks.stop.call( this, true );
			}

			// Look for any active animations, and finish them
			for ( index = timers.length; index--; ) {
				if ( timers[ index ].elem === this && timers[ index ].queue === type ) {
					timers[ index ].anim.stop( true );
					timers.splice( index, 1 );
				}
			}

			// Look for any animations in the old queue and finish them
			for ( index = 0; index < length; index++ ) {
				if ( queue[ index ] && queue[ index ].finish ) {
					queue[ index ].finish.call( this );
				}
			}

			// Turn off finishing flag
			delete data.finish;
		} );
	}
} );

jQuery.each( [ "toggle", "show", "hide" ], function( _i, name ) {
	var cssFn = jQuery.fn[ name ];
	jQuery.fn[ name ] = function( speed, easing, callback ) {
		return speed == null || typeof speed === "boolean" ?
			cssFn.apply( this, arguments ) :
			this.animate( genFx( name, true ), speed, easing, callback );
	};
} );

// Generate shortcuts for custom animations
jQuery.each( {
	slideDown: genFx( "show" ),
	slideUp: genFx( "hide" ),
	slideToggle: genFx( "toggle" ),
	fadeIn: { opacity: "show" },
	fadeOut: { opacity: "hide" },
	fadeToggle: { opacity: "toggle" }
}, function( name, props ) {
	jQuery.fn[ name ] = function( speed, easing, callback ) {
		return this.animate( props, speed, easing, callback );
	};
} );

jQuery.timers = [];
jQuery.fx.tick = function() {
	var timer,
		i = 0,
		timers = jQuery.timers;

	fxNow = Date.now();

	for ( ; i < timers.length; i++ ) {
		timer = timers[ i ];

		// Run the timer and safely remove it when done (allowing for external removal)
		if ( !timer() && timers[ i ] === timer ) {
			timers.splice( i--, 1 );
		}
	}

	if ( !timers.length ) {
		jQuery.fx.stop();
	}
	fxNow = undefined;
};

jQuery.fx.timer = function( timer ) {
	jQuery.timers.push( timer );
	jQuery.fx.start();
};

jQuery.fx.interval = 13;
jQuery.fx.start = function() {
	if ( inProgress ) {
		return;
	}

	inProgress = true;
	schedule();
};

jQuery.fx.stop = function() {
	inProgress = null;
};

jQuery.fx.speeds = {
	slow: 600,
	fast: 200,

	// Default speed
	_default: 400
};


// Based off of the plugin by Clint Helfers, with permission.
// https://web.archive.org/web/20100324014747/http://blindsignals.com/index.php/2009/07/jquery-delay/
jQuery.fn.delay = function( time, type ) {
	time = jQuery.fx ? jQuery.fx.speeds[ time ] || time : time;
	type = type || "fx";

	return this.queue( type, function( next, hooks ) {
		var timeout = window.setTimeout( next, time );
		hooks.stop = function() {
			window.clearTimeout( timeout );
		};
	} );
};


( function() {
	var input = document.createElement( "input" ),
		select = document.createElement( "select" ),
		opt = select.appendChild( document.createElement( "option" ) );

	input.type = "checkbox";

	// Support: Android <=4.3 only
	// Default value for a checkbox should be "on"
	support.checkOn = input.value !== "";

	// Support: IE <=11 only
	// Must access selectedIndex to make default options select
	support.optSelected = opt.selected;

	// Support: IE <=11 only
	// An input loses its value after becoming a radio
	input = document.createElement( "input" );
	input.value = "t";
	input.type = "radio";
	support.radioValue = input.value === "t";
} )();


var boolHook,
	attrHandle = jQuery.expr.attrHandle;

jQuery.fn.extend( {
	attr: function( name, value ) {
		return access( this, jQuery.attr, name, value, arguments.length > 1 );
	},

	removeAttr: function( name ) {
		return this.each( function() {
			jQuery.removeAttr( this, name );
		} );
	}
} );

jQuery.extend( {
	attr: function( elem, name, value ) {
		var ret, hooks,
			nType = elem.nodeType;

		// Don't get/set attributes on text, comment and attribute nodes
		if ( nType === 3 || nType === 8 || nType === 2 ) {
			return;
		}

		// Fallback to prop when attributes are not supported
		if ( typeof elem.getAttribute === "undefined" ) {
			return jQuery.prop( elem, name, value );
		}

		// Attribute hooks are determined by the lowercase version
		// Grab necessary hook if one is defined
		if ( nType !== 1 || !jQuery.isXMLDoc( elem ) ) {
			hooks = jQuery.attrHooks[ name.toLowerCase() ] ||
				( jQuery.expr.match.bool.test( name ) ? boolHook : undefined );
		}

		if ( value !== undefined ) {
			if ( value === null ) {
				jQuery.removeAttr( elem, name );
				return;
			}

			if ( hooks && "set" in hooks &&
				( ret = hooks.set( elem, value, name ) ) !== undefined ) {
				return ret;
			}

			elem.setAttribute( name, value + "" );
			return value;
		}

		if ( hooks && "get" in hooks && ( ret = hooks.get( elem, name ) ) !== null ) {
			return ret;
		}

		ret = jQuery.find.attr( elem, name );

		// Non-existent attributes return null, we normalize to undefined
		return ret == null ? undefined : ret;
	},

	attrHooks: {
		type: {
			set: function( elem, value ) {
				if ( !support.radioValue && value === "radio" &&
					nodeName( elem, "input" ) ) {
					var val = elem.value;
					elem.setAttribute( "type", value );
					if ( val ) {
						elem.value = val;
					}
					return value;
				}
			}
		}
	},

	removeAttr: function( elem, value ) {
		var name,
			i = 0,

			// Attribute names can contain non-HTML whitespace characters
			// https://html.spec.whatwg.org/multipage/syntax.html#attributes-2
			attrNames = value && value.match( rnothtmlwhite );

		if ( attrNames && elem.nodeType === 1 ) {
			while ( ( name = attrNames[ i++ ] ) ) {
				elem.removeAttribute( name );
			}
		}
	}
} );

// Hooks for boolean attributes
boolHook = {
	set: function( elem, value, name ) {
		if ( value === false ) {

			// Remove boolean attributes when set to false
			jQuery.removeAttr( elem, name );
		} else {
			elem.setAttribute( name, name );
		}
		return name;
	}
};

jQuery.each( jQuery.expr.match.bool.source.match( /\w+/g ), function( _i, name ) {
	var getter = attrHandle[ name ] || jQuery.find.attr;

	attrHandle[ name ] = function( elem, name, isXML ) {
		var ret, handle,
			lowercaseName = name.toLowerCase();

		if ( !isXML ) {

			// Avoid an infinite loop by temporarily removing this function from the getter
			handle = attrHandle[ lowercaseName ];
			attrHandle[ lowercaseName ] = ret;
			ret = getter( elem, name, isXML ) != null ?
				lowercaseName :
				null;
			attrHandle[ lowercaseName ] = handle;
		}
		return ret;
	};
} );




var rfocusable = /^(?:input|select|textarea|button)$/i,
	rclickable = /^(?:a|area)$/i;

jQuery.fn.extend( {
	prop: function( name, value ) {
		return access( this, jQuery.prop, name, value, arguments.length > 1 );
	},

	removeProp: function( name ) {
		return this.each( function() {
			delete this[ jQuery.propFix[ name ] || name ];
		} );
	}
} );

jQuery.extend( {
	prop: function( elem, name, value ) {
		var ret, hooks,
			nType = elem.nodeType;

		// Don't get/set properties on text, comment and attribute nodes
		if ( nType === 3 || nType === 8 || nType === 2 ) {
			return;
		}

		if ( nType !== 1 || !jQuery.isXMLDoc( elem ) ) {

			// Fix name and attach hooks
			name = jQuery.propFix[ name ] || name;
			hooks = jQuery.propHooks[ name ];
		}

		if ( value !== undefined ) {
			if ( hooks && "set" in hooks &&
				( ret = hooks.set( elem, value, name ) ) !== undefined ) {
				return ret;
			}

			return ( elem[ name ] = value );
		}

		if ( hooks && "get" in hooks && ( ret = hooks.get( elem, name ) ) !== null ) {
			return ret;
		}

		return elem[ name ];
	},

	propHooks: {
		tabIndex: {
			get: function( elem ) {

				// Support: IE <=9 - 11 only
				// elem.tabIndex doesn't always return the
				// correct value when it hasn't been explicitly set
				// https://web.archive.org/web/20141116233347/http://fluidproject.org/blog/2008/01/09/getting-setting-and-removing-tabindex-values-with-javascript/
				// Use proper attribute retrieval(#12072)
				var tabindex = jQuery.find.attr( elem, "tabindex" );

				if ( tabindex ) {
					return parseInt( tabindex, 10 );
				}

				if (
					rfocusable.test( elem.nodeName ) ||
					rclickable.test( elem.nodeName ) &&
					elem.href
				) {
					return 0;
				}

				return -1;
			}
		}
	},

	propFix: {
		"for": "htmlFor",
		"class": "className"
	}
} );

// Support: IE <=11 only
// Accessing the selectedIndex property
// forces the browser to respect setting selected
// on the option
// The getter ensures a default option is selected
// when in an optgroup
// eslint rule "no-unused-expressions" is disabled for this code
// since it considers such accessions noop
if ( !support.optSelected ) {
	jQuery.propHooks.selected = {
		get: function( elem ) {

			/* eslint no-unused-expressions: "off" */

			var parent = elem.parentNode;
			if ( parent && parent.parentNode ) {
				parent.parentNode.selectedIndex;
			}
			return null;
		},
		set: function( elem ) {

			/* eslint no-unused-expressions: "off" */

			var parent = elem.parentNode;
			if ( parent ) {
				parent.selectedIndex;

				if ( parent.parentNode ) {
					parent.parentNode.selectedIndex;
				}
			}
		}
	};
}

jQuery.each( [
	"tabIndex",
	"readOnly",
	"maxLength",
	"cellSpacing",
	"cellPadding",
	"rowSpan",
	"colSpan",
	"useMap",
	"frameBorder",
	"contentEditable"
], function() {
	jQuery.propFix[ this.toLowerCase() ] = this;
} );




	// Strip and collapse whitespace according to HTML spec
	// https://infra.spec.whatwg.org/#strip-and-collapse-ascii-whitespace
	function stripAndCollapse( value ) {
		var tokens = value.match( rnothtmlwhite ) || [];
		return tokens.join( " " );
	}


function getClass( elem ) {
	return elem.getAttribute && elem.getAttribute( "class" ) || "";
}

function classesToArray( value ) {
	if ( Array.isArray( value ) ) {
		return value;
	}
	if ( typeof value === "string" ) {
		return value.match( rnothtmlwhite ) || [];
	}
	return [];
}

jQuery.fn.extend( {
	addClass: function( value ) {
		var classes, elem, cur, curValue, clazz, j, finalValue,
			i = 0;

		if ( isFunction( value ) ) {
			return this.each( function( j ) {
				jQuery( this ).addClass( value.call( this, j, getClass( this ) ) );
			} );
		}

		classes = classesToArray( value );

		if ( classes.length ) {
			while ( ( elem = this[ i++ ] ) ) {
				curValue = getClass( elem );
				cur = elem.nodeType === 1 && ( " " + stripAndCollapse( curValue ) + " " );

				if ( cur ) {
					j = 0;
					while ( ( clazz = classes[ j++ ] ) ) {
						if ( cur.indexOf( " " + clazz + " " ) < 0 ) {
							cur += clazz + " ";
						}
					}

					// Only assign if different to avoid unneeded rendering.
					finalValue = stripAndCollapse( cur );
					if ( curValue !== finalValue ) {
						elem.setAttribute( "class", finalValue );
					}
				}
			}
		}

		return this;
	},

	removeClass: function( value ) {
		var classes, elem, cur, curValue, clazz, j, finalValue,
			i = 0;

		if ( isFunction( value ) ) {
			return this.each( function( j ) {
				jQuery( this ).removeClass( value.call( this, j, getClass( this ) ) );
			} );
		}

		if ( !arguments.length ) {
			return this.attr( "class", "" );
		}

		classes = classesToArray( value );

		if ( classes.length ) {
			while ( ( elem = this[ i++ ] ) ) {
				curValue = getClass( elem );

				// This expression is here for better compressibility (see addClass)
				cur = elem.nodeType === 1 && ( " " + stripAndCollapse( curValue ) + " " );

				if ( cur ) {
					j = 0;
					while ( ( clazz = classes[ j++ ] ) ) {

						// Remove *all* instances
						while ( cur.indexOf( " " + clazz + " " ) > -1 ) {
							cur = cur.replace( " " + clazz + " ", " " );
						}
					}

					// Only assign if different to avoid unneeded rendering.
					finalValue = stripAndCollapse( cur );
					if ( curValue !== finalValue ) {
						elem.setAttribute( "class", finalValue );
					}
				}
			}
		}

		return this;
	},

	toggleClass: function( value, stateVal ) {
		var type = typeof value,
			isValidValue = type === "string" || Array.isArray( value );

		if ( typeof stateVal === "boolean" && isValidValue ) {
			return stateVal ? this.addClass( value ) : this.removeClass( value );
		}

		if ( isFunction( value ) ) {
			return this.each( function( i ) {
				jQuery( this ).toggleClass(
					value.call( this, i, getClass( this ), stateVal ),
					stateVal
				);
			} );
		}

		return this.each( function() {
			var className, i, self, classNames;

			if ( isValidValue ) {

				// Toggle individual class names
				i = 0;
				self = jQuery( this );
				classNames = classesToArray( value );

				while ( ( className = classNames[ i++ ] ) ) {

					// Check each className given, space separated list
					if ( self.hasClass( className ) ) {
						self.removeClass( className );
					} else {
						self.addClass( className );
					}
				}

			// Toggle whole class name
			} else if ( value === undefined || type === "boolean" ) {
				className = getClass( this );
				if ( className ) {

					// Store className if set
					dataPriv.set( this, "__className__", className );
				}

				// If the element has a class name or if we're passed `false`,
				// then remove the whole classname (if there was one, the above saved it).
				// Otherwise bring back whatever was previously saved (if anything),
				// falling back to the empty string if nothing was stored.
				if ( this.setAttribute ) {
					this.setAttribute( "class",
						className || value === false ?
						"" :
						dataPriv.get( this, "__className__" ) || ""
					);
				}
			}
		} );
	},

	hasClass: function( selector ) {
		var className, elem,
			i = 0;

		className = " " + selector + " ";
		while ( ( elem = this[ i++ ] ) ) {
			if ( elem.nodeType === 1 &&
				( " " + stripAndCollapse( getClass( elem ) ) + " " ).indexOf( className ) > -1 ) {
					return true;
			}
		}

		return false;
	}
} );




var rreturn = /\r/g;

jQuery.fn.extend( {
	val: function( value ) {
		var hooks, ret, valueIsFunction,
			elem = this[ 0 ];

		if ( !arguments.length ) {
			if ( elem ) {
				hooks = jQuery.valHooks[ elem.type ] ||
					jQuery.valHooks[ elem.nodeName.toLowerCase() ];

				if ( hooks &&
					"get" in hooks &&
					( ret = hooks.get( elem, "value" ) ) !== undefined
				) {
					return ret;
				}

				ret = elem.value;

				// Handle most common string cases
				if ( typeof ret === "string" ) {
					return ret.replace( rreturn, "" );
				}

				// Handle cases where value is null/undef or number
				return ret == null ? "" : ret;
			}

			return;
		}

		valueIsFunction = isFunction( value );

		return this.each( function( i ) {
			var val;

			if ( this.nodeType !== 1 ) {
				return;
			}

			if ( valueIsFunction ) {
				val = value.call( this, i, jQuery( this ).val() );
			} else {
				val = value;
			}

			// Treat null/undefined as ""; convert numbers to string
			if ( val == null ) {
				val = "";

			} else if ( typeof val === "number" ) {
				val += "";

			} else if ( Array.isArray( val ) ) {
				val = jQuery.map( val, function( value ) {
					return value == null ? "" : value + "";
				} );
			}

			hooks = jQuery.valHooks[ this.type ] || jQuery.valHooks[ this.nodeName.toLowerCase() ];

			// If set returns undefined, fall back to normal setting
			if ( !hooks || !( "set" in hooks ) || hooks.set( this, val, "value" ) === undefined ) {
				this.value = val;
			}
		} );
	}
} );

jQuery.extend( {
	valHooks: {
		option: {
			get: function( elem ) {

				var val = jQuery.find.attr( elem, "value" );
				return val != null ?
					val :

					// Support: IE <=10 - 11 only
					// option.text throws exceptions (#14686, #14858)
					// Strip and collapse whitespace
					// https://html.spec.whatwg.org/#strip-and-collapse-whitespace
					stripAndCollapse( jQuery.text( elem ) );
			}
		},
		select: {
			get: function( elem ) {
				var value, option, i,
					options = elem.options,
					index = elem.selectedIndex,
					one = elem.type === "select-one",
					values = one ? null : [],
					max = one ? index + 1 : options.length;

				if ( index < 0 ) {
					i = max;

				} else {
					i = one ? index : 0;
				}

				// Loop through all the selected options
				for ( ; i < max; i++ ) {
					option = options[ i ];

					// Support: IE <=9 only
					// IE8-9 doesn't update selected after form reset (#2551)
					if ( ( option.selected || i === index ) &&

							// Don't return options that are disabled or in a disabled optgroup
							!option.disabled &&
							( !option.parentNode.disabled ||
								!nodeName( option.parentNode, "optgroup" ) ) ) {

						// Get the specific value for the option
						value = jQuery( option ).val();

						// We don't need an array for one selects
						if ( one ) {
							return value;
						}

						// Multi-Selects return an array
						values.push( value );
					}
				}

				return values;
			},

			set: function( elem, value ) {
				var optionSet, option,
					options = elem.options,
					values = jQuery.makeArray( value ),
					i = options.length;

				while ( i-- ) {
					option = options[ i ];

					/* eslint-disable no-cond-assign */

					if ( option.selected =
						jQuery.inArray( jQuery.valHooks.option.get( option ), values ) > -1
					) {
						optionSet = true;
					}

					/* eslint-enable no-cond-assign */
				}

				// Force browsers to behave consistently when non-matching value is set
				if ( !optionSet ) {
					elem.selectedIndex = -1;
				}
				return values;
			}
		}
	}
} );

// Radios and checkboxes getter/setter
jQuery.each( [ "radio", "checkbox" ], function() {
	jQuery.valHooks[ this ] = {
		set: function( elem, value ) {
			if ( Array.isArray( value ) ) {
				return ( elem.checked = jQuery.inArray( jQuery( elem ).val(), value ) > -1 );
			}
		}
	};
	if ( !support.checkOn ) {
		jQuery.valHooks[ this ].get = function( elem ) {
			return elem.getAttribute( "value" ) === null ? "on" : elem.value;
		};
	}
} );




// Return jQuery for attributes-only inclusion


support.focusin = "onfocusin" in window;


var rfocusMorph = /^(?:focusinfocus|focusoutblur)$/,
	stopPropagationCallback = function( e ) {
		e.stopPropagation();
	};

jQuery.extend( jQuery.event, {

	trigger: function( event, data, elem, onlyHandlers ) {

		var i, cur, tmp, bubbleType, ontype, handle, special, lastElement,
			eventPath = [ elem || document ],
			type = hasOwn.call( event, "type" ) ? event.type : event,
			namespaces = hasOwn.call( event, "namespace" ) ? event.namespace.split( "." ) : [];

		cur = lastElement = tmp = elem = elem || document;

		// Don't do events on text and comment nodes
		if ( elem.nodeType === 3 || elem.nodeType === 8 ) {
			return;
		}

		// focus/blur morphs to focusin/out; ensure we're not firing them right now
		if ( rfocusMorph.test( type + jQuery.event.triggered ) ) {
			return;
		}

		if ( type.indexOf( "." ) > -1 ) {

			// Namespaced trigger; create a regexp to match event type in handle()
			namespaces = type.split( "." );
			type = namespaces.shift();
			namespaces.sort();
		}
		ontype = type.indexOf( ":" ) < 0 && "on" + type;

		// Caller can pass in a jQuery.Event object, Object, or just an event type string
		event = event[ jQuery.expando ] ?
			event :
			new jQuery.Event( type, typeof event === "object" && event );

		// Trigger bitmask: & 1 for native handlers; & 2 for jQuery (always true)
		event.isTrigger = onlyHandlers ? 2 : 3;
		event.namespace = namespaces.join( "." );
		event.rnamespace = event.namespace ?
			new RegExp( "(^|\\.)" + namespaces.join( "\\.(?:.*\\.|)" ) + "(\\.|$)" ) :
			null;

		// Clean up the event in case it is being reused
		event.result = undefined;
		if ( !event.target ) {
			event.target = elem;
		}

		// Clone any incoming data and prepend the event, creating the handler arg list
		data = data == null ?
			[ event ] :
			jQuery.makeArray( data, [ event ] );

		// Allow special events to draw outside the lines
		special = jQuery.event.special[ type ] || {};
		if ( !onlyHandlers && special.trigger && special.trigger.apply( elem, data ) === false ) {
			return;
		}

		// Determine event propagation path in advance, per W3C events spec (#9951)
		// Bubble up to document, then to window; watch for a global ownerDocument var (#9724)
		if ( !onlyHandlers && !special.noBubble && !isWindow( elem ) ) {

			bubbleType = special.delegateType || type;
			if ( !rfocusMorph.test( bubbleType + type ) ) {
				cur = cur.parentNode;
			}
			for ( ; cur; cur = cur.parentNode ) {
				eventPath.push( cur );
				tmp = cur;
			}

			// Only add window if we got to document (e.g., not plain obj or detached DOM)
			if ( tmp === ( elem.ownerDocument || document ) ) {
				eventPath.push( tmp.defaultView || tmp.parentWindow || window );
			}
		}

		// Fire handlers on the event path
		i = 0;
		while ( ( cur = eventPath[ i++ ] ) && !event.isPropagationStopped() ) {
			lastElement = cur;
			event.type = i > 1 ?
				bubbleType :
				special.bindType || type;

			// jQuery handler
			handle = (
					dataPriv.get( cur, "events" ) || Object.create( null )
				)[ event.type ] &&
				dataPriv.get( cur, "handle" );
			if ( handle ) {
				handle.apply( cur, data );
			}

			// Native handler
			handle = ontype && cur[ ontype ];
			if ( handle && handle.apply && acceptData( cur ) ) {
				event.result = handle.apply( cur, data );
				if ( event.result === false ) {
					event.preventDefault();
				}
			}
		}
		event.type = type;

		// If nobody prevented the default action, do it now
		if ( !onlyHandlers && !event.isDefaultPrevented() ) {

			if ( ( !special._default ||
				special._default.apply( eventPath.pop(), data ) === false ) &&
				acceptData( elem ) ) {

				// Call a native DOM method on the target with the same name as the event.
				// Don't do default actions on window, that's where global variables be (#6170)
				if ( ontype && isFunction( elem[ type ] ) && !isWindow( elem ) ) {

					// Don't re-trigger an onFOO event when we call its FOO() method
					tmp = elem[ ontype ];

					if ( tmp ) {
						elem[ ontype ] = null;
					}

					// Prevent re-triggering of the same event, since we already bubbled it above
					jQuery.event.triggered = type;

					if ( event.isPropagationStopped() ) {
						lastElement.addEventListener( type, stopPropagationCallback );
					}

					elem[ type ]();

					if ( event.isPropagationStopped() ) {
						lastElement.removeEventListener( type, stopPropagationCallback );
					}

					jQuery.event.triggered = undefined;

					if ( tmp ) {
						elem[ ontype ] = tmp;
					}
				}
			}
		}

		return event.result;
	},

	// Piggyback on a donor event to simulate a different one
	// Used only for `focus(in | out)` events
	simulate: function( type, elem, event ) {
		var e = jQuery.extend(
			new jQuery.Event(),
			event,
			{
				type: type,
				isSimulated: true
			}
		);

		jQuery.event.trigger( e, null, elem );
	}

} );

jQuery.fn.extend( {

	trigger: function( type, data ) {
		return this.each( function() {
			jQuery.event.trigger( type, data, this );
		} );
	},
	triggerHandler: function( type, data ) {
		var elem = this[ 0 ];
		if ( elem ) {
			return jQuery.event.trigger( type, data, elem, true );
		}
	}
} );


// Support: Firefox <=44
// Firefox doesn't have focus(in | out) events
// Related ticket - https://bugzilla.mozilla.org/show_bug.cgi?id=687787
//
// Support: Chrome <=48 - 49, Safari <=9.0 - 9.1
// focus(in | out) events fire after focus & blur events,
// which is spec violation - http://www.w3.org/TR/DOM-Level-3-Events/#events-focusevent-event-order
// Related ticket - https://bugs.chromium.org/p/chromium/issues/detail?id=449857
if ( !support.focusin ) {
	jQuery.each( { focus: "focusin", blur: "focusout" }, function( orig, fix ) {

		// Attach a single capturing handler on the document while someone wants focusin/focusout
		var handler = function( event ) {
			jQuery.event.simulate( fix, event.target, jQuery.event.fix( event ) );
		};

		jQuery.event.special[ fix ] = {
			setup: function() {

				// Handle: regular nodes (via `this.ownerDocument`), window
				// (via `this.document`) & document (via `this`).
				var doc = this.ownerDocument || this.document || this,
					attaches = dataPriv.access( doc, fix );

				if ( !attaches ) {
					doc.addEventListener( orig, handler, true );
				}
				dataPriv.access( doc, fix, ( attaches || 0 ) + 1 );
			},
			teardown: function() {
				var doc = this.ownerDocument || this.document || this,
					attaches = dataPriv.access( doc, fix ) - 1;

				if ( !attaches ) {
					doc.removeEventListener( orig, handler, true );
					dataPriv.remove( doc, fix );

				} else {
					dataPriv.access( doc, fix, attaches );
				}
			}
		};
	} );
}
var location = window.location;

var nonce = { guid: Date.now() };

var rquery = ( /\?/ );



// Cross-browser xml parsing
jQuery.parseXML = function( data ) {
	var xml;
	if ( !data || typeof data !== "string" ) {
		return null;
	}

	// Support: IE 9 - 11 only
	// IE throws on parseFromString with invalid input.
	try {
		xml = ( new window.DOMParser() ).parseFromString( data, "text/xml" );
	} catch ( e ) {
		xml = undefined;
	}

	if ( !xml || xml.getElementsByTagName( "parsererror" ).length ) {
		jQuery.error( "Invalid XML: " + data );
	}
	return xml;
};


var
	rbracket = /\[\]$/,
	rCRLF = /\r?\n/g,
	rsubmitterTypes = /^(?:submit|button|image|reset|file)$/i,
	rsubmittable = /^(?:input|select|textarea|keygen)/i;

function buildParams( prefix, obj, traditional, add ) {
	var name;

	if ( Array.isArray( obj ) ) {

		// Serialize array item.
		jQuery.each( obj, function( i, v ) {
			if ( traditional || rbracket.test( prefix ) ) {

				// Treat each array item as a scalar.
				add( prefix, v );

			} else {

				// Item is non-scalar (array or object), encode its numeric index.
				buildParams(
					prefix + "[" + ( typeof v === "object" && v != null ? i : "" ) + "]",
					v,
					traditional,
					add
				);
			}
		} );

	} else if ( !traditional && toType( obj ) === "object" ) {

		// Serialize object item.
		for ( name in obj ) {
			buildParams( prefix + "[" + name + "]", obj[ name ], traditional, add );
		}

	} else {

		// Serialize scalar item.
		add( prefix, obj );
	}
}

// Serialize an array of form elements or a set of
// key/values into a query string
jQuery.param = function( a, traditional ) {
	var prefix,
		s = [],
		add = function( key, valueOrFunction ) {

			// If value is a function, invoke it and use its return value
			var value = isFunction( valueOrFunction ) ?
				valueOrFunction() :
				valueOrFunction;

			s[ s.length ] = encodeURIComponent( key ) + "=" +
				encodeURIComponent( value == null ? "" : value );
		};

	if ( a == null ) {
		return "";
	}

	// If an array was passed in, assume that it is an array of form elements.
	if ( Array.isArray( a ) || ( a.jquery && !jQuery.isPlainObject( a ) ) ) {

		// Serialize the form elements
		jQuery.each( a, function() {
			add( this.name, this.value );
		} );

	} else {

		// If traditional, encode the "old" way (the way 1.3.2 or older
		// did it), otherwise encode params recursively.
		for ( prefix in a ) {
			buildParams( prefix, a[ prefix ], traditional, add );
		}
	}

	// Return the resulting serialization
	return s.join( "&" );
};

jQuery.fn.extend( {
	serialize: function() {
		return jQuery.param( this.serializeArray() );
	},
	serializeArray: function() {
		return this.map( function() {

			// Can add propHook for "elements" to filter or add form elements
			var elements = jQuery.prop( this, "elements" );
			return elements ? jQuery.makeArray( elements ) : this;
		} )
		.filter( function() {
			var type = this.type;

			// Use .is( ":disabled" ) so that fieldset[disabled] works
			return this.name && !jQuery( this ).is( ":disabled" ) &&
				rsubmittable.test( this.nodeName ) && !rsubmitterTypes.test( type ) &&
				( this.checked || !rcheckableType.test( type ) );
		} )
		.map( function( _i, elem ) {
			var val = jQuery( this ).val();

			if ( val == null ) {
				return null;
			}

			if ( Array.isArray( val ) ) {
				return jQuery.map( val, function( val ) {
					return { name: elem.name, value: val.replace( rCRLF, "\r\n" ) };
				} );
			}

			return { name: elem.name, value: val.replace( rCRLF, "\r\n" ) };
		} ).get();
	}
} );


var
	r20 = /%20/g,
	rhash = /#.*$/,
	rantiCache = /([?&])_=[^&]*/,
	rheaders = /^(.*?):[ \t]*([^\r\n]*)$/mg,

	// #7653, #8125, #8152: local protocol detection
	rlocalProtocol = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
	rnoContent = /^(?:GET|HEAD)$/,
	rprotocol = /^\/\//,

	/* Prefilters
	 * 1) They are useful to introduce custom dataTypes (see ajax/jsonp.js for an example)
	 * 2) These are called:
	 *    - BEFORE asking for a transport
	 *    - AFTER param serialization (s.data is a string if s.processData is true)
	 * 3) key is the dataType
	 * 4) the catchall symbol "*" can be used
	 * 5) execution will start with transport dataType and THEN continue down to "*" if needed
	 */
	prefilters = {},

	/* Transports bindings
	 * 1) key is the dataType
	 * 2) the catchall symbol "*" can be used
	 * 3) selection will start with transport dataType and THEN go to "*" if needed
	 */
	transports = {},

	// Avoid comment-prolog char sequence (#10098); must appease lint and evade compression
	allTypes = "*/".concat( "*" ),

	// Anchor tag for parsing the document origin
	originAnchor = document.createElement( "a" );
	originAnchor.href = location.href;

// Base "constructor" for jQuery.ajaxPrefilter and jQuery.ajaxTransport
function addToPrefiltersOrTransports( structure ) {

	// dataTypeExpression is optional and defaults to "*"
	return function( dataTypeExpression, func ) {

		if ( typeof dataTypeExpression !== "string" ) {
			func = dataTypeExpression;
			dataTypeExpression = "*";
		}

		var dataType,
			i = 0,
			dataTypes = dataTypeExpression.toLowerCase().match( rnothtmlwhite ) || [];

		if ( isFunction( func ) ) {

			// For each dataType in the dataTypeExpression
			while ( ( dataType = dataTypes[ i++ ] ) ) {

				// Prepend if requested
				if ( dataType[ 0 ] === "+" ) {
					dataType = dataType.slice( 1 ) || "*";
					( structure[ dataType ] = structure[ dataType ] || [] ).unshift( func );

				// Otherwise append
				} else {
					( structure[ dataType ] = structure[ dataType ] || [] ).push( func );
				}
			}
		}
	};
}

// Base inspection function for prefilters and transports
function inspectPrefiltersOrTransports( structure, options, originalOptions, jqXHR ) {

	var inspected = {},
		seekingTransport = ( structure === transports );

	function inspect( dataType ) {
		var selected;
		inspected[ dataType ] = true;
		jQuery.each( structure[ dataType ] || [], function( _, prefilterOrFactory ) {
			var dataTypeOrTransport = prefilterOrFactory( options, originalOptions, jqXHR );
			if ( typeof dataTypeOrTransport === "string" &&
				!seekingTransport && !inspected[ dataTypeOrTransport ] ) {

				options.dataTypes.unshift( dataTypeOrTransport );
				inspect( dataTypeOrTransport );
				return false;
			} else if ( seekingTransport ) {
				return !( selected = dataTypeOrTransport );
			}
		} );
		return selected;
	}

	return inspect( options.dataTypes[ 0 ] ) || !inspected[ "*" ] && inspect( "*" );
}

// A special extend for ajax options
// that takes "flat" options (not to be deep extended)
// Fixes #9887
function ajaxExtend( target, src ) {
	var key, deep,
		flatOptions = jQuery.ajaxSettings.flatOptions || {};

	for ( key in src ) {
		if ( src[ key ] !== undefined ) {
			( flatOptions[ key ] ? target : ( deep || ( deep = {} ) ) )[ key ] = src[ key ];
		}
	}
	if ( deep ) {
		jQuery.extend( true, target, deep );
	}

	return target;
}

/* Handles responses to an ajax request:
 * - finds the right dataType (mediates between content-type and expected dataType)
 * - returns the corresponding response
 */
function ajaxHandleResponses( s, jqXHR, responses ) {

	var ct, type, finalDataType, firstDataType,
		contents = s.contents,
		dataTypes = s.dataTypes;

	// Remove auto dataType and get content-type in the process
	while ( dataTypes[ 0 ] === "*" ) {
		dataTypes.shift();
		if ( ct === undefined ) {
			ct = s.mimeType || jqXHR.getResponseHeader( "Content-Type" );
		}
	}

	// Check if we're dealing with a known content-type
	if ( ct ) {
		for ( type in contents ) {
			if ( contents[ type ] && contents[ type ].test( ct ) ) {
				dataTypes.unshift( type );
				break;
			}
		}
	}

	// Check to see if we have a response for the expected dataType
	if ( dataTypes[ 0 ] in responses ) {
		finalDataType = dataTypes[ 0 ];
	} else {

		// Try convertible dataTypes
		for ( type in responses ) {
			if ( !dataTypes[ 0 ] || s.converters[ type + " " + dataTypes[ 0 ] ] ) {
				finalDataType = type;
				break;
			}
			if ( !firstDataType ) {
				firstDataType = type;
			}
		}

		// Or just use first one
		finalDataType = finalDataType || firstDataType;
	}

	// If we found a dataType
	// We add the dataType to the list if needed
	// and return the corresponding response
	if ( finalDataType ) {
		if ( finalDataType !== dataTypes[ 0 ] ) {
			dataTypes.unshift( finalDataType );
		}
		return responses[ finalDataType ];
	}
}

/* Chain conversions given the request and the original response
 * Also sets the responseXXX fields on the jqXHR instance
 */
function ajaxConvert( s, response, jqXHR, isSuccess ) {
	var conv2, current, conv, tmp, prev,
		converters = {},

		// Work with a copy of dataTypes in case we need to modify it for conversion
		dataTypes = s.dataTypes.slice();

	// Create converters map with lowercased keys
	if ( dataTypes[ 1 ] ) {
		for ( conv in s.converters ) {
			converters[ conv.toLowerCase() ] = s.converters[ conv ];
		}
	}

	current = dataTypes.shift();

	// Convert to each sequential dataType
	while ( current ) {

		if ( s.responseFields[ current ] ) {
			jqXHR[ s.responseFields[ current ] ] = response;
		}

		// Apply the dataFilter if provided
		if ( !prev && isSuccess && s.dataFilter ) {
			response = s.dataFilter( response, s.dataType );
		}

		prev = current;
		current = dataTypes.shift();

		if ( current ) {

			// There's only work to do if current dataType is non-auto
			if ( current === "*" ) {

				current = prev;

			// Convert response if prev dataType is non-auto and differs from current
			} else if ( prev !== "*" && prev !== current ) {

				// Seek a direct converter
				conv = converters[ prev + " " + current ] || converters[ "* " + current ];

				// If none found, seek a pair
				if ( !conv ) {
					for ( conv2 in converters ) {

						// If conv2 outputs current
						tmp = conv2.split( " " );
						if ( tmp[ 1 ] === current ) {

							// If prev can be converted to accepted input
							conv = converters[ prev + " " + tmp[ 0 ] ] ||
								converters[ "* " + tmp[ 0 ] ];
							if ( conv ) {

								// Condense equivalence converters
								if ( conv === true ) {
									conv = converters[ conv2 ];

								// Otherwise, insert the intermediate dataType
								} else if ( converters[ conv2 ] !== true ) {
									current = tmp[ 0 ];
									dataTypes.unshift( tmp[ 1 ] );
								}
								break;
							}
						}
					}
				}

				// Apply converter (if not an equivalence)
				if ( conv !== true ) {

					// Unless errors are allowed to bubble, catch and return them
					if ( conv && s.throws ) {
						response = conv( response );
					} else {
						try {
							response = conv( response );
						} catch ( e ) {
							return {
								state: "parsererror",
								error: conv ? e : "No conversion from " + prev + " to " + current
							};
						}
					}
				}
			}
		}
	}

	return { state: "success", data: response };
}

jQuery.extend( {

	// Counter for holding the number of active queries
	active: 0,

	// Last-Modified header cache for next request
	lastModified: {},
	etag: {},

	ajaxSettings: {
		url: location.href,
		type: "GET",
		isLocal: rlocalProtocol.test( location.protocol ),
		global: true,
		processData: true,
		async: true,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",

		/*
		timeout: 0,
		data: null,
		dataType: null,
		username: null,
		password: null,
		cache: null,
		throws: false,
		traditional: false,
		headers: {},
		*/

		accepts: {
			"*": allTypes,
			text: "text/plain",
			html: "text/html",
			xml: "application/xml, text/xml",
			json: "application/json, text/javascript"
		},

		contents: {
			xml: /\bxml\b/,
			html: /\bhtml/,
			json: /\bjson\b/
		},

		responseFields: {
			xml: "responseXML",
			text: "responseText",
			json: "responseJSON"
		},

		// Data converters
		// Keys separate source (or catchall "*") and destination types with a single space
		converters: {

			// Convert anything to text
			"* text": String,

			// Text to html (true = no transformation)
			"text html": true,

			// Evaluate text as a json expression
			"text json": JSON.parse,

			// Parse text as xml
			"text xml": jQuery.parseXML
		},

		// For options that shouldn't be deep extended:
		// you can add your own custom options here if
		// and when you create one that shouldn't be
		// deep extended (see ajaxExtend)
		flatOptions: {
			url: true,
			context: true
		}
	},

	// Creates a full fledged settings object into target
	// with both ajaxSettings and settings fields.
	// If target is omitted, writes into ajaxSettings.
	ajaxSetup: function( target, settings ) {
		return settings ?

			// Building a settings object
			ajaxExtend( ajaxExtend( target, jQuery.ajaxSettings ), settings ) :

			// Extending ajaxSettings
			ajaxExtend( jQuery.ajaxSettings, target );
	},

	ajaxPrefilter: addToPrefiltersOrTransports( prefilters ),
	ajaxTransport: addToPrefiltersOrTransports( transports ),

	// Main method
	ajax: function( url, options ) {

		// If url is an object, simulate pre-1.5 signature
		if ( typeof url === "object" ) {
			options = url;
			url = undefined;
		}

		// Force options to be an object
		options = options || {};

		var transport,

			// URL without anti-cache param
			cacheURL,

			// Response headers
			responseHeadersString,
			responseHeaders,

			// timeout handle
			timeoutTimer,

			// Url cleanup var
			urlAnchor,

			// Request state (becomes false upon send and true upon completion)
			completed,

			// To know if global events are to be dispatched
			fireGlobals,

			// Loop variable
			i,

			// uncached part of the url
			uncached,

			// Create the final options object
			s = jQuery.ajaxSetup( {}, options ),

			// Callbacks context
			callbackContext = s.context || s,

			// Context for global events is callbackContext if it is a DOM node or jQuery collection
			globalEventContext = s.context &&
				( callbackContext.nodeType || callbackContext.jquery ) ?
					jQuery( callbackContext ) :
					jQuery.event,

			// Deferreds
			deferred = jQuery.Deferred(),
			completeDeferred = jQuery.Callbacks( "once memory" ),

			// Status-dependent callbacks
			statusCode = s.statusCode || {},

			// Headers (they are sent all at once)
			requestHeaders = {},
			requestHeadersNames = {},

			// Default abort message
			strAbort = "canceled",

			// Fake xhr
			jqXHR = {
				readyState: 0,

				// Builds headers hashtable if needed
				getResponseHeader: function( key ) {
					var match;
					if ( completed ) {
						if ( !responseHeaders ) {
							responseHeaders = {};
							while ( ( match = rheaders.exec( responseHeadersString ) ) ) {
								responseHeaders[ match[ 1 ].toLowerCase() + " " ] =
									( responseHeaders[ match[ 1 ].toLowerCase() + " " ] || [] )
										.concat( match[ 2 ] );
							}
						}
						match = responseHeaders[ key.toLowerCase() + " " ];
					}
					return match == null ? null : match.join( ", " );
				},

				// Raw string
				getAllResponseHeaders: function() {
					return completed ? responseHeadersString : null;
				},

				// Caches the header
				setRequestHeader: function( name, value ) {
					if ( completed == null ) {
						name = requestHeadersNames[ name.toLowerCase() ] =
							requestHeadersNames[ name.toLowerCase() ] || name;
						requestHeaders[ name ] = value;
					}
					return this;
				},

				// Overrides response content-type header
				overrideMimeType: function( type ) {
					if ( completed == null ) {
						s.mimeType = type;
					}
					return this;
				},

				// Status-dependent callbacks
				statusCode: function( map ) {
					var code;
					if ( map ) {
						if ( completed ) {

							// Execute the appropriate callbacks
							jqXHR.always( map[ jqXHR.status ] );
						} else {

							// Lazy-add the new callbacks in a way that preserves old ones
							for ( code in map ) {
								statusCode[ code ] = [ statusCode[ code ], map[ code ] ];
							}
						}
					}
					return this;
				},

				// Cancel the request
				abort: function( statusText ) {
					var finalText = statusText || strAbort;
					if ( transport ) {
						transport.abort( finalText );
					}
					done( 0, finalText );
					return this;
				}
			};

		// Attach deferreds
		deferred.promise( jqXHR );

		// Add protocol if not provided (prefilters might expect it)
		// Handle falsy url in the settings object (#10093: consistency with old signature)
		// We also use the url parameter if available
		s.url = ( ( url || s.url || location.href ) + "" )
			.replace( rprotocol, location.protocol + "//" );

		// Alias method option to type as per ticket #12004
		s.type = options.method || options.type || s.method || s.type;

		// Extract dataTypes list
		s.dataTypes = ( s.dataType || "*" ).toLowerCase().match( rnothtmlwhite ) || [ "" ];

		// A cross-domain request is in order when the origin doesn't match the current origin.
		if ( s.crossDomain == null ) {
			urlAnchor = document.createElement( "a" );

			// Support: IE <=8 - 11, Edge 12 - 15
			// IE throws exception on accessing the href property if url is malformed,
			// e.g. http://example.com:80x/
			try {
				urlAnchor.href = s.url;

				// Support: IE <=8 - 11 only
				// Anchor's host property isn't correctly set when s.url is relative
				urlAnchor.href = urlAnchor.href;
				s.crossDomain = originAnchor.protocol + "//" + originAnchor.host !==
					urlAnchor.protocol + "//" + urlAnchor.host;
			} catch ( e ) {

				// If there is an error parsing the URL, assume it is crossDomain,
				// it can be rejected by the transport if it is invalid
				s.crossDomain = true;
			}
		}

		// Convert data if not already a string
		if ( s.data && s.processData && typeof s.data !== "string" ) {
			s.data = jQuery.param( s.data, s.traditional );
		}

		// Apply prefilters
		inspectPrefiltersOrTransports( prefilters, s, options, jqXHR );

		// If request was aborted inside a prefilter, stop there
		if ( completed ) {
			return jqXHR;
		}

		// We can fire global events as of now if asked to
		// Don't fire events if jQuery.event is undefined in an AMD-usage scenario (#15118)
		fireGlobals = jQuery.event && s.global;

		// Watch for a new set of requests
		if ( fireGlobals && jQuery.active++ === 0 ) {
			jQuery.event.trigger( "ajaxStart" );
		}

		// Uppercase the type
		s.type = s.type.toUpperCase();

		// Determine if request has content
		s.hasContent = !rnoContent.test( s.type );

		// Save the URL in case we're toying with the If-Modified-Since
		// and/or If-None-Match header later on
		// Remove hash to simplify url manipulation
		cacheURL = s.url.replace( rhash, "" );

		// More options handling for requests with no content
		if ( !s.hasContent ) {

			// Remember the hash so we can put it back
			uncached = s.url.slice( cacheURL.length );

			// If data is available and should be processed, append data to url
			if ( s.data && ( s.processData || typeof s.data === "string" ) ) {
				cacheURL += ( rquery.test( cacheURL ) ? "&" : "?" ) + s.data;

				// #9682: remove data so that it's not used in an eventual retry
				delete s.data;
			}

			// Add or update anti-cache param if needed
			if ( s.cache === false ) {
				cacheURL = cacheURL.replace( rantiCache, "$1" );
				uncached = ( rquery.test( cacheURL ) ? "&" : "?" ) + "_=" + ( nonce.guid++ ) +
					uncached;
			}

			// Put hash and anti-cache on the URL that will be requested (gh-1732)
			s.url = cacheURL + uncached;

		// Change '%20' to '+' if this is encoded form body content (gh-2658)
		} else if ( s.data && s.processData &&
			( s.contentType || "" ).indexOf( "application/x-www-form-urlencoded" ) === 0 ) {
			s.data = s.data.replace( r20, "+" );
		}

		// Set the If-Modified-Since and/or If-None-Match header, if in ifModified mode.
		if ( s.ifModified ) {
			if ( jQuery.lastModified[ cacheURL ] ) {
				jqXHR.setRequestHeader( "If-Modified-Since", jQuery.lastModified[ cacheURL ] );
			}
			if ( jQuery.etag[ cacheURL ] ) {
				jqXHR.setRequestHeader( "If-None-Match", jQuery.etag[ cacheURL ] );
			}
		}

		// Set the correct header, if data is being sent
		if ( s.data && s.hasContent && s.contentType !== false || options.contentType ) {
			jqXHR.setRequestHeader( "Content-Type", s.contentType );
		}

		// Set the Accepts header for the server, depending on the dataType
		jqXHR.setRequestHeader(
			"Accept",
			s.dataTypes[ 0 ] && s.accepts[ s.dataTypes[ 0 ] ] ?
				s.accepts[ s.dataTypes[ 0 ] ] +
					( s.dataTypes[ 0 ] !== "*" ? ", " + allTypes + "; q=0.01" : "" ) :
				s.accepts[ "*" ]
		);

		// Check for headers option
		for ( i in s.headers ) {
			jqXHR.setRequestHeader( i, s.headers[ i ] );
		}

		// Allow custom headers/mimetypes and early abort
		if ( s.beforeSend &&
			( s.beforeSend.call( callbackContext, jqXHR, s ) === false || completed ) ) {

			// Abort if not done already and return
			return jqXHR.abort();
		}

		// Aborting is no longer a cancellation
		strAbort = "abort";

		// Install callbacks on deferreds
		completeDeferred.add( s.complete );
		jqXHR.done( s.success );
		jqXHR.fail( s.error );

		// Get transport
		transport = inspectPrefiltersOrTransports( transports, s, options, jqXHR );

		// If no transport, we auto-abort
		if ( !transport ) {
			done( -1, "No Transport" );
		} else {
			jqXHR.readyState = 1;

			// Send global event
			if ( fireGlobals ) {
				globalEventContext.trigger( "ajaxSend", [ jqXHR, s ] );
			}

			// If request was aborted inside ajaxSend, stop there
			if ( completed ) {
				return jqXHR;
			}

			// Timeout
			if ( s.async && s.timeout > 0 ) {
				timeoutTimer = window.setTimeout( function() {
					jqXHR.abort( "timeout" );
				}, s.timeout );
			}

			try {
				completed = false;
				transport.send( requestHeaders, done );
			} catch ( e ) {

				// Rethrow post-completion exceptions
				if ( completed ) {
					throw e;
				}

				// Propagate others as results
				done( -1, e );
			}
		}

		// Callback for when everything is done
		function done( status, nativeStatusText, responses, headers ) {
			var isSuccess, success, error, response, modified,
				statusText = nativeStatusText;

			// Ignore repeat invocations
			if ( completed ) {
				return;
			}

			completed = true;

			// Clear timeout if it exists
			if ( timeoutTimer ) {
				window.clearTimeout( timeoutTimer );
			}

			// Dereference transport for early garbage collection
			// (no matter how long the jqXHR object will be used)
			transport = undefined;

			// Cache response headers
			responseHeadersString = headers || "";

			// Set readyState
			jqXHR.readyState = status > 0 ? 4 : 0;

			// Determine if successful
			isSuccess = status >= 200 && status < 300 || status === 304;

			// Get response data
			if ( responses ) {
				response = ajaxHandleResponses( s, jqXHR, responses );
			}

			// Use a noop converter for missing script
			if ( !isSuccess && jQuery.inArray( "script", s.dataTypes ) > -1 ) {
				s.converters[ "text script" ] = function() {};
			}

			// Convert no matter what (that way responseXXX fields are always set)
			response = ajaxConvert( s, response, jqXHR, isSuccess );

			// If successful, handle type chaining
			if ( isSuccess ) {

				// Set the If-Modified-Since and/or If-None-Match header, if in ifModified mode.
				if ( s.ifModified ) {
					modified = jqXHR.getResponseHeader( "Last-Modified" );
					if ( modified ) {
						jQuery.lastModified[ cacheURL ] = modified;
					}
					modified = jqXHR.getResponseHeader( "etag" );
					if ( modified ) {
						jQuery.etag[ cacheURL ] = modified;
					}
				}

				// if no content
				if ( status === 204 || s.type === "HEAD" ) {
					statusText = "nocontent";

				// if not modified
				} else if ( status === 304 ) {
					statusText = "notmodified";

				// If we have data, let's convert it
				} else {
					statusText = response.state;
					success = response.data;
					error = response.error;
					isSuccess = !error;
				}
			} else {

				// Extract error from statusText and normalize for non-aborts
				error = statusText;
				if ( status || !statusText ) {
					statusText = "error";
					if ( status < 0 ) {
						status = 0;
					}
				}
			}

			// Set data for the fake xhr object
			jqXHR.status = status;
			jqXHR.statusText = ( nativeStatusText || statusText ) + "";

			// Success/Error
			if ( isSuccess ) {
				deferred.resolveWith( callbackContext, [ success, statusText, jqXHR ] );
			} else {
				deferred.rejectWith( callbackContext, [ jqXHR, statusText, error ] );
			}

			// Status-dependent callbacks
			jqXHR.statusCode( statusCode );
			statusCode = undefined;

			if ( fireGlobals ) {
				globalEventContext.trigger( isSuccess ? "ajaxSuccess" : "ajaxError",
					[ jqXHR, s, isSuccess ? success : error ] );
			}

			// Complete
			completeDeferred.fireWith( callbackContext, [ jqXHR, statusText ] );

			if ( fireGlobals ) {
				globalEventContext.trigger( "ajaxComplete", [ jqXHR, s ] );

				// Handle the global AJAX counter
				if ( !( --jQuery.active ) ) {
					jQuery.event.trigger( "ajaxStop" );
				}
			}
		}

		return jqXHR;
	},

	getJSON: function( url, data, callback ) {
		return jQuery.get( url, data, callback, "json" );
	},

	getScript: function( url, callback ) {
		return jQuery.get( url, undefined, callback, "script" );
	}
} );

jQuery.each( [ "get", "post" ], function( _i, method ) {
	jQuery[ method ] = function( url, data, callback, type ) {

		// Shift arguments if data argument was omitted
		if ( isFunction( data ) ) {
			type = type || callback;
			callback = data;
			data = undefined;
		}

		// The url can be an options object (which then must have .url)
		return jQuery.ajax( jQuery.extend( {
			url: url,
			type: method,
			dataType: type,
			data: data,
			success: callback
		}, jQuery.isPlainObject( url ) && url ) );
	};
} );

jQuery.ajaxPrefilter( function( s ) {
	var i;
	for ( i in s.headers ) {
		if ( i.toLowerCase() === "content-type" ) {
			s.contentType = s.headers[ i ] || "";
		}
	}
} );


jQuery._evalUrl = function( url, options, doc ) {
	return jQuery.ajax( {
		url: url,

		// Make this explicit, since user can override this through ajaxSetup (#11264)
		type: "GET",
		dataType: "script",
		cache: true,
		async: false,
		global: false,

		// Only evaluate the response if it is successful (gh-4126)
		// dataFilter is not invoked for failure responses, so using it instead
		// of the default converter is kludgy but it works.
		converters: {
			"text script": function() {}
		},
		dataFilter: function( response ) {
			jQuery.globalEval( response, options, doc );
		}
	} );
};


jQuery.fn.extend( {
	wrapAll: function( html ) {
		var wrap;

		if ( this[ 0 ] ) {
			if ( isFunction( html ) ) {
				html = html.call( this[ 0 ] );
			}

			// The elements to wrap the target around
			wrap = jQuery( html, this[ 0 ].ownerDocument ).eq( 0 ).clone( true );

			if ( this[ 0 ].parentNode ) {
				wrap.insertBefore( this[ 0 ] );
			}

			wrap.map( function() {
				var elem = this;

				while ( elem.firstElementChild ) {
					elem = elem.firstElementChild;
				}

				return elem;
			} ).append( this );
		}

		return this;
	},

	wrapInner: function( html ) {
		if ( isFunction( html ) ) {
			return this.each( function( i ) {
				jQuery( this ).wrapInner( html.call( this, i ) );
			} );
		}

		return this.each( function() {
			var self = jQuery( this ),
				contents = self.contents();

			if ( contents.length ) {
				contents.wrapAll( html );

			} else {
				self.append( html );
			}
		} );
	},

	wrap: function( html ) {
		var htmlIsFunction = isFunction( html );

		return this.each( function( i ) {
			jQuery( this ).wrapAll( htmlIsFunction ? html.call( this, i ) : html );
		} );
	},

	unwrap: function( selector ) {
		this.parent( selector ).not( "body" ).each( function() {
			jQuery( this ).replaceWith( this.childNodes );
		} );
		return this;
	}
} );


jQuery.expr.pseudos.hidden = function( elem ) {
	return !jQuery.expr.pseudos.visible( elem );
};
jQuery.expr.pseudos.visible = function( elem ) {
	return !!( elem.offsetWidth || elem.offsetHeight || elem.getClientRects().length );
};




jQuery.ajaxSettings.xhr = function() {
	try {
		return new window.XMLHttpRequest();
	} catch ( e ) {}
};

var xhrSuccessStatus = {

		// File protocol always yields status code 0, assume 200
		0: 200,

		// Support: IE <=9 only
		// #1450: sometimes IE returns 1223 when it should be 204
		1223: 204
	},
	xhrSupported = jQuery.ajaxSettings.xhr();

support.cors = !!xhrSupported && ( "withCredentials" in xhrSupported );
support.ajax = xhrSupported = !!xhrSupported;

jQuery.ajaxTransport( function( options ) {
	var callback, errorCallback;

	// Cross domain only allowed if supported through XMLHttpRequest
	if ( support.cors || xhrSupported && !options.crossDomain ) {
		return {
			send: function( headers, complete ) {
				var i,
					xhr = options.xhr();

				xhr.open(
					options.type,
					options.url,
					options.async,
					options.username,
					options.password
				);

				// Apply custom fields if provided
				if ( options.xhrFields ) {
					for ( i in options.xhrFields ) {
						xhr[ i ] = options.xhrFields[ i ];
					}
				}

				// Override mime type if needed
				if ( options.mimeType && xhr.overrideMimeType ) {
					xhr.overrideMimeType( options.mimeType );
				}

				// X-Requested-With header
				// For cross-domain requests, seeing as conditions for a preflight are
				// akin to a jigsaw puzzle, we simply never set it to be sure.
				// (it can always be set on a per-request basis or even using ajaxSetup)
				// For same-domain requests, won't change header if already provided.
				if ( !options.crossDomain && !headers[ "X-Requested-With" ] ) {
					headers[ "X-Requested-With" ] = "XMLHttpRequest";
				}

				// Set headers
				for ( i in headers ) {
					xhr.setRequestHeader( i, headers[ i ] );
				}

				// Callback
				callback = function( type ) {
					return function() {
						if ( callback ) {
							callback = errorCallback = xhr.onload =
								xhr.onerror = xhr.onabort = xhr.ontimeout =
									xhr.onreadystatechange = null;

							if ( type === "abort" ) {
								xhr.abort();
							} else if ( type === "error" ) {

								// Support: IE <=9 only
								// On a manual native abort, IE9 throws
								// errors on any property access that is not readyState
								if ( typeof xhr.status !== "number" ) {
									complete( 0, "error" );
								} else {
									complete(

										// File: protocol always yields status 0; see #8605, #14207
										xhr.status,
										xhr.statusText
									);
								}
							} else {
								complete(
									xhrSuccessStatus[ xhr.status ] || xhr.status,
									xhr.statusText,

									// Support: IE <=9 only
									// IE9 has no XHR2 but throws on binary (trac-11426)
									// For XHR2 non-text, let the caller handle it (gh-2498)
									( xhr.responseType || "text" ) !== "text"  ||
									typeof xhr.responseText !== "string" ?
										{ binary: xhr.response } :
										{ text: xhr.responseText },
									xhr.getAllResponseHeaders()
								);
							}
						}
					};
				};

				// Listen to events
				xhr.onload = callback();
				errorCallback = xhr.onerror = xhr.ontimeout = callback( "error" );

				// Support: IE 9 only
				// Use onreadystatechange to replace onabort
				// to handle uncaught aborts
				if ( xhr.onabort !== undefined ) {
					xhr.onabort = errorCallback;
				} else {
					xhr.onreadystatechange = function() {

						// Check readyState before timeout as it changes
						if ( xhr.readyState === 4 ) {

							// Allow onerror to be called first,
							// but that will not handle a native abort
							// Also, save errorCallback to a variable
							// as xhr.onerror cannot be accessed
							window.setTimeout( function() {
								if ( callback ) {
									errorCallback();
								}
							} );
						}
					};
				}

				// Create the abort callback
				callback = callback( "abort" );

				try {

					// Do send the request (this may raise an exception)
					xhr.send( options.hasContent && options.data || null );
				} catch ( e ) {

					// #14683: Only rethrow if this hasn't been notified as an error yet
					if ( callback ) {
						throw e;
					}
				}
			},

			abort: function() {
				if ( callback ) {
					callback();
				}
			}
		};
	}
} );




// Prevent auto-execution of scripts when no explicit dataType was provided (See gh-2432)
jQuery.ajaxPrefilter( function( s ) {
	if ( s.crossDomain ) {
		s.contents.script = false;
	}
} );

// Install script dataType
jQuery.ajaxSetup( {
	accepts: {
		script: "text/javascript, application/javascript, " +
			"application/ecmascript, application/x-ecmascript"
	},
	contents: {
		script: /\b(?:java|ecma)script\b/
	},
	converters: {
		"text script": function( text ) {
			jQuery.globalEval( text );
			return text;
		}
	}
} );

// Handle cache's special case and crossDomain
jQuery.ajaxPrefilter( "script", function( s ) {
	if ( s.cache === undefined ) {
		s.cache = false;
	}
	if ( s.crossDomain ) {
		s.type = "GET";
	}
} );

// Bind script tag hack transport
jQuery.ajaxTransport( "script", function( s ) {

	// This transport only deals with cross domain or forced-by-attrs requests
	if ( s.crossDomain || s.scriptAttrs ) {
		var script, callback;
		return {
			send: function( _, complete ) {
				script = jQuery( "<script>" )
					.attr( s.scriptAttrs || {} )
					.prop( { charset: s.scriptCharset, src: s.url } )
					.on( "load error", callback = function( evt ) {
						script.remove();
						callback = null;
						if ( evt ) {
							complete( evt.type === "error" ? 404 : 200, evt.type );
						}
					} );

				// Use native DOM manipulation to avoid our domManip AJAX trickery
				document.head.appendChild( script[ 0 ] );
			},
			abort: function() {
				if ( callback ) {
					callback();
				}
			}
		};
	}
} );




var oldCallbacks = [],
	rjsonp = /(=)\?(?=&|$)|\?\?/;

// Default jsonp settings
jQuery.ajaxSetup( {
	jsonp: "callback",
	jsonpCallback: function() {
		var callback = oldCallbacks.pop() || ( jQuery.expando + "_" + ( nonce.guid++ ) );
		this[ callback ] = true;
		return callback;
	}
} );

// Detect, normalize options and install callbacks for jsonp requests
jQuery.ajaxPrefilter( "json jsonp", function( s, originalSettings, jqXHR ) {

	var callbackName, overwritten, responseContainer,
		jsonProp = s.jsonp !== false && ( rjsonp.test( s.url ) ?
			"url" :
			typeof s.data === "string" &&
				( s.contentType || "" )
					.indexOf( "application/x-www-form-urlencoded" ) === 0 &&
				rjsonp.test( s.data ) && "data"
		);

	// Handle iff the expected data type is "jsonp" or we have a parameter to set
	if ( jsonProp || s.dataTypes[ 0 ] === "jsonp" ) {

		// Get callback name, remembering preexisting value associated with it
		callbackName = s.jsonpCallback = isFunction( s.jsonpCallback ) ?
			s.jsonpCallback() :
			s.jsonpCallback;

		// Insert callback into url or form data
		if ( jsonProp ) {
			s[ jsonProp ] = s[ jsonProp ].replace( rjsonp, "$1" + callbackName );
		} else if ( s.jsonp !== false ) {
			s.url += ( rquery.test( s.url ) ? "&" : "?" ) + s.jsonp + "=" + callbackName;
		}

		// Use data converter to retrieve json after script execution
		s.converters[ "script json" ] = function() {
			if ( !responseContainer ) {
				jQuery.error( callbackName + " was not called" );
			}
			return responseContainer[ 0 ];
		};

		// Force json dataType
		s.dataTypes[ 0 ] = "json";

		// Install callback
		overwritten = window[ callbackName ];
		window[ callbackName ] = function() {
			responseContainer = arguments;
		};

		// Clean-up function (fires after converters)
		jqXHR.always( function() {

			// If previous value didn't exist - remove it
			if ( overwritten === undefined ) {
				jQuery( window ).removeProp( callbackName );

			// Otherwise restore preexisting value
			} else {
				window[ callbackName ] = overwritten;
			}

			// Save back as free
			if ( s[ callbackName ] ) {

				// Make sure that re-using the options doesn't screw things around
				s.jsonpCallback = originalSettings.jsonpCallback;

				// Save the callback name for future use
				oldCallbacks.push( callbackName );
			}

			// Call if it was a function and we have a response
			if ( responseContainer && isFunction( overwritten ) ) {
				overwritten( responseContainer[ 0 ] );
			}

			responseContainer = overwritten = undefined;
		} );

		// Delegate to script
		return "script";
	}
} );




// Support: Safari 8 only
// In Safari 8 documents created via document.implementation.createHTMLDocument
// collapse sibling forms: the second one becomes a child of the first one.
// Because of that, this security measure has to be disabled in Safari 8.
// https://bugs.webkit.org/show_bug.cgi?id=137337
support.createHTMLDocument = ( function() {
	var body = document.implementation.createHTMLDocument( "" ).body;
	body.innerHTML = "<form></form><form></form>";
	return body.childNodes.length === 2;
} )();


// Argument "data" should be string of html
// context (optional): If specified, the fragment will be created in this context,
// defaults to document
// keepScripts (optional): If true, will include scripts passed in the html string
jQuery.parseHTML = function( data, context, keepScripts ) {
	if ( typeof data !== "string" ) {
		return [];
	}
	if ( typeof context === "boolean" ) {
		keepScripts = context;
		context = false;
	}

	var base, parsed, scripts;

	if ( !context ) {

		// Stop scripts or inline event handlers from being executed immediately
		// by using document.implementation
		if ( support.createHTMLDocument ) {
			context = document.implementation.createHTMLDocument( "" );

			// Set the base href for the created document
			// so any parsed elements with URLs
			// are based on the document's URL (gh-2965)
			base = context.createElement( "base" );
			base.href = document.location.href;
			context.head.appendChild( base );
		} else {
			context = document;
		}
	}

	parsed = rsingleTag.exec( data );
	scripts = !keepScripts && [];

	// Single tag
	if ( parsed ) {
		return [ context.createElement( parsed[ 1 ] ) ];
	}

	parsed = buildFragment( [ data ], context, scripts );

	if ( scripts && scripts.length ) {
		jQuery( scripts ).remove();
	}

	return jQuery.merge( [], parsed.childNodes );
};


/**
 * Load a url into a page
 */
jQuery.fn.load = function( url, params, callback ) {
	var selector, type, response,
		self = this,
		off = url.indexOf( " " );

	if ( off > -1 ) {
		selector = stripAndCollapse( url.slice( off ) );
		url = url.slice( 0, off );
	}

	// If it's a function
	if ( isFunction( params ) ) {

		// We assume that it's the callback
		callback = params;
		params = undefined;

	// Otherwise, build a param string
	} else if ( params && typeof params === "object" ) {
		type = "POST";
	}

	// If we have elements to modify, make the request
	if ( self.length > 0 ) {
		jQuery.ajax( {
			url: url,

			// If "type" variable is undefined, then "GET" method will be used.
			// Make value of this field explicit since
			// user can override it through ajaxSetup method
			type: type || "GET",
			dataType: "html",
			data: params
		} ).done( function( responseText ) {

			// Save response for use in complete callback
			response = arguments;

			self.html( selector ?

				// If a selector was specified, locate the right elements in a dummy div
				// Exclude scripts to avoid IE 'Permission Denied' errors
				jQuery( "<div>" ).append( jQuery.parseHTML( responseText ) ).find( selector ) :

				// Otherwise use the full result
				responseText );

		// If the request succeeds, this function gets "data", "status", "jqXHR"
		// but they are ignored because response was set above.
		// If it fails, this function gets "jqXHR", "status", "error"
		} ).always( callback && function( jqXHR, status ) {
			self.each( function() {
				callback.apply( this, response || [ jqXHR.responseText, status, jqXHR ] );
			} );
		} );
	}

	return this;
};




jQuery.expr.pseudos.animated = function( elem ) {
	return jQuery.grep( jQuery.timers, function( fn ) {
		return elem === fn.elem;
	} ).length;
};




jQuery.offset = {
	setOffset: function( elem, options, i ) {
		var curPosition, curLeft, curCSSTop, curTop, curOffset, curCSSLeft, calculatePosition,
			position = jQuery.css( elem, "position" ),
			curElem = jQuery( elem ),
			props = {};

		// Set position first, in-case top/left are set even on static elem
		if ( position === "static" ) {
			elem.style.position = "relative";
		}

		curOffset = curElem.offset();
		curCSSTop = jQuery.css( elem, "top" );
		curCSSLeft = jQuery.css( elem, "left" );
		calculatePosition = ( position === "absolute" || position === "fixed" ) &&
			( curCSSTop + curCSSLeft ).indexOf( "auto" ) > -1;

		// Need to be able to calculate position if either
		// top or left is auto and position is either absolute or fixed
		if ( calculatePosition ) {
			curPosition = curElem.position();
			curTop = curPosition.top;
			curLeft = curPosition.left;

		} else {
			curTop = parseFloat( curCSSTop ) || 0;
			curLeft = parseFloat( curCSSLeft ) || 0;
		}

		if ( isFunction( options ) ) {

			// Use jQuery.extend here to allow modification of coordinates argument (gh-1848)
			options = options.call( elem, i, jQuery.extend( {}, curOffset ) );
		}

		if ( options.top != null ) {
			props.top = ( options.top - curOffset.top ) + curTop;
		}
		if ( options.left != null ) {
			props.left = ( options.left - curOffset.left ) + curLeft;
		}

		if ( "using" in options ) {
			options.using.call( elem, props );

		} else {
			if ( typeof props.top === "number" ) {
				props.top += "px";
			}
			if ( typeof props.left === "number" ) {
				props.left += "px";
			}
			curElem.css( props );
		}
	}
};

jQuery.fn.extend( {

	// offset() relates an element's border box to the document origin
	offset: function( options ) {

		// Preserve chaining for setter
		if ( arguments.length ) {
			return options === undefined ?
				this :
				this.each( function( i ) {
					jQuery.offset.setOffset( this, options, i );
				} );
		}

		var rect, win,
			elem = this[ 0 ];

		if ( !elem ) {
			return;
		}

		// Return zeros for disconnected and hidden (display: none) elements (gh-2310)
		// Support: IE <=11 only
		// Running getBoundingClientRect on a
		// disconnected node in IE throws an error
		if ( !elem.getClientRects().length ) {
			return { top: 0, left: 0 };
		}

		// Get document-relative position by adding viewport scroll to viewport-relative gBCR
		rect = elem.getBoundingClientRect();
		win = elem.ownerDocument.defaultView;
		return {
			top: rect.top + win.pageYOffset,
			left: rect.left + win.pageXOffset
		};
	},

	// position() relates an element's margin box to its offset parent's padding box
	// This corresponds to the behavior of CSS absolute positioning
	position: function() {
		if ( !this[ 0 ] ) {
			return;
		}

		var offsetParent, offset, doc,
			elem = this[ 0 ],
			parentOffset = { top: 0, left: 0 };

		// position:fixed elements are offset from the viewport, which itself always has zero offset
		if ( jQuery.css( elem, "position" ) === "fixed" ) {

			// Assume position:fixed implies availability of getBoundingClientRect
			offset = elem.getBoundingClientRect();

		} else {
			offset = this.offset();

			// Account for the *real* offset parent, which can be the document or its root element
			// when a statically positioned element is identified
			doc = elem.ownerDocument;
			offsetParent = elem.offsetParent || doc.documentElement;
			while ( offsetParent &&
				( offsetParent === doc.body || offsetParent === doc.documentElement ) &&
				jQuery.css( offsetParent, "position" ) === "static" ) {

				offsetParent = offsetParent.parentNode;
			}
			if ( offsetParent && offsetParent !== elem && offsetParent.nodeType === 1 ) {

				// Incorporate borders into its offset, since they are outside its content origin
				parentOffset = jQuery( offsetParent ).offset();
				parentOffset.top += jQuery.css( offsetParent, "borderTopWidth", true );
				parentOffset.left += jQuery.css( offsetParent, "borderLeftWidth", true );
			}
		}

		// Subtract parent offsets and element margins
		return {
			top: offset.top - parentOffset.top - jQuery.css( elem, "marginTop", true ),
			left: offset.left - parentOffset.left - jQuery.css( elem, "marginLeft", true )
		};
	},

	// This method will return documentElement in the following cases:
	// 1) For the element inside the iframe without offsetParent, this method will return
	//    documentElement of the parent window
	// 2) For the hidden or detached element
	// 3) For body or html element, i.e. in case of the html node - it will return itself
	//
	// but those exceptions were never presented as a real life use-cases
	// and might be considered as more preferable results.
	//
	// This logic, however, is not guaranteed and can change at any point in the future
	offsetParent: function() {
		return this.map( function() {
			var offsetParent = this.offsetParent;

			while ( offsetParent && jQuery.css( offsetParent, "position" ) === "static" ) {
				offsetParent = offsetParent.offsetParent;
			}

			return offsetParent || documentElement;
		} );
	}
} );

// Create scrollLeft and scrollTop methods
jQuery.each( { scrollLeft: "pageXOffset", scrollTop: "pageYOffset" }, function( method, prop ) {
	var top = "pageYOffset" === prop;

	jQuery.fn[ method ] = function( val ) {
		return access( this, function( elem, method, val ) {

			// Coalesce documents and windows
			var win;
			if ( isWindow( elem ) ) {
				win = elem;
			} else if ( elem.nodeType === 9 ) {
				win = elem.defaultView;
			}

			if ( val === undefined ) {
				return win ? win[ prop ] : elem[ method ];
			}

			if ( win ) {
				win.scrollTo(
					!top ? val : win.pageXOffset,
					top ? val : win.pageYOffset
				);

			} else {
				elem[ method ] = val;
			}
		}, method, val, arguments.length );
	};
} );

// Support: Safari <=7 - 9.1, Chrome <=37 - 49
// Add the top/left cssHooks using jQuery.fn.position
// Webkit bug: https://bugs.webkit.org/show_bug.cgi?id=29084
// Blink bug: https://bugs.chromium.org/p/chromium/issues/detail?id=589347
// getComputedStyle returns percent when specified for top/left/bottom/right;
// rather than make the css module depend on the offset module, just check for it here
jQuery.each( [ "top", "left" ], function( _i, prop ) {
	jQuery.cssHooks[ prop ] = addGetHookIf( support.pixelPosition,
		function( elem, computed ) {
			if ( computed ) {
				computed = curCSS( elem, prop );

				// If curCSS returns percentage, fallback to offset
				return rnumnonpx.test( computed ) ?
					jQuery( elem ).position()[ prop ] + "px" :
					computed;
			}
		}
	);
} );


// Create innerHeight, innerWidth, height, width, outerHeight and outerWidth methods
jQuery.each( { Height: "height", Width: "width" }, function( name, type ) {
	jQuery.each( { padding: "inner" + name, content: type, "": "outer" + name },
		function( defaultExtra, funcName ) {

		// Margin is only for outerHeight, outerWidth
		jQuery.fn[ funcName ] = function( margin, value ) {
			var chainable = arguments.length && ( defaultExtra || typeof margin !== "boolean" ),
				extra = defaultExtra || ( margin === true || value === true ? "margin" : "border" );

			return access( this, function( elem, type, value ) {
				var doc;

				if ( isWindow( elem ) ) {

					// $( window ).outerWidth/Height return w/h including scrollbars (gh-1729)
					return funcName.indexOf( "outer" ) === 0 ?
						elem[ "inner" + name ] :
						elem.document.documentElement[ "client" + name ];
				}

				// Get document width or height
				if ( elem.nodeType === 9 ) {
					doc = elem.documentElement;

					// Either scroll[Width/Height] or offset[Width/Height] or client[Width/Height],
					// whichever is greatest
					return Math.max(
						elem.body[ "scroll" + name ], doc[ "scroll" + name ],
						elem.body[ "offset" + name ], doc[ "offset" + name ],
						doc[ "client" + name ]
					);
				}

				return value === undefined ?

					// Get width or height on the element, requesting but not forcing parseFloat
					jQuery.css( elem, type, extra ) :

					// Set width or height on the element
					jQuery.style( elem, type, value, extra );
			}, type, chainable ? margin : undefined, chainable );
		};
	} );
} );


jQuery.each( [
	"ajaxStart",
	"ajaxStop",
	"ajaxComplete",
	"ajaxError",
	"ajaxSuccess",
	"ajaxSend"
], function( _i, type ) {
	jQuery.fn[ type ] = function( fn ) {
		return this.on( type, fn );
	};
} );




jQuery.fn.extend( {

	bind: function( types, data, fn ) {
		return this.on( types, null, data, fn );
	},
	unbind: function( types, fn ) {
		return this.off( types, null, fn );
	},

	delegate: function( selector, types, data, fn ) {
		return this.on( types, selector, data, fn );
	},
	undelegate: function( selector, types, fn ) {

		// ( namespace ) or ( selector, types [, fn] )
		return arguments.length === 1 ?
			this.off( selector, "**" ) :
			this.off( types, selector || "**", fn );
	},

	hover: function( fnOver, fnOut ) {
		return this.mouseenter( fnOver ).mouseleave( fnOut || fnOver );
	}
} );

jQuery.each( ( "blur focus focusin focusout resize scroll click dblclick " +
	"mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave " +
	"change select submit keydown keypress keyup contextmenu" ).split( " " ),
	function( _i, name ) {

		// Handle event binding
		jQuery.fn[ name ] = function( data, fn ) {
			return arguments.length > 0 ?
				this.on( name, null, data, fn ) :
				this.trigger( name );
		};
	} );




// Support: Android <=4.0 only
// Make sure we trim BOM and NBSP
var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;

// Bind a function to a context, optionally partially applying any
// arguments.
// jQuery.proxy is deprecated to promote standards (specifically Function#bind)
// However, it is not slated for removal any time soon
jQuery.proxy = function( fn, context ) {
	var tmp, args, proxy;

	if ( typeof context === "string" ) {
		tmp = fn[ context ];
		context = fn;
		fn = tmp;
	}

	// Quick check to determine if target is callable, in the spec
	// this throws a TypeError, but we will just return undefined.
	if ( !isFunction( fn ) ) {
		return undefined;
	}

	// Simulated bind
	args = slice.call( arguments, 2 );
	proxy = function() {
		return fn.apply( context || this, args.concat( slice.call( arguments ) ) );
	};

	// Set the guid of unique handler to the same of original handler, so it can be removed
	proxy.guid = fn.guid = fn.guid || jQuery.guid++;

	return proxy;
};

jQuery.holdReady = function( hold ) {
	if ( hold ) {
		jQuery.readyWait++;
	} else {
		jQuery.ready( true );
	}
};
jQuery.isArray = Array.isArray;
jQuery.parseJSON = JSON.parse;
jQuery.nodeName = nodeName;
jQuery.isFunction = isFunction;
jQuery.isWindow = isWindow;
jQuery.camelCase = camelCase;
jQuery.type = toType;

jQuery.now = Date.now;

jQuery.isNumeric = function( obj ) {

	// As of jQuery 3.0, isNumeric is limited to
	// strings and numbers (primitives or objects)
	// that can be coerced to finite numbers (gh-2662)
	var type = jQuery.type( obj );
	return ( type === "number" || type === "string" ) &&

		// parseFloat NaNs numeric-cast false positives ("")
		// ...but misinterprets leading-number strings, particularly hex literals ("0x...")
		// subtraction forces infinities to NaN
		!isNaN( obj - parseFloat( obj ) );
};

jQuery.trim = function( text ) {
	return text == null ?
		"" :
		( text + "" ).replace( rtrim, "" );
};



// Register as a named AMD module, since jQuery can be concatenated with other
// files that may use define, but not via a proper concatenation script that
// understands anonymous AMD modules. A named AMD is safest and most robust
// way to register. Lowercase jquery is used because AMD module names are
// derived from file names, and jQuery is normally delivered in a lowercase
// file name. Do this after creating the global so that if an AMD module wants
// to call noConflict to hide this version of jQuery, it will work.

// Note that for maximum portability, libraries that are not jQuery should
// declare themselves as anonymous modules, and avoid setting a global if an
// AMD loader is present. jQuery is a special case. For more information, see
// https://github.com/jrburke/requirejs/wiki/Updating-existing-libraries#wiki-anon

if ( typeof define === "function" && define.amd ) {
	define( "jquery", [], function() {
		return jQuery;
	} );
}




var

	// Map over jQuery in case of overwrite
	_jQuery = window.jQuery,

	// Map over the $ in case of overwrite
	_$ = window.$;

jQuery.noConflict = function( deep ) {
	if ( window.$ === jQuery ) {
		window.$ = _$;
	}

	if ( deep && window.jQuery === jQuery ) {
		window.jQuery = _jQuery;
	}

	return jQuery;
};

// Expose jQuery and $ identifiers, even in AMD
// (#7102#comment:10, https://github.com/jquery/jquery/pull/557)
// and CommonJS for browser emulators (#13566)
if ( typeof noGlobal === "undefined" ) {
	window.jQuery = window.$ = jQuery;
}




return jQuery;
} );
;/*! jQuery v3.5.1 | (c) JS Foundation and other contributors | jquery.org/license */
!function(e,t){"use strict";"object"==typeof module&&"object"==typeof module.exports?module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error("jQuery requires a window with a document");return t(e)}:t(e)}("undefined"!=typeof window?window:this,function(C,e){"use strict";var t=[],r=Object.getPrototypeOf,s=t.slice,g=t.flat?function(e){return t.flat.call(e)}:function(e){return t.concat.apply([],e)},u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=a.call(Object),y={},m=function(e){return"function"==typeof e&&"number"!=typeof e.nodeType},x=function(e){return null!=e&&e===e.window},E=C.document,c={type:!0,src:!0,nonce:!0,noModule:!0};function b(e,t,n){var r,i,o=(n=n||E).createElement("script");if(o.text=e,t)for(r in c)(i=t[r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode.removeChild(o)}function w(e){return null==e?e+"":"object"==typeof e||"function"==typeof e?n[o.call(e)]||"object":typeof e}var f="3.5.1",S=function(e,t){return new S.fn.init(e,t)};function p(e){var t=!!e&&"length"in e&&e.length,n=w(e);return!m(e)&&!x(e)&&("array"===n||0===t||"number"==typeof t&&0<t&&t-1 in e)}S.fn=S.prototype={jquery:f,constructor:S,length:0,toArray:function(){return s.call(this)},get:function(e){return null==e?s.call(this):e<0?this[e+this.length]:this[e]},pushStack:function(e){var t=S.merge(this.constructor(),e);return t.prevObject=this,t},each:function(e){return S.each(this,e)},map:function(n){return this.pushStack(S.map(this,function(e,t){return n.call(e,t,e)}))},slice:function(){return this.pushStack(s.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},even:function(){return this.pushStack(S.grep(this,function(e,t){return(t+1)%2}))},odd:function(){return this.pushStack(S.grep(this,function(e,t){return t%2}))},eq:function(e){var t=this.length,n=+e+(e<0?t:0);return this.pushStack(0<=n&&n<t?[this[n]]:[])},end:function(){return this.prevObject||this.constructor()},push:u,sort:t.sort,splice:t.splice},S.extend=S.fn.extend=function(){var e,t,n,r,i,o,a=arguments[0]||{},s=1,u=arguments.length,l=!1;for("boolean"==typeof a&&(l=a,a=arguments[s]||{},s++),"object"==typeof a||m(a)||(a={}),s===u&&(a=this,s--);s<u;s++)if(null!=(e=arguments[s]))for(t in e)r=e[t],"__proto__"!==t&&a!==r&&(l&&r&&(S.isPlainObject(r)||(i=Array.isArray(r)))?(n=a[t],o=i&&!Array.isArray(n)?[]:i||S.isPlainObject(n)?n:{},i=!1,a[t]=S.extend(l,o,r)):void 0!==r&&(a[t]=r));return a},S.extend({expando:"jQuery"+(f+Math.random()).replace(/\D/g,""),isReady:!0,error:function(e){throw new Error(e)},noop:function(){},isPlainObject:function(e){var t,n;return!(!e||"[object Object]"!==o.call(e))&&(!(t=r(e))||"function"==typeof(n=v.call(t,"constructor")&&t.constructor)&&a.call(n)===l)},isEmptyObject:function(e){var t;for(t in e)return!1;return!0},globalEval:function(e,t,n){b(e,{nonce:t&&t.nonce},n)},each:function(e,t){var n,r=0;if(p(e)){for(n=e.length;r<n;r++)if(!1===t.call(e[r],r,e[r]))break}else for(r in e)if(!1===t.call(e[r],r,e[r]))break;return e},makeArray:function(e,t){var n=t||[];return null!=e&&(p(Object(e))?S.merge(n,"string"==typeof e?[e]:e):u.call(n,e)),n},inArray:function(e,t,n){return null==t?-1:i.call(t,e,n)},merge:function(e,t){for(var n=+t.length,r=0,i=e.length;r<n;r++)e[i++]=t[r];return e.length=i,e},grep:function(e,t,n){for(var r=[],i=0,o=e.length,a=!n;i<o;i++)!t(e[i],i)!==a&&r.push(e[i]);return r},map:function(e,t,n){var r,i,o=0,a=[];if(p(e))for(r=e.length;o<r;o++)null!=(i=t(e[o],o,n))&&a.push(i);else for(o in e)null!=(i=t(e[o],o,n))&&a.push(i);return g(a)},guid:1,support:y}),"function"==typeof Symbol&&(S.fn[Symbol.iterator]=t[Symbol.iterator]),S.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "),function(e,t){n["[object "+t+"]"]=t.toLowerCase()});var d=function(n){var e,d,b,o,i,h,f,g,w,u,l,T,C,a,E,v,s,c,y,S="sizzle"+1*new Date,p=n.document,k=0,r=0,m=ue(),x=ue(),A=ue(),N=ue(),D=function(e,t){return e===t&&(l=!0),0},j={}.hasOwnProperty,t=[],q=t.pop,L=t.push,H=t.push,O=t.slice,P=function(e,t){for(var n=0,r=e.length;n<r;n++)if(e[n]===t)return n;return-1},R="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",M="[\\x20\\t\\r\\n\\f]",I="(?:\\\\[\\da-fA-F]{1,6}"+M+"?|\\\\[^\\r\\n\\f]|[\\w-]|[^\0-\\x7f])+",W="\\["+M+"*("+I+")(?:"+M+"*([*^$|!~]?=)"+M+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+I+"))|)"+M+"*\\]",F=":("+I+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+W+")*)|.*)\\)|)",B=new RegExp(M+"+","g"),$=new RegExp("^"+M+"+|((?:^|[^\\\\])(?:\\\\.)*)"+M+"+$","g"),_=new RegExp("^"+M+"*,"+M+"*"),z=new RegExp("^"+M+"*([>+~]|"+M+")"+M+"*"),U=new RegExp(M+"|>"),X=new RegExp(F),V=new RegExp("^"+I+"$"),G={ID:new RegExp("^#("+I+")"),CLASS:new RegExp("^\\.("+I+")"),TAG:new RegExp("^("+I+"|[*])"),ATTR:new RegExp("^"+W),PSEUDO:new RegExp("^"+F),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+M+"*(even|odd|(([+-]|)(\\d*)n|)"+M+"*(?:([+-]|)"+M+"*(\\d+)|))"+M+"*\\)|)","i"),bool:new RegExp("^(?:"+R+")$","i"),needsContext:new RegExp("^"+M+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+M+"*((?:-\\d)?\\d*)"+M+"*\\)|)(?=[^-]|$)","i")},Y=/HTML$/i,Q=/^(?:input|select|textarea|button)$/i,J=/^h\d$/i,K=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,ee=/[+~]/,te=new RegExp("\\\\[\\da-fA-F]{1,6}"+M+"?|\\\\([^\\r\\n\\f])","g"),ne=function(e,t){var n="0x"+e.slice(1)-65536;return t||(n<0?String.fromCharCode(n+65536):String.fromCharCode(n>>10|55296,1023&n|56320))},re=/([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g,ie=function(e,t){return t?"\0"===e?"\ufffd":e.slice(0,-1)+"\\"+e.charCodeAt(e.length-1).toString(16)+" ":"\\"+e},oe=function(){T()},ae=be(function(e){return!0===e.disabled&&"fieldset"===e.nodeName.toLowerCase()},{dir:"parentNode",next:"legend"});try{H.apply(t=O.call(p.childNodes),p.childNodes),t[p.childNodes.length].nodeType}catch(e){H={apply:t.length?function(e,t){L.apply(e,O.call(t))}:function(e,t){var n=e.length,r=0;while(e[n++]=t[r++]);e.length=n-1}}}function se(t,e,n,r){var i,o,a,s,u,l,c,f=e&&e.ownerDocument,p=e?e.nodeType:9;if(n=n||[],"string"!=typeof t||!t||1!==p&&9!==p&&11!==p)return n;if(!r&&(T(e),e=e||C,E)){if(11!==p&&(u=Z.exec(t)))if(i=u[1]){if(9===p){if(!(a=e.getElementById(i)))return n;if(a.id===i)return n.push(a),n}else if(f&&(a=f.getElementById(i))&&y(e,a)&&a.id===i)return n.push(a),n}else{if(u[2])return H.apply(n,e.getElementsByTagName(t)),n;if((i=u[3])&&d.getElementsByClassName&&e.getElementsByClassName)return H.apply(n,e.getElementsByClassName(i)),n}if(d.qsa&&!N[t+" "]&&(!v||!v.test(t))&&(1!==p||"object"!==e.nodeName.toLowerCase())){if(c=t,f=e,1===p&&(U.test(t)||z.test(t))){(f=ee.test(t)&&ye(e.parentNode)||e)===e&&d.scope||((s=e.getAttribute("id"))?s=s.replace(re,ie):e.setAttribute("id",s=S)),o=(l=h(t)).length;while(o--)l[o]=(s?"#"+s:":scope")+" "+xe(l[o]);c=l.join(",")}try{return H.apply(n,f.querySelectorAll(c)),n}catch(e){N(t,!0)}finally{s===S&&e.removeAttribute("id")}}}return g(t.replace($,"$1"),e,n,r)}function ue(){var r=[];return function e(t,n){return r.push(t+" ")>b.cacheLength&&delete e[r.shift()],e[t+" "]=n}}function le(e){return e[S]=!0,e}function ce(e){var t=C.createElement("fieldset");try{return!!e(t)}catch(e){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function fe(e,t){var n=e.split("|"),r=n.length;while(r--)b.attrHandle[n[r]]=t}function pe(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&e.sourceIndex-t.sourceIndex;if(r)return r;if(n)while(n=n.nextSibling)if(n===t)return-1;return e?1:-1}function de(t){return function(e){return"input"===e.nodeName.toLowerCase()&&e.type===t}}function he(n){return function(e){var t=e.nodeName.toLowerCase();return("input"===t||"button"===t)&&e.type===n}}function ge(t){return function(e){return"form"in e?e.parentNode&&!1===e.disabled?"label"in e?"label"in e.parentNode?e.parentNode.disabled===t:e.disabled===t:e.isDisabled===t||e.isDisabled!==!t&&ae(e)===t:e.disabled===t:"label"in e&&e.disabled===t}}function ve(a){return le(function(o){return o=+o,le(function(e,t){var n,r=a([],e.length,o),i=r.length;while(i--)e[n=r[i]]&&(e[n]=!(t[n]=e[n]))})})}function ye(e){return e&&"undefined"!=typeof e.getElementsByTagName&&e}for(e in d=se.support={},i=se.isXML=function(e){var t=e.namespaceURI,n=(e.ownerDocument||e).documentElement;return!Y.test(t||n&&n.nodeName||"HTML")},T=se.setDocument=function(e){var t,n,r=e?e.ownerDocument||e:p;return r!=C&&9===r.nodeType&&r.documentElement&&(a=(C=r).documentElement,E=!i(C),p!=C&&(n=C.defaultView)&&n.top!==n&&(n.addEventListener?n.addEventListener("unload",oe,!1):n.attachEvent&&n.attachEvent("onunload",oe)),d.scope=ce(function(e){return a.appendChild(e).appendChild(C.createElement("div")),"undefined"!=typeof e.querySelectorAll&&!e.querySelectorAll(":scope fieldset div").length}),d.attributes=ce(function(e){return e.className="i",!e.getAttribute("className")}),d.getElementsByTagName=ce(function(e){return e.appendChild(C.createComment("")),!e.getElementsByTagName("*").length}),d.getElementsByClassName=K.test(C.getElementsByClassName),d.getById=ce(function(e){return a.appendChild(e).id=S,!C.getElementsByName||!C.getElementsByName(S).length}),d.getById?(b.filter.ID=function(e){var t=e.replace(te,ne);return function(e){return e.getAttribute("id")===t}},b.find.ID=function(e,t){if("undefined"!=typeof t.getElementById&&E){var n=t.getElementById(e);return n?[n]:[]}}):(b.filter.ID=function(e){var n=e.replace(te,ne);return function(e){var t="undefined"!=typeof e.getAttributeNode&&e.getAttributeNode("id");return t&&t.value===n}},b.find.ID=function(e,t){if("undefined"!=typeof t.getElementById&&E){var n,r,i,o=t.getElementById(e);if(o){if((n=o.getAttributeNode("id"))&&n.value===e)return[o];i=t.getElementsByName(e),r=0;while(o=i[r++])if((n=o.getAttributeNode("id"))&&n.value===e)return[o]}return[]}}),b.find.TAG=d.getElementsByTagName?function(e,t){return"undefined"!=typeof t.getElementsByTagName?t.getElementsByTagName(e):d.qsa?t.querySelectorAll(e):void 0}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"===e){while(n=o[i++])1===n.nodeType&&r.push(n);return r}return o},b.find.CLASS=d.getElementsByClassName&&function(e,t){if("undefined"!=typeof t.getElementsByClassName&&E)return t.getElementsByClassName(e)},s=[],v=[],(d.qsa=K.test(C.querySelectorAll))&&(ce(function(e){var t;a.appendChild(e).innerHTML="<a id='"+S+"'></a><select id='"+S+"-\r\\' msallowcapture=''><option selected=''></option></select>",e.querySelectorAll("[msallowcapture^='']").length&&v.push("[*^$]="+M+"*(?:''|\"\")"),e.querySelectorAll("[selected]").length||v.push("\\["+M+"*(?:value|"+R+")"),e.querySelectorAll("[id~="+S+"-]").length||v.push("~="),(t=C.createElement("input")).setAttribute("name",""),e.appendChild(t),e.querySelectorAll("[name='']").length||v.push("\\["+M+"*name"+M+"*="+M+"*(?:''|\"\")"),e.querySelectorAll(":checked").length||v.push(":checked"),e.querySelectorAll("a#"+S+"+*").length||v.push(".#.+[+~]"),e.querySelectorAll("\\\f"),v.push("[\\r\\n\\f]")}),ce(function(e){e.innerHTML="<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";var t=C.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("name","D"),e.querySelectorAll("[name=d]").length&&v.push("name"+M+"*[*^$|!~]?="),2!==e.querySelectorAll(":enabled").length&&v.push(":enabled",":disabled"),a.appendChild(e).disabled=!0,2!==e.querySelectorAll(":disabled").length&&v.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),v.push(",.*:")})),(d.matchesSelector=K.test(c=a.matches||a.webkitMatchesSelector||a.mozMatchesSelector||a.oMatchesSelector||a.msMatchesSelector))&&ce(function(e){d.disconnectedMatch=c.call(e,"*"),c.call(e,"[s!='']:x"),s.push("!=",F)}),v=v.length&&new RegExp(v.join("|")),s=s.length&&new RegExp(s.join("|")),t=K.test(a.compareDocumentPosition),y=t||K.test(a.contains)?function(e,t){var n=9===e.nodeType?e.documentElement:e,r=t&&t.parentNode;return e===r||!(!r||1!==r.nodeType||!(n.contains?n.contains(r):e.compareDocumentPosition&&16&e.compareDocumentPosition(r)))}:function(e,t){if(t)while(t=t.parentNode)if(t===e)return!0;return!1},D=t?function(e,t){if(e===t)return l=!0,0;var n=!e.compareDocumentPosition-!t.compareDocumentPosition;return n||(1&(n=(e.ownerDocument||e)==(t.ownerDocument||t)?e.compareDocumentPosition(t):1)||!d.sortDetached&&t.compareDocumentPosition(e)===n?e==C||e.ownerDocument==p&&y(p,e)?-1:t==C||t.ownerDocument==p&&y(p,t)?1:u?P(u,e)-P(u,t):0:4&n?-1:1)}:function(e,t){if(e===t)return l=!0,0;var n,r=0,i=e.parentNode,o=t.parentNode,a=[e],s=[t];if(!i||!o)return e==C?-1:t==C?1:i?-1:o?1:u?P(u,e)-P(u,t):0;if(i===o)return pe(e,t);n=e;while(n=n.parentNode)a.unshift(n);n=t;while(n=n.parentNode)s.unshift(n);while(a[r]===s[r])r++;return r?pe(a[r],s[r]):a[r]==p?-1:s[r]==p?1:0}),C},se.matches=function(e,t){return se(e,null,null,t)},se.matchesSelector=function(e,t){if(T(e),d.matchesSelector&&E&&!N[t+" "]&&(!s||!s.test(t))&&(!v||!v.test(t)))try{var n=c.call(e,t);if(n||d.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(e){N(t,!0)}return 0<se(t,C,null,[e]).length},se.contains=function(e,t){return(e.ownerDocument||e)!=C&&T(e),y(e,t)},se.attr=function(e,t){(e.ownerDocument||e)!=C&&T(e);var n=b.attrHandle[t.toLowerCase()],r=n&&j.call(b.attrHandle,t.toLowerCase())?n(e,t,!E):void 0;return void 0!==r?r:d.attributes||!E?e.getAttribute(t):(r=e.getAttributeNode(t))&&r.specified?r.value:null},se.escape=function(e){return(e+"").replace(re,ie)},se.error=function(e){throw new Error("Syntax error, unrecognized expression: "+e)},se.uniqueSort=function(e){var t,n=[],r=0,i=0;if(l=!d.detectDuplicates,u=!d.sortStable&&e.slice(0),e.sort(D),l){while(t=e[i++])t===e[i]&&(r=n.push(i));while(r--)e.splice(n[r],1)}return u=null,e},o=se.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=o(e)}else if(3===i||4===i)return e.nodeValue}else while(t=e[r++])n+=o(t);return n},(b=se.selectors={cacheLength:50,createPseudo:le,match:G,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(te,ne),e[3]=(e[3]||e[4]||e[5]||"").replace(te,ne),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||se.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&se.error(e[0]),e},PSEUDO:function(e){var t,n=!e[6]&&e[2];return G.CHILD.test(e[0])?null:(e[3]?e[2]=e[4]||e[5]||"":n&&X.test(n)&&(t=h(n,!0))&&(t=n.indexOf(")",n.length-t)-n.length)&&(e[0]=e[0].slice(0,t),e[2]=n.slice(0,t)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(te,ne).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=m[e+" "];return t||(t=new RegExp("(^|"+M+")"+e+"("+M+"|$)"))&&m(e,function(e){return t.test("string"==typeof e.className&&e.className||"undefined"!=typeof e.getAttribute&&e.getAttribute("class")||"")})},ATTR:function(n,r,i){return function(e){var t=se.attr(e,n);return null==t?"!="===r:!r||(t+="","="===r?t===i:"!="===r?t!==i:"^="===r?i&&0===t.indexOf(i):"*="===r?i&&-1<t.indexOf(i):"$="===r?i&&t.slice(-i.length)===i:"~="===r?-1<(" "+t.replace(B," ")+" ").indexOf(i):"|="===r&&(t===i||t.slice(0,i.length+1)===i+"-"))}},CHILD:function(h,e,t,g,v){var y="nth"!==h.slice(0,3),m="last"!==h.slice(-4),x="of-type"===e;return 1===g&&0===v?function(e){return!!e.parentNode}:function(e,t,n){var r,i,o,a,s,u,l=y!==m?"nextSibling":"previousSibling",c=e.parentNode,f=x&&e.nodeName.toLowerCase(),p=!n&&!x,d=!1;if(c){if(y){while(l){a=e;while(a=a[l])if(x?a.nodeName.toLowerCase()===f:1===a.nodeType)return!1;u=l="only"===h&&!u&&"nextSibling"}return!0}if(u=[m?c.firstChild:c.lastChild],m&&p){d=(s=(r=(i=(o=(a=c)[S]||(a[S]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]||[])[0]===k&&r[1])&&r[2],a=s&&c.childNodes[s];while(a=++s&&a&&a[l]||(d=s=0)||u.pop())if(1===a.nodeType&&++d&&a===e){i[h]=[k,s,d];break}}else if(p&&(d=s=(r=(i=(o=(a=e)[S]||(a[S]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]||[])[0]===k&&r[1]),!1===d)while(a=++s&&a&&a[l]||(d=s=0)||u.pop())if((x?a.nodeName.toLowerCase()===f:1===a.nodeType)&&++d&&(p&&((i=(o=a[S]||(a[S]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]=[k,d]),a===e))break;return(d-=v)===g||d%g==0&&0<=d/g}}},PSEUDO:function(e,o){var t,a=b.pseudos[e]||b.setFilters[e.toLowerCase()]||se.error("unsupported pseudo: "+e);return a[S]?a(o):1<a.length?(t=[e,e,"",o],b.setFilters.hasOwnProperty(e.toLowerCase())?le(function(e,t){var n,r=a(e,o),i=r.length;while(i--)e[n=P(e,r[i])]=!(t[n]=r[i])}):function(e){return a(e,0,t)}):a}},pseudos:{not:le(function(e){var r=[],i=[],s=f(e.replace($,"$1"));return s[S]?le(function(e,t,n,r){var i,o=s(e,null,r,[]),a=e.length;while(a--)(i=o[a])&&(e[a]=!(t[a]=i))}):function(e,t,n){return r[0]=e,s(r,null,n,i),r[0]=null,!i.pop()}}),has:le(function(t){return function(e){return 0<se(t,e).length}}),contains:le(function(t){return t=t.replace(te,ne),function(e){return-1<(e.textContent||o(e)).indexOf(t)}}),lang:le(function(n){return V.test(n||"")||se.error("unsupported lang: "+n),n=n.replace(te,ne).toLowerCase(),function(e){var t;do{if(t=E?e.lang:e.getAttribute("xml:lang")||e.getAttribute("lang"))return(t=t.toLowerCase())===n||0===t.indexOf(n+"-")}while((e=e.parentNode)&&1===e.nodeType);return!1}}),target:function(e){var t=n.location&&n.location.hash;return t&&t.slice(1)===e.id},root:function(e){return e===a},focus:function(e){return e===C.activeElement&&(!C.hasFocus||C.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:ge(!1),disabled:ge(!0),checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,!0===e.selected},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeType<6)return!1;return!0},parent:function(e){return!b.pseudos.empty(e)},header:function(e){return J.test(e.nodeName)},input:function(e){return Q.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||"text"===t.toLowerCase())},first:ve(function(){return[0]}),last:ve(function(e,t){return[t-1]}),eq:ve(function(e,t,n){return[n<0?n+t:n]}),even:ve(function(e,t){for(var n=0;n<t;n+=2)e.push(n);return e}),odd:ve(function(e,t){for(var n=1;n<t;n+=2)e.push(n);return e}),lt:ve(function(e,t,n){for(var r=n<0?n+t:t<n?t:n;0<=--r;)e.push(r);return e}),gt:ve(function(e,t,n){for(var r=n<0?n+t:n;++r<t;)e.push(r);return e})}}).pseudos.nth=b.pseudos.eq,{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})b.pseudos[e]=de(e);for(e in{submit:!0,reset:!0})b.pseudos[e]=he(e);function me(){}function xe(e){for(var t=0,n=e.length,r="";t<n;t++)r+=e[t].value;return r}function be(s,e,t){var u=e.dir,l=e.next,c=l||u,f=t&&"parentNode"===c,p=r++;return e.first?function(e,t,n){while(e=e[u])if(1===e.nodeType||f)return s(e,t,n);return!1}:function(e,t,n){var r,i,o,a=[k,p];if(n){while(e=e[u])if((1===e.nodeType||f)&&s(e,t,n))return!0}else while(e=e[u])if(1===e.nodeType||f)if(i=(o=e[S]||(e[S]={}))[e.uniqueID]||(o[e.uniqueID]={}),l&&l===e.nodeName.toLowerCase())e=e[u]||e;else{if((r=i[c])&&r[0]===k&&r[1]===p)return a[2]=r[2];if((i[c]=a)[2]=s(e,t,n))return!0}return!1}}function we(i){return 1<i.length?function(e,t,n){var r=i.length;while(r--)if(!i[r](e,t,n))return!1;return!0}:i[0]}function Te(e,t,n,r,i){for(var o,a=[],s=0,u=e.length,l=null!=t;s<u;s++)(o=e[s])&&(n&&!n(o,r,i)||(a.push(o),l&&t.push(s)));return a}function Ce(d,h,g,v,y,e){return v&&!v[S]&&(v=Ce(v)),y&&!y[S]&&(y=Ce(y,e)),le(function(e,t,n,r){var i,o,a,s=[],u=[],l=t.length,c=e||function(e,t,n){for(var r=0,i=t.length;r<i;r++)se(e,t[r],n);return n}(h||"*",n.nodeType?[n]:n,[]),f=!d||!e&&h?c:Te(c,s,d,n,r),p=g?y||(e?d:l||v)?[]:t:f;if(g&&g(f,p,n,r),v){i=Te(p,u),v(i,[],n,r),o=i.length;while(o--)(a=i[o])&&(p[u[o]]=!(f[u[o]]=a))}if(e){if(y||d){if(y){i=[],o=p.length;while(o--)(a=p[o])&&i.push(f[o]=a);y(null,p=[],i,r)}o=p.length;while(o--)(a=p[o])&&-1<(i=y?P(e,a):s[o])&&(e[i]=!(t[i]=a))}}else p=Te(p===t?p.splice(l,p.length):p),y?y(null,t,p,r):H.apply(t,p)})}function Ee(e){for(var i,t,n,r=e.length,o=b.relative[e[0].type],a=o||b.relative[" "],s=o?1:0,u=be(function(e){return e===i},a,!0),l=be(function(e){return-1<P(i,e)},a,!0),c=[function(e,t,n){var r=!o&&(n||t!==w)||((i=t).nodeType?u(e,t,n):l(e,t,n));return i=null,r}];s<r;s++)if(t=b.relative[e[s].type])c=[be(we(c),t)];else{if((t=b.filter[e[s].type].apply(null,e[s].matches))[S]){for(n=++s;n<r;n++)if(b.relative[e[n].type])break;return Ce(1<s&&we(c),1<s&&xe(e.slice(0,s-1).concat({value:" "===e[s-2].type?"*":""})).replace($,"$1"),t,s<n&&Ee(e.slice(s,n)),n<r&&Ee(e=e.slice(n)),n<r&&xe(e))}c.push(t)}return we(c)}return me.prototype=b.filters=b.pseudos,b.setFilters=new me,h=se.tokenize=function(e,t){var n,r,i,o,a,s,u,l=x[e+" "];if(l)return t?0:l.slice(0);a=e,s=[],u=b.preFilter;while(a){for(o in n&&!(r=_.exec(a))||(r&&(a=a.slice(r[0].length)||a),s.push(i=[])),n=!1,(r=z.exec(a))&&(n=r.shift(),i.push({value:n,type:r[0].replace($," ")}),a=a.slice(n.length)),b.filter)!(r=G[o].exec(a))||u[o]&&!(r=u[o](r))||(n=r.shift(),i.push({value:n,type:o,matches:r}),a=a.slice(n.length));if(!n)break}return t?a.length:a?se.error(e):x(e,s).slice(0)},f=se.compile=function(e,t){var n,v,y,m,x,r,i=[],o=[],a=A[e+" "];if(!a){t||(t=h(e)),n=t.length;while(n--)(a=Ee(t[n]))[S]?i.push(a):o.push(a);(a=A(e,(v=o,m=0<(y=i).length,x=0<v.length,r=function(e,t,n,r,i){var o,a,s,u=0,l="0",c=e&&[],f=[],p=w,d=e||x&&b.find.TAG("*",i),h=k+=null==p?1:Math.random()||.1,g=d.length;for(i&&(w=t==C||t||i);l!==g&&null!=(o=d[l]);l++){if(x&&o){a=0,t||o.ownerDocument==C||(T(o),n=!E);while(s=v[a++])if(s(o,t||C,n)){r.push(o);break}i&&(k=h)}m&&((o=!s&&o)&&u--,e&&c.push(o))}if(u+=l,m&&l!==u){a=0;while(s=y[a++])s(c,f,t,n);if(e){if(0<u)while(l--)c[l]||f[l]||(f[l]=q.call(r));f=Te(f)}H.apply(r,f),i&&!e&&0<f.length&&1<u+y.length&&se.uniqueSort(r)}return i&&(k=h,w=p),c},m?le(r):r))).selector=e}return a},g=se.select=function(e,t,n,r){var i,o,a,s,u,l="function"==typeof e&&e,c=!r&&h(e=l.selector||e);if(n=n||[],1===c.length){if(2<(o=c[0]=c[0].slice(0)).length&&"ID"===(a=o[0]).type&&9===t.nodeType&&E&&b.relative[o[1].type]){if(!(t=(b.find.ID(a.matches[0].replace(te,ne),t)||[])[0]))return n;l&&(t=t.parentNode),e=e.slice(o.shift().value.length)}i=G.needsContext.test(e)?0:o.length;while(i--){if(a=o[i],b.relative[s=a.type])break;if((u=b.find[s])&&(r=u(a.matches[0].replace(te,ne),ee.test(o[0].type)&&ye(t.parentNode)||t))){if(o.splice(i,1),!(e=r.length&&xe(o)))return H.apply(n,r),n;break}}}return(l||f(e,c))(r,t,!E,n,!t||ee.test(e)&&ye(t.parentNode)||t),n},d.sortStable=S.split("").sort(D).join("")===S,d.detectDuplicates=!!l,T(),d.sortDetached=ce(function(e){return 1&e.compareDocumentPosition(C.createElement("fieldset"))}),ce(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||fe("type|href|height|width",function(e,t,n){if(!n)return e.getAttribute(t,"type"===t.toLowerCase()?1:2)}),d.attributes&&ce(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||fe("value",function(e,t,n){if(!n&&"input"===e.nodeName.toLowerCase())return e.defaultValue}),ce(function(e){return null==e.getAttribute("disabled")})||fe(R,function(e,t,n){var r;if(!n)return!0===e[t]?t.toLowerCase():(r=e.getAttributeNode(t))&&r.specified?r.value:null}),se}(C);S.find=d,S.expr=d.selectors,S.expr[":"]=S.expr.pseudos,S.uniqueSort=S.unique=d.uniqueSort,S.text=d.getText,S.isXMLDoc=d.isXML,S.contains=d.contains,S.escapeSelector=d.escape;var h=function(e,t,n){var r=[],i=void 0!==n;while((e=e[t])&&9!==e.nodeType)if(1===e.nodeType){if(i&&S(e).is(n))break;r.push(e)}return r},T=function(e,t){for(var n=[];e;e=e.nextSibling)1===e.nodeType&&e!==t&&n.push(e);return n},k=S.expr.match.needsContext;function A(e,t){return e.nodeName&&e.nodeName.toLowerCase()===t.toLowerCase()}var N=/^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i;function D(e,n,r){return m(n)?S.grep(e,function(e,t){return!!n.call(e,t,e)!==r}):n.nodeType?S.grep(e,function(e){return e===n!==r}):"string"!=typeof n?S.grep(e,function(e){return-1<i.call(n,e)!==r}):S.filter(n,e,r)}S.filter=function(e,t,n){var r=t[0];return n&&(e=":not("+e+")"),1===t.length&&1===r.nodeType?S.find.matchesSelector(r,e)?[r]:[]:S.find.matches(e,S.grep(t,function(e){return 1===e.nodeType}))},S.fn.extend({find:function(e){var t,n,r=this.length,i=this;if("string"!=typeof e)return this.pushStack(S(e).filter(function(){for(t=0;t<r;t++)if(S.contains(i[t],this))return!0}));for(n=this.pushStack([]),t=0;t<r;t++)S.find(e,i[t],n);return 1<r?S.uniqueSort(n):n},filter:function(e){return this.pushStack(D(this,e||[],!1))},not:function(e){return this.pushStack(D(this,e||[],!0))},is:function(e){return!!D(this,"string"==typeof e&&k.test(e)?S(e):e||[],!1).length}});var j,q=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;(S.fn.init=function(e,t,n){var r,i;if(!e)return this;if(n=n||j,"string"==typeof e){if(!(r="<"===e[0]&&">"===e[e.length-1]&&3<=e.length?[null,e,null]:q.exec(e))||!r[1]&&t)return!t||t.jquery?(t||n).find(e):this.constructor(t).find(e);if(r[1]){if(t=t instanceof S?t[0]:t,S.merge(this,S.parseHTML(r[1],t&&t.nodeType?t.ownerDocument||t:E,!0)),N.test(r[1])&&S.isPlainObject(t))for(r in t)m(this[r])?this[r](t[r]):this.attr(r,t[r]);return this}return(i=E.getElementById(r[2]))&&(this[0]=i,this.length=1),this}return e.nodeType?(this[0]=e,this.length=1,this):m(e)?void 0!==n.ready?n.ready(e):e(S):S.makeArray(e,this)}).prototype=S.fn,j=S(E);var L=/^(?:parents|prev(?:Until|All))/,H={children:!0,contents:!0,next:!0,prev:!0};function O(e,t){while((e=e[t])&&1!==e.nodeType);return e}S.fn.extend({has:function(e){var t=S(e,this),n=t.length;return this.filter(function(){for(var e=0;e<n;e++)if(S.contains(this,t[e]))return!0})},closest:function(e,t){var n,r=0,i=this.length,o=[],a="string"!=typeof e&&S(e);if(!k.test(e))for(;r<i;r++)for(n=this[r];n&&n!==t;n=n.parentNode)if(n.nodeType<11&&(a?-1<a.index(n):1===n.nodeType&&S.find.matchesSelector(n,e))){o.push(n);break}return this.pushStack(1<o.length?S.uniqueSort(o):o)},index:function(e){return e?"string"==typeof e?i.call(S(e),this[0]):i.call(this,e.jquery?e[0]:e):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(e,t){return this.pushStack(S.uniqueSort(S.merge(this.get(),S(e,t))))},addBack:function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}}),S.each({parent:function(e){var t=e.parentNode;return t&&11!==t.nodeType?t:null},parents:function(e){return h(e,"parentNode")},parentsUntil:function(e,t,n){return h(e,"parentNode",n)},next:function(e){return O(e,"nextSibling")},prev:function(e){return O(e,"previousSibling")},nextAll:function(e){return h(e,"nextSibling")},prevAll:function(e){return h(e,"previousSibling")},nextUntil:function(e,t,n){return h(e,"nextSibling",n)},prevUntil:function(e,t,n){return h(e,"previousSibling",n)},siblings:function(e){return T((e.parentNode||{}).firstChild,e)},children:function(e){return T(e.firstChild)},contents:function(e){return null!=e.contentDocument&&r(e.contentDocument)?e.contentDocument:(A(e,"template")&&(e=e.content||e),S.merge([],e.childNodes))}},function(r,i){S.fn[r]=function(e,t){var n=S.map(this,i,e);return"Until"!==r.slice(-5)&&(t=e),t&&"string"==typeof t&&(n=S.filter(t,n)),1<this.length&&(H[r]||S.uniqueSort(n),L.test(r)&&n.reverse()),this.pushStack(n)}});var P=/[^\x20\t\r\n\f]+/g;function R(e){return e}function M(e){throw e}function I(e,t,n,r){var i;try{e&&m(i=e.promise)?i.call(e).done(t).fail(n):e&&m(i=e.then)?i.call(e,t,n):t.apply(void 0,[e].slice(r))}catch(e){n.apply(void 0,[e])}}S.Callbacks=function(r){var e,n;r="string"==typeof r?(e=r,n={},S.each(e.match(P)||[],function(e,t){n[t]=!0}),n):S.extend({},r);var i,t,o,a,s=[],u=[],l=-1,c=function(){for(a=a||r.once,o=i=!0;u.length;l=-1){t=u.shift();while(++l<s.length)!1===s[l].apply(t[0],t[1])&&r.stopOnFalse&&(l=s.length,t=!1)}r.memory||(t=!1),i=!1,a&&(s=t?[]:"")},f={add:function(){return s&&(t&&!i&&(l=s.length-1,u.push(t)),function n(e){S.each(e,function(e,t){m(t)?r.unique&&f.has(t)||s.push(t):t&&t.length&&"string"!==w(t)&&n(t)})}(arguments),t&&!i&&c()),this},remove:function(){return S.each(arguments,function(e,t){var n;while(-1<(n=S.inArray(t,s,n)))s.splice(n,1),n<=l&&l--}),this},has:function(e){return e?-1<S.inArray(e,s):0<s.length},empty:function(){return s&&(s=[]),this},disable:function(){return a=u=[],s=t="",this},disabled:function(){return!s},lock:function(){return a=u=[],t||i||(s=t=""),this},locked:function(){return!!a},fireWith:function(e,t){return a||(t=[e,(t=t||[]).slice?t.slice():t],u.push(t),i||c()),this},fire:function(){return f.fireWith(this,arguments),this},fired:function(){return!!o}};return f},S.extend({Deferred:function(e){var o=[["notify","progress",S.Callbacks("memory"),S.Callbacks("memory"),2],["resolve","done",S.Callbacks("once memory"),S.Callbacks("once memory"),0,"resolved"],["reject","fail",S.Callbacks("once memory"),S.Callbacks("once memory"),1,"rejected"]],i="pending",a={state:function(){return i},always:function(){return s.done(arguments).fail(arguments),this},"catch":function(e){return a.then(null,e)},pipe:function(){var i=arguments;return S.Deferred(function(r){S.each(o,function(e,t){var n=m(i[t[4]])&&i[t[4]];s[t[1]](function(){var e=n&&n.apply(this,arguments);e&&m(e.promise)?e.promise().progress(r.notify).done(r.resolve).fail(r.reject):r[t[0]+"With"](this,n?[e]:arguments)})}),i=null}).promise()},then:function(t,n,r){var u=0;function l(i,o,a,s){return function(){var n=this,r=arguments,e=function(){var e,t;if(!(i<u)){if((e=a.apply(n,r))===o.promise())throw new TypeError("Thenable self-resolution");t=e&&("object"==typeof e||"function"==typeof e)&&e.then,m(t)?s?t.call(e,l(u,o,R,s),l(u,o,M,s)):(u++,t.call(e,l(u,o,R,s),l(u,o,M,s),l(u,o,R,o.notifyWith))):(a!==R&&(n=void 0,r=[e]),(s||o.resolveWith)(n,r))}},t=s?e:function(){try{e()}catch(e){S.Deferred.exceptionHook&&S.Deferred.exceptionHook(e,t.stackTrace),u<=i+1&&(a!==M&&(n=void 0,r=[e]),o.rejectWith(n,r))}};i?t():(S.Deferred.getStackHook&&(t.stackTrace=S.Deferred.getStackHook()),C.setTimeout(t))}}return S.Deferred(function(e){o[0][3].add(l(0,e,m(r)?r:R,e.notifyWith)),o[1][3].add(l(0,e,m(t)?t:R)),o[2][3].add(l(0,e,m(n)?n:M))}).promise()},promise:function(e){return null!=e?S.extend(e,a):a}},s={};return S.each(o,function(e,t){var n=t[2],r=t[5];a[t[1]]=n.add,r&&n.add(function(){i=r},o[3-e][2].disable,o[3-e][3].disable,o[0][2].lock,o[0][3].lock),n.add(t[3].fire),s[t[0]]=function(){return s[t[0]+"With"](this===s?void 0:this,arguments),this},s[t[0]+"With"]=n.fireWith}),a.promise(s),e&&e.call(s,s),s},when:function(e){var n=arguments.length,t=n,r=Array(t),i=s.call(arguments),o=S.Deferred(),a=function(t){return function(e){r[t]=this,i[t]=1<arguments.length?s.call(arguments):e,--n||o.resolveWith(r,i)}};if(n<=1&&(I(e,o.done(a(t)).resolve,o.reject,!n),"pending"===o.state()||m(i[t]&&i[t].then)))return o.then();while(t--)I(i[t],a(t),o.reject);return o.promise()}});var W=/^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;S.Deferred.exceptionHook=function(e,t){C.console&&C.console.warn&&e&&W.test(e.name)&&C.console.warn("jQuery.Deferred exception: "+e.message,e.stack,t)},S.readyException=function(e){C.setTimeout(function(){throw e})};var F=S.Deferred();function B(){E.removeEventListener("DOMContentLoaded",B),C.removeEventListener("load",B),S.ready()}S.fn.ready=function(e){return F.then(e)["catch"](function(e){S.readyException(e)}),this},S.extend({isReady:!1,readyWait:1,ready:function(e){(!0===e?--S.readyWait:S.isReady)||(S.isReady=!0)!==e&&0<--S.readyWait||F.resolveWith(E,[S])}}),S.ready.then=F.then,"complete"===E.readyState||"loading"!==E.readyState&&!E.documentElement.doScroll?C.setTimeout(S.ready):(E.addEventListener("DOMContentLoaded",B),C.addEventListener("load",B));var $=function(e,t,n,r,i,o,a){var s=0,u=e.length,l=null==n;if("object"===w(n))for(s in i=!0,n)$(e,t,s,n[s],!0,o,a);else if(void 0!==r&&(i=!0,m(r)||(a=!0),l&&(a?(t.call(e,r),t=null):(l=t,t=function(e,t,n){return l.call(S(e),n)})),t))for(;s<u;s++)t(e[s],n,a?r:r.call(e[s],s,t(e[s],n)));return i?e:l?t.call(e):u?t(e[0],n):o},_=/^-ms-/,z=/-([a-z])/g;function U(e,t){return t.toUpperCase()}function X(e){return e.replace(_,"ms-").replace(z,U)}var V=function(e){return 1===e.nodeType||9===e.nodeType||!+e.nodeType};function G(){this.expando=S.expando+G.uid++}G.uid=1,G.prototype={cache:function(e){var t=e[this.expando];return t||(t={},V(e)&&(e.nodeType?e[this.expando]=t:Object.defineProperty(e,this.expando,{value:t,configurable:!0}))),t},set:function(e,t,n){var r,i=this.cache(e);if("string"==typeof t)i[X(t)]=n;else for(r in t)i[X(r)]=t[r];return i},get:function(e,t){return void 0===t?this.cache(e):e[this.expando]&&e[this.expando][X(t)]},access:function(e,t,n){return void 0===t||t&&"string"==typeof t&&void 0===n?this.get(e,t):(this.set(e,t,n),void 0!==n?n:t)},remove:function(e,t){var n,r=e[this.expando];if(void 0!==r){if(void 0!==t){n=(t=Array.isArray(t)?t.map(X):(t=X(t))in r?[t]:t.match(P)||[]).length;while(n--)delete r[t[n]]}(void 0===t||S.isEmptyObject(r))&&(e.nodeType?e[this.expando]=void 0:delete e[this.expando])}},hasData:function(e){var t=e[this.expando];return void 0!==t&&!S.isEmptyObject(t)}};var Y=new G,Q=new G,J=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,K=/[A-Z]/g;function Z(e,t,n){var r,i;if(void 0===n&&1===e.nodeType)if(r="data-"+t.replace(K,"-$&").toLowerCase(),"string"==typeof(n=e.getAttribute(r))){try{n="true"===(i=n)||"false"!==i&&("null"===i?null:i===+i+""?+i:J.test(i)?JSON.parse(i):i)}catch(e){}Q.set(e,t,n)}else n=void 0;return n}S.extend({hasData:function(e){return Q.hasData(e)||Y.hasData(e)},data:function(e,t,n){return Q.access(e,t,n)},removeData:function(e,t){Q.remove(e,t)},_data:function(e,t,n){return Y.access(e,t,n)},_removeData:function(e,t){Y.remove(e,t)}}),S.fn.extend({data:function(n,e){var t,r,i,o=this[0],a=o&&o.attributes;if(void 0===n){if(this.length&&(i=Q.get(o),1===o.nodeType&&!Y.get(o,"hasDataAttrs"))){t=a.length;while(t--)a[t]&&0===(r=a[t].name).indexOf("data-")&&(r=X(r.slice(5)),Z(o,r,i[r]));Y.set(o,"hasDataAttrs",!0)}return i}return"object"==typeof n?this.each(function(){Q.set(this,n)}):$(this,function(e){var t;if(o&&void 0===e)return void 0!==(t=Q.get(o,n))?t:void 0!==(t=Z(o,n))?t:void 0;this.each(function(){Q.set(this,n,e)})},null,e,1<arguments.length,null,!0)},removeData:function(e){return this.each(function(){Q.remove(this,e)})}}),S.extend({queue:function(e,t,n){var r;if(e)return t=(t||"fx")+"queue",r=Y.get(e,t),n&&(!r||Array.isArray(n)?r=Y.access(e,t,S.makeArray(n)):r.push(n)),r||[]},dequeue:function(e,t){t=t||"fx";var n=S.queue(e,t),r=n.length,i=n.shift(),o=S._queueHooks(e,t);"inprogress"===i&&(i=n.shift(),r--),i&&("fx"===t&&n.unshift("inprogress"),delete o.stop,i.call(e,function(){S.dequeue(e,t)},o)),!r&&o&&o.empty.fire()},_queueHooks:function(e,t){var n=t+"queueHooks";return Y.get(e,n)||Y.access(e,n,{empty:S.Callbacks("once memory").add(function(){Y.remove(e,[t+"queue",n])})})}}),S.fn.extend({queue:function(t,n){var e=2;return"string"!=typeof t&&(n=t,t="fx",e--),arguments.length<e?S.queue(this[0],t):void 0===n?this:this.each(function(){var e=S.queue(this,t,n);S._queueHooks(this,t),"fx"===t&&"inprogress"!==e[0]&&S.dequeue(this,t)})},dequeue:function(e){return this.each(function(){S.dequeue(this,e)})},clearQueue:function(e){return this.queue(e||"fx",[])},promise:function(e,t){var n,r=1,i=S.Deferred(),o=this,a=this.length,s=function(){--r||i.resolveWith(o,[o])};"string"!=typeof e&&(t=e,e=void 0),e=e||"fx";while(a--)(n=Y.get(o[a],e+"queueHooks"))&&n.empty&&(r++,n.empty.add(s));return s(),i.promise(t)}});var ee=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,te=new RegExp("^(?:([+-])=|)("+ee+")([a-z%]*)$","i"),ne=["Top","Right","Bottom","Left"],re=E.documentElement,ie=function(e){return S.contains(e.ownerDocument,e)},oe={composed:!0};re.getRootNode&&(ie=function(e){return S.contains(e.ownerDocument,e)||e.getRootNode(oe)===e.ownerDocument});var ae=function(e,t){return"none"===(e=t||e).style.display||""===e.style.display&&ie(e)&&"none"===S.css(e,"display")};function se(e,t,n,r){var i,o,a=20,s=r?function(){return r.cur()}:function(){return S.css(e,t,"")},u=s(),l=n&&n[3]||(S.cssNumber[t]?"":"px"),c=e.nodeType&&(S.cssNumber[t]||"px"!==l&&+u)&&te.exec(S.css(e,t));if(c&&c[3]!==l){u/=2,l=l||c[3],c=+u||1;while(a--)S.style(e,t,c+l),(1-o)*(1-(o=s()/u||.5))<=0&&(a=0),c/=o;c*=2,S.style(e,t,c+l),n=n||[]}return n&&(c=+c||+u||0,i=n[1]?c+(n[1]+1)*n[2]:+n[2],r&&(r.unit=l,r.start=c,r.end=i)),i}var ue={};function le(e,t){for(var n,r,i,o,a,s,u,l=[],c=0,f=e.length;c<f;c++)(r=e[c]).style&&(n=r.style.display,t?("none"===n&&(l[c]=Y.get(r,"display")||null,l[c]||(r.style.display="")),""===r.style.display&&ae(r)&&(l[c]=(u=a=o=void 0,a=(i=r).ownerDocument,s=i.nodeName,(u=ue[s])||(o=a.body.appendChild(a.createElement(s)),u=S.css(o,"display"),o.parentNode.removeChild(o),"none"===u&&(u="block"),ue[s]=u)))):"none"!==n&&(l[c]="none",Y.set(r,"display",n)));for(c=0;c<f;c++)null!=l[c]&&(e[c].style.display=l[c]);return e}S.fn.extend({show:function(){return le(this,!0)},hide:function(){return le(this)},toggle:function(e){return"boolean"==typeof e?e?this.show():this.hide():this.each(function(){ae(this)?S(this).show():S(this).hide()})}});var ce,fe,pe=/^(?:checkbox|radio)$/i,de=/<([a-z][^\/\0>\x20\t\r\n\f]*)/i,he=/^$|^module$|\/(?:java|ecma)script/i;ce=E.createDocumentFragment().appendChild(E.createElement("div")),(fe=E.createElement("input")).setAttribute("type","radio"),fe.setAttribute("checked","checked"),fe.setAttribute("name","t"),ce.appendChild(fe),y.checkClone=ce.cloneNode(!0).cloneNode(!0).lastChild.checked,ce.innerHTML="<textarea>x</textarea>",y.noCloneChecked=!!ce.cloneNode(!0).lastChild.defaultValue,ce.innerHTML="<option></option>",y.option=!!ce.lastChild;var ge={thead:[1,"<table>","</table>"],col:[2,"<table><colgroup>","</colgroup></table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:[0,"",""]};function ve(e,t){var n;return n="undefined"!=typeof e.getElementsByTagName?e.getElementsByTagName(t||"*"):"undefined"!=typeof e.querySelectorAll?e.querySelectorAll(t||"*"):[],void 0===t||t&&A(e,t)?S.merge([e],n):n}function ye(e,t){for(var n=0,r=e.length;n<r;n++)Y.set(e[n],"globalEval",!t||Y.get(t[n],"globalEval"))}ge.tbody=ge.tfoot=ge.colgroup=ge.caption=ge.thead,ge.th=ge.td,y.option||(ge.optgroup=ge.option=[1,"<select multiple='multiple'>","</select>"]);var me=/<|&#?\w+;/;function xe(e,t,n,r,i){for(var o,a,s,u,l,c,f=t.createDocumentFragment(),p=[],d=0,h=e.length;d<h;d++)if((o=e[d])||0===o)if("object"===w(o))S.merge(p,o.nodeType?[o]:o);else if(me.test(o)){a=a||f.appendChild(t.createElement("div")),s=(de.exec(o)||["",""])[1].toLowerCase(),u=ge[s]||ge._default,a.innerHTML=u[1]+S.htmlPrefilter(o)+u[2],c=u[0];while(c--)a=a.lastChild;S.merge(p,a.childNodes),(a=f.firstChild).textContent=""}else p.push(t.createTextNode(o));f.textContent="",d=0;while(o=p[d++])if(r&&-1<S.inArray(o,r))i&&i.push(o);else if(l=ie(o),a=ve(f.appendChild(o),"script"),l&&ye(a),n){c=0;while(o=a[c++])he.test(o.type||"")&&n.push(o)}return f}var be=/^key/,we=/^(?:mouse|pointer|contextmenu|drag|drop)|click/,Te=/^([^.]*)(?:\.(.+)|)/;function Ce(){return!0}function Ee(){return!1}function Se(e,t){return e===function(){try{return E.activeElement}catch(e){}}()==("focus"===t)}function ke(e,t,n,r,i,o){var a,s;if("object"==typeof t){for(s in"string"!=typeof n&&(r=r||n,n=void 0),t)ke(e,s,n,r,t[s],o);return e}if(null==r&&null==i?(i=n,r=n=void 0):null==i&&("string"==typeof n?(i=r,r=void 0):(i=r,r=n,n=void 0)),!1===i)i=Ee;else if(!i)return e;return 1===o&&(a=i,(i=function(e){return S().off(e),a.apply(this,arguments)}).guid=a.guid||(a.guid=S.guid++)),e.each(function(){S.event.add(this,t,i,r,n)})}function Ae(e,i,o){o?(Y.set(e,i,!1),S.event.add(e,i,{namespace:!1,handler:function(e){var t,n,r=Y.get(this,i);if(1&e.isTrigger&&this[i]){if(r.length)(S.event.special[i]||{}).delegateType&&e.stopPropagation();else if(r=s.call(arguments),Y.set(this,i,r),t=o(this,i),this[i](),r!==(n=Y.get(this,i))||t?Y.set(this,i,!1):n={},r!==n)return e.stopImmediatePropagation(),e.preventDefault(),n.value}else r.length&&(Y.set(this,i,{value:S.event.trigger(S.extend(r[0],S.Event.prototype),r.slice(1),this)}),e.stopImmediatePropagation())}})):void 0===Y.get(e,i)&&S.event.add(e,i,Ce)}S.event={global:{},add:function(t,e,n,r,i){var o,a,s,u,l,c,f,p,d,h,g,v=Y.get(t);if(V(t)){n.handler&&(n=(o=n).handler,i=o.selector),i&&S.find.matchesSelector(re,i),n.guid||(n.guid=S.guid++),(u=v.events)||(u=v.events=Object.create(null)),(a=v.handle)||(a=v.handle=function(e){return"undefined"!=typeof S&&S.event.triggered!==e.type?S.event.dispatch.apply(t,arguments):void 0}),l=(e=(e||"").match(P)||[""]).length;while(l--)d=g=(s=Te.exec(e[l])||[])[1],h=(s[2]||"").split(".").sort(),d&&(f=S.event.special[d]||{},d=(i?f.delegateType:f.bindType)||d,f=S.event.special[d]||{},c=S.extend({type:d,origType:g,data:r,handler:n,guid:n.guid,selector:i,needsContext:i&&S.expr.match.needsContext.test(i),namespace:h.join(".")},o),(p=u[d])||((p=u[d]=[]).delegateCount=0,f.setup&&!1!==f.setup.call(t,r,h,a)||t.addEventListener&&t.addEventListener(d,a)),f.add&&(f.add.call(t,c),c.handler.guid||(c.handler.guid=n.guid)),i?p.splice(p.delegateCount++,0,c):p.push(c),S.event.global[d]=!0)}},remove:function(e,t,n,r,i){var o,a,s,u,l,c,f,p,d,h,g,v=Y.hasData(e)&&Y.get(e);if(v&&(u=v.events)){l=(t=(t||"").match(P)||[""]).length;while(l--)if(d=g=(s=Te.exec(t[l])||[])[1],h=(s[2]||"").split(".").sort(),d){f=S.event.special[d]||{},p=u[d=(r?f.delegateType:f.bindType)||d]||[],s=s[2]&&new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"),a=o=p.length;while(o--)c=p[o],!i&&g!==c.origType||n&&n.guid!==c.guid||s&&!s.test(c.namespace)||r&&r!==c.selector&&("**"!==r||!c.selector)||(p.splice(o,1),c.selector&&p.delegateCount--,f.remove&&f.remove.call(e,c));a&&!p.length&&(f.teardown&&!1!==f.teardown.call(e,h,v.handle)||S.removeEvent(e,d,v.handle),delete u[d])}else for(d in u)S.event.remove(e,d+t[l],n,r,!0);S.isEmptyObject(u)&&Y.remove(e,"handle events")}},dispatch:function(e){var t,n,r,i,o,a,s=new Array(arguments.length),u=S.event.fix(e),l=(Y.get(this,"events")||Object.create(null))[u.type]||[],c=S.event.special[u.type]||{};for(s[0]=u,t=1;t<arguments.length;t++)s[t]=arguments[t];if(u.delegateTarget=this,!c.preDispatch||!1!==c.preDispatch.call(this,u)){a=S.event.handlers.call(this,u,l),t=0;while((i=a[t++])&&!u.isPropagationStopped()){u.currentTarget=i.elem,n=0;while((o=i.handlers[n++])&&!u.isImmediatePropagationStopped())u.rnamespace&&!1!==o.namespace&&!u.rnamespace.test(o.namespace)||(u.handleObj=o,u.data=o.data,void 0!==(r=((S.event.special[o.origType]||{}).handle||o.handler).apply(i.elem,s))&&!1===(u.result=r)&&(u.preventDefault(),u.stopPropagation()))}return c.postDispatch&&c.postDispatch.call(this,u),u.result}},handlers:function(e,t){var n,r,i,o,a,s=[],u=t.delegateCount,l=e.target;if(u&&l.nodeType&&!("click"===e.type&&1<=e.button))for(;l!==this;l=l.parentNode||this)if(1===l.nodeType&&("click"!==e.type||!0!==l.disabled)){for(o=[],a={},n=0;n<u;n++)void 0===a[i=(r=t[n]).selector+" "]&&(a[i]=r.needsContext?-1<S(i,this).index(l):S.find(i,this,null,[l]).length),a[i]&&o.push(r);o.length&&s.push({elem:l,handlers:o})}return l=this,u<t.length&&s.push({elem:l,handlers:t.slice(u)}),s},addProp:function(t,e){Object.defineProperty(S.Event.prototype,t,{enumerable:!0,configurable:!0,get:m(e)?function(){if(this.originalEvent)return e(this.originalEvent)}:function(){if(this.originalEvent)return this.originalEvent[t]},set:function(e){Object.defineProperty(this,t,{enumerable:!0,configurable:!0,writable:!0,value:e})}})},fix:function(e){return e[S.expando]?e:new S.Event(e)},special:{load:{noBubble:!0},click:{setup:function(e){var t=this||e;return pe.test(t.type)&&t.click&&A(t,"input")&&Ae(t,"click",Ce),!1},trigger:function(e){var t=this||e;return pe.test(t.type)&&t.click&&A(t,"input")&&Ae(t,"click"),!0},_default:function(e){var t=e.target;return pe.test(t.type)&&t.click&&A(t,"input")&&Y.get(t,"click")||A(t,"a")}},beforeunload:{postDispatch:function(e){void 0!==e.result&&e.originalEvent&&(e.originalEvent.returnValue=e.result)}}}},S.removeEvent=function(e,t,n){e.removeEventListener&&e.removeEventListener(t,n)},S.Event=function(e,t){if(!(this instanceof S.Event))return new S.Event(e,t);e&&e.type?(this.originalEvent=e,this.type=e.type,this.isDefaultPrevented=e.defaultPrevented||void 0===e.defaultPrevented&&!1===e.returnValue?Ce:Ee,this.target=e.target&&3===e.target.nodeType?e.target.parentNode:e.target,this.currentTarget=e.currentTarget,this.relatedTarget=e.relatedTarget):this.type=e,t&&S.extend(this,t),this.timeStamp=e&&e.timeStamp||Date.now(),this[S.expando]=!0},S.Event.prototype={constructor:S.Event,isDefaultPrevented:Ee,isPropagationStopped:Ee,isImmediatePropagationStopped:Ee,isSimulated:!1,preventDefault:function(){var e=this.originalEvent;this.isDefaultPrevented=Ce,e&&!this.isSimulated&&e.preventDefault()},stopPropagation:function(){var e=this.originalEvent;this.isPropagationStopped=Ce,e&&!this.isSimulated&&e.stopPropagation()},stopImmediatePropagation:function(){var e=this.originalEvent;this.isImmediatePropagationStopped=Ce,e&&!this.isSimulated&&e.stopImmediatePropagation(),this.stopPropagation()}},S.each({altKey:!0,bubbles:!0,cancelable:!0,changedTouches:!0,ctrlKey:!0,detail:!0,eventPhase:!0,metaKey:!0,pageX:!0,pageY:!0,shiftKey:!0,view:!0,"char":!0,code:!0,charCode:!0,key:!0,keyCode:!0,button:!0,buttons:!0,clientX:!0,clientY:!0,offsetX:!0,offsetY:!0,pointerId:!0,pointerType:!0,screenX:!0,screenY:!0,targetTouches:!0,toElement:!0,touches:!0,which:function(e){var t=e.button;return null==e.which&&be.test(e.type)?null!=e.charCode?e.charCode:e.keyCode:!e.which&&void 0!==t&&we.test(e.type)?1&t?1:2&t?3:4&t?2:0:e.which}},S.event.addProp),S.each({focus:"focusin",blur:"focusout"},function(e,t){S.event.special[e]={setup:function(){return Ae(this,e,Se),!1},trigger:function(){return Ae(this,e),!0},delegateType:t}}),S.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(e,i){S.event.special[e]={delegateType:i,bindType:i,handle:function(e){var t,n=e.relatedTarget,r=e.handleObj;return n&&(n===this||S.contains(this,n))||(e.type=r.origType,t=r.handler.apply(this,arguments),e.type=i),t}}}),S.fn.extend({on:function(e,t,n,r){return ke(this,e,t,n,r)},one:function(e,t,n,r){return ke(this,e,t,n,r,1)},off:function(e,t,n){var r,i;if(e&&e.preventDefault&&e.handleObj)return r=e.handleObj,S(e.delegateTarget).off(r.namespace?r.origType+"."+r.namespace:r.origType,r.selector,r.handler),this;if("object"==typeof e){for(i in e)this.off(i,t,e[i]);return this}return!1!==t&&"function"!=typeof t||(n=t,t=void 0),!1===n&&(n=Ee),this.each(function(){S.event.remove(this,e,n,t)})}});var Ne=/<script|<style|<link/i,De=/checked\s*(?:[^=]|=\s*.checked.)/i,je=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;function qe(e,t){return A(e,"table")&&A(11!==t.nodeType?t:t.firstChild,"tr")&&S(e).children("tbody")[0]||e}function Le(e){return e.type=(null!==e.getAttribute("type"))+"/"+e.type,e}function He(e){return"true/"===(e.type||"").slice(0,5)?e.type=e.type.slice(5):e.removeAttribute("type"),e}function Oe(e,t){var n,r,i,o,a,s;if(1===t.nodeType){if(Y.hasData(e)&&(s=Y.get(e).events))for(i in Y.remove(t,"handle events"),s)for(n=0,r=s[i].length;n<r;n++)S.event.add(t,i,s[i][n]);Q.hasData(e)&&(o=Q.access(e),a=S.extend({},o),Q.set(t,a))}}function Pe(n,r,i,o){r=g(r);var e,t,a,s,u,l,c=0,f=n.length,p=f-1,d=r[0],h=m(d);if(h||1<f&&"string"==typeof d&&!y.checkClone&&De.test(d))return n.each(function(e){var t=n.eq(e);h&&(r[0]=d.call(this,e,t.html())),Pe(t,r,i,o)});if(f&&(t=(e=xe(r,n[0].ownerDocument,!1,n,o)).firstChild,1===e.childNodes.length&&(e=t),t||o)){for(s=(a=S.map(ve(e,"script"),Le)).length;c<f;c++)u=e,c!==p&&(u=S.clone(u,!0,!0),s&&S.merge(a,ve(u,"script"))),i.call(n[c],u,c);if(s)for(l=a[a.length-1].ownerDocument,S.map(a,He),c=0;c<s;c++)u=a[c],he.test(u.type||"")&&!Y.access(u,"globalEval")&&S.contains(l,u)&&(u.src&&"module"!==(u.type||"").toLowerCase()?S._evalUrl&&!u.noModule&&S._evalUrl(u.src,{nonce:u.nonce||u.getAttribute("nonce")},l):b(u.textContent.replace(je,""),u,l))}return n}function Re(e,t,n){for(var r,i=t?S.filter(t,e):e,o=0;null!=(r=i[o]);o++)n||1!==r.nodeType||S.cleanData(ve(r)),r.parentNode&&(n&&ie(r)&&ye(ve(r,"script")),r.parentNode.removeChild(r));return e}S.extend({htmlPrefilter:function(e){return e},clone:function(e,t,n){var r,i,o,a,s,u,l,c=e.cloneNode(!0),f=ie(e);if(!(y.noCloneChecked||1!==e.nodeType&&11!==e.nodeType||S.isXMLDoc(e)))for(a=ve(c),r=0,i=(o=ve(e)).length;r<i;r++)s=o[r],u=a[r],void 0,"input"===(l=u.nodeName.toLowerCase())&&pe.test(s.type)?u.checked=s.checked:"input"!==l&&"textarea"!==l||(u.defaultValue=s.defaultValue);if(t)if(n)for(o=o||ve(e),a=a||ve(c),r=0,i=o.length;r<i;r++)Oe(o[r],a[r]);else Oe(e,c);return 0<(a=ve(c,"script")).length&&ye(a,!f&&ve(e,"script")),c},cleanData:function(e){for(var t,n,r,i=S.event.special,o=0;void 0!==(n=e[o]);o++)if(V(n)){if(t=n[Y.expando]){if(t.events)for(r in t.events)i[r]?S.event.remove(n,r):S.removeEvent(n,r,t.handle);n[Y.expando]=void 0}n[Q.expando]&&(n[Q.expando]=void 0)}}}),S.fn.extend({detach:function(e){return Re(this,e,!0)},remove:function(e){return Re(this,e)},text:function(e){return $(this,function(e){return void 0===e?S.text(this):this.empty().each(function(){1!==this.nodeType&&11!==this.nodeType&&9!==this.nodeType||(this.textContent=e)})},null,e,arguments.length)},append:function(){return Pe(this,arguments,function(e){1!==this.nodeType&&11!==this.nodeType&&9!==this.nodeType||qe(this,e).appendChild(e)})},prepend:function(){return Pe(this,arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=qe(this,e);t.insertBefore(e,t.firstChild)}})},before:function(){return Pe(this,arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this)})},after:function(){return Pe(this,arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this.nextSibling)})},empty:function(){for(var e,t=0;null!=(e=this[t]);t++)1===e.nodeType&&(S.cleanData(ve(e,!1)),e.textContent="");return this},clone:function(e,t){return e=null!=e&&e,t=null==t?e:t,this.map(function(){return S.clone(this,e,t)})},html:function(e){return $(this,function(e){var t=this[0]||{},n=0,r=this.length;if(void 0===e&&1===t.nodeType)return t.innerHTML;if("string"==typeof e&&!Ne.test(e)&&!ge[(de.exec(e)||["",""])[1].toLowerCase()]){e=S.htmlPrefilter(e);try{for(;n<r;n++)1===(t=this[n]||{}).nodeType&&(S.cleanData(ve(t,!1)),t.innerHTML=e);t=0}catch(e){}}t&&this.empty().append(e)},null,e,arguments.length)},replaceWith:function(){var n=[];return Pe(this,arguments,function(e){var t=this.parentNode;S.inArray(this,n)<0&&(S.cleanData(ve(this)),t&&t.replaceChild(e,this))},n)}}),S.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(e,a){S.fn[e]=function(e){for(var t,n=[],r=S(e),i=r.length-1,o=0;o<=i;o++)t=o===i?this:this.clone(!0),S(r[o])[a](t),u.apply(n,t.get());return this.pushStack(n)}});var Me=new RegExp("^("+ee+")(?!px)[a-z%]+$","i"),Ie=function(e){var t=e.ownerDocument.defaultView;return t&&t.opener||(t=C),t.getComputedStyle(e)},We=function(e,t,n){var r,i,o={};for(i in t)o[i]=e.style[i],e.style[i]=t[i];for(i in r=n.call(e),t)e.style[i]=o[i];return r},Fe=new RegExp(ne.join("|"),"i");function Be(e,t,n){var r,i,o,a,s=e.style;return(n=n||Ie(e))&&(""!==(a=n.getPropertyValue(t)||n[t])||ie(e)||(a=S.style(e,t)),!y.pixelBoxStyles()&&Me.test(a)&&Fe.test(t)&&(r=s.width,i=s.minWidth,o=s.maxWidth,s.minWidth=s.maxWidth=s.width=a,a=n.width,s.width=r,s.minWidth=i,s.maxWidth=o)),void 0!==a?a+"":a}function $e(e,t){return{get:function(){if(!e())return(this.get=t).apply(this,arguments);delete this.get}}}!function(){function e(){if(l){u.style.cssText="position:absolute;left:-11111px;width:60px;margin-top:1px;padding:0;border:0",l.style.cssText="position:relative;display:block;box-sizing:border-box;overflow:scroll;margin:auto;border:1px;padding:1px;width:60%;top:1%",re.appendChild(u).appendChild(l);var e=C.getComputedStyle(l);n="1%"!==e.top,s=12===t(e.marginLeft),l.style.right="60%",o=36===t(e.right),r=36===t(e.width),l.style.position="absolute",i=12===t(l.offsetWidth/3),re.removeChild(u),l=null}}function t(e){return Math.round(parseFloat(e))}var n,r,i,o,a,s,u=E.createElement("div"),l=E.createElement("div");l.style&&(l.style.backgroundClip="content-box",l.cloneNode(!0).style.backgroundClip="",y.clearCloneStyle="content-box"===l.style.backgroundClip,S.extend(y,{boxSizingReliable:function(){return e(),r},pixelBoxStyles:function(){return e(),o},pixelPosition:function(){return e(),n},reliableMarginLeft:function(){return e(),s},scrollboxSize:function(){return e(),i},reliableTrDimensions:function(){var e,t,n,r;return null==a&&(e=E.createElement("table"),t=E.createElement("tr"),n=E.createElement("div"),e.style.cssText="position:absolute;left:-11111px",t.style.height="1px",n.style.height="9px",re.appendChild(e).appendChild(t).appendChild(n),r=C.getComputedStyle(t),a=3<parseInt(r.height),re.removeChild(e)),a}}))}();var _e=["Webkit","Moz","ms"],ze=E.createElement("div").style,Ue={};function Xe(e){var t=S.cssProps[e]||Ue[e];return t||(e in ze?e:Ue[e]=function(e){var t=e[0].toUpperCase()+e.slice(1),n=_e.length;while(n--)if((e=_e[n]+t)in ze)return e}(e)||e)}var Ve=/^(none|table(?!-c[ea]).+)/,Ge=/^--/,Ye={position:"absolute",visibility:"hidden",display:"block"},Qe={letterSpacing:"0",fontWeight:"400"};function Je(e,t,n){var r=te.exec(t);return r?Math.max(0,r[2]-(n||0))+(r[3]||"px"):t}function Ke(e,t,n,r,i,o){var a="width"===t?1:0,s=0,u=0;if(n===(r?"border":"content"))return 0;for(;a<4;a+=2)"margin"===n&&(u+=S.css(e,n+ne[a],!0,i)),r?("content"===n&&(u-=S.css(e,"padding"+ne[a],!0,i)),"margin"!==n&&(u-=S.css(e,"border"+ne[a]+"Width",!0,i))):(u+=S.css(e,"padding"+ne[a],!0,i),"padding"!==n?u+=S.css(e,"border"+ne[a]+"Width",!0,i):s+=S.css(e,"border"+ne[a]+"Width",!0,i));return!r&&0<=o&&(u+=Math.max(0,Math.ceil(e["offset"+t[0].toUpperCase()+t.slice(1)]-o-u-s-.5))||0),u}function Ze(e,t,n){var r=Ie(e),i=(!y.boxSizingReliable()||n)&&"border-box"===S.css(e,"boxSizing",!1,r),o=i,a=Be(e,t,r),s="offset"+t[0].toUpperCase()+t.slice(1);if(Me.test(a)){if(!n)return a;a="auto"}return(!y.boxSizingReliable()&&i||!y.reliableTrDimensions()&&A(e,"tr")||"auto"===a||!parseFloat(a)&&"inline"===S.css(e,"display",!1,r))&&e.getClientRects().length&&(i="border-box"===S.css(e,"boxSizing",!1,r),(o=s in e)&&(a=e[s])),(a=parseFloat(a)||0)+Ke(e,t,n||(i?"border":"content"),o,r,a)+"px"}function et(e,t,n,r,i){return new et.prototype.init(e,t,n,r,i)}S.extend({cssHooks:{opacity:{get:function(e,t){if(t){var n=Be(e,"opacity");return""===n?"1":n}}}},cssNumber:{animationIterationCount:!0,columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,gridArea:!0,gridColumn:!0,gridColumnEnd:!0,gridColumnStart:!0,gridRow:!0,gridRowEnd:!0,gridRowStart:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{},style:function(e,t,n,r){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var i,o,a,s=X(t),u=Ge.test(t),l=e.style;if(u||(t=Xe(s)),a=S.cssHooks[t]||S.cssHooks[s],void 0===n)return a&&"get"in a&&void 0!==(i=a.get(e,!1,r))?i:l[t];"string"===(o=typeof n)&&(i=te.exec(n))&&i[1]&&(n=se(e,t,i),o="number"),null!=n&&n==n&&("number"!==o||u||(n+=i&&i[3]||(S.cssNumber[s]?"":"px")),y.clearCloneStyle||""!==n||0!==t.indexOf("background")||(l[t]="inherit"),a&&"set"in a&&void 0===(n=a.set(e,n,r))||(u?l.setProperty(t,n):l[t]=n))}},css:function(e,t,n,r){var i,o,a,s=X(t);return Ge.test(t)||(t=Xe(s)),(a=S.cssHooks[t]||S.cssHooks[s])&&"get"in a&&(i=a.get(e,!0,n)),void 0===i&&(i=Be(e,t,r)),"normal"===i&&t in Qe&&(i=Qe[t]),""===n||n?(o=parseFloat(i),!0===n||isFinite(o)?o||0:i):i}}),S.each(["height","width"],function(e,u){S.cssHooks[u]={get:function(e,t,n){if(t)return!Ve.test(S.css(e,"display"))||e.getClientRects().length&&e.getBoundingClientRect().width?Ze(e,u,n):We(e,Ye,function(){return Ze(e,u,n)})},set:function(e,t,n){var r,i=Ie(e),o=!y.scrollboxSize()&&"absolute"===i.position,a=(o||n)&&"border-box"===S.css(e,"boxSizing",!1,i),s=n?Ke(e,u,n,a,i):0;return a&&o&&(s-=Math.ceil(e["offset"+u[0].toUpperCase()+u.slice(1)]-parseFloat(i[u])-Ke(e,u,"border",!1,i)-.5)),s&&(r=te.exec(t))&&"px"!==(r[3]||"px")&&(e.style[u]=t,t=S.css(e,u)),Je(0,t,s)}}}),S.cssHooks.marginLeft=$e(y.reliableMarginLeft,function(e,t){if(t)return(parseFloat(Be(e,"marginLeft"))||e.getBoundingClientRect().left-We(e,{marginLeft:0},function(){return e.getBoundingClientRect().left}))+"px"}),S.each({margin:"",padding:"",border:"Width"},function(i,o){S.cssHooks[i+o]={expand:function(e){for(var t=0,n={},r="string"==typeof e?e.split(" "):[e];t<4;t++)n[i+ne[t]+o]=r[t]||r[t-2]||r[0];return n}},"margin"!==i&&(S.cssHooks[i+o].set=Je)}),S.fn.extend({css:function(e,t){return $(this,function(e,t,n){var r,i,o={},a=0;if(Array.isArray(t)){for(r=Ie(e),i=t.length;a<i;a++)o[t[a]]=S.css(e,t[a],!1,r);return o}return void 0!==n?S.style(e,t,n):S.css(e,t)},e,t,1<arguments.length)}}),((S.Tween=et).prototype={constructor:et,init:function(e,t,n,r,i,o){this.elem=e,this.prop=n,this.easing=i||S.easing._default,this.options=t,this.start=this.now=this.cur(),this.end=r,this.unit=o||(S.cssNumber[n]?"":"px")},cur:function(){var e=et.propHooks[this.prop];return e&&e.get?e.get(this):et.propHooks._default.get(this)},run:function(e){var t,n=et.propHooks[this.prop];return this.options.duration?this.pos=t=S.easing[this.easing](e,this.options.duration*e,0,1,this.options.duration):this.pos=t=e,this.now=(this.end-this.start)*t+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),n&&n.set?n.set(this):et.propHooks._default.set(this),this}}).init.prototype=et.prototype,(et.propHooks={_default:{get:function(e){var t;return 1!==e.elem.nodeType||null!=e.elem[e.prop]&&null==e.elem.style[e.prop]?e.elem[e.prop]:(t=S.css(e.elem,e.prop,""))&&"auto"!==t?t:0},set:function(e){S.fx.step[e.prop]?S.fx.step[e.prop](e):1!==e.elem.nodeType||!S.cssHooks[e.prop]&&null==e.elem.style[Xe(e.prop)]?e.elem[e.prop]=e.now:S.style(e.elem,e.prop,e.now+e.unit)}}}).scrollTop=et.propHooks.scrollLeft={set:function(e){e.elem.nodeType&&e.elem.parentNode&&(e.elem[e.prop]=e.now)}},S.easing={linear:function(e){return e},swing:function(e){return.5-Math.cos(e*Math.PI)/2},_default:"swing"},S.fx=et.prototype.init,S.fx.step={};var tt,nt,rt,it,ot=/^(?:toggle|show|hide)$/,at=/queueHooks$/;function st(){nt&&(!1===E.hidden&&C.requestAnimationFrame?C.requestAnimationFrame(st):C.setTimeout(st,S.fx.interval),S.fx.tick())}function ut(){return C.setTimeout(function(){tt=void 0}),tt=Date.now()}function lt(e,t){var n,r=0,i={height:e};for(t=t?1:0;r<4;r+=2-t)i["margin"+(n=ne[r])]=i["padding"+n]=e;return t&&(i.opacity=i.width=e),i}function ct(e,t,n){for(var r,i=(ft.tweeners[t]||[]).concat(ft.tweeners["*"]),o=0,a=i.length;o<a;o++)if(r=i[o].call(n,t,e))return r}function ft(o,e,t){var n,a,r=0,i=ft.prefilters.length,s=S.Deferred().always(function(){delete u.elem}),u=function(){if(a)return!1;for(var e=tt||ut(),t=Math.max(0,l.startTime+l.duration-e),n=1-(t/l.duration||0),r=0,i=l.tweens.length;r<i;r++)l.tweens[r].run(n);return s.notifyWith(o,[l,n,t]),n<1&&i?t:(i||s.notifyWith(o,[l,1,0]),s.resolveWith(o,[l]),!1)},l=s.promise({elem:o,props:S.extend({},e),opts:S.extend(!0,{specialEasing:{},easing:S.easing._default},t),originalProperties:e,originalOptions:t,startTime:tt||ut(),duration:t.duration,tweens:[],createTween:function(e,t){var n=S.Tween(o,l.opts,e,t,l.opts.specialEasing[e]||l.opts.easing);return l.tweens.push(n),n},stop:function(e){var t=0,n=e?l.tweens.length:0;if(a)return this;for(a=!0;t<n;t++)l.tweens[t].run(1);return e?(s.notifyWith(o,[l,1,0]),s.resolveWith(o,[l,e])):s.rejectWith(o,[l,e]),this}}),c=l.props;for(!function(e,t){var n,r,i,o,a;for(n in e)if(i=t[r=X(n)],o=e[n],Array.isArray(o)&&(i=o[1],o=e[n]=o[0]),n!==r&&(e[r]=o,delete e[n]),(a=S.cssHooks[r])&&"expand"in a)for(n in o=a.expand(o),delete e[r],o)n in e||(e[n]=o[n],t[n]=i);else t[r]=i}(c,l.opts.specialEasing);r<i;r++)if(n=ft.prefilters[r].call(l,o,c,l.opts))return m(n.stop)&&(S._queueHooks(l.elem,l.opts.queue).stop=n.stop.bind(n)),n;return S.map(c,ct,l),m(l.opts.start)&&l.opts.start.call(o,l),l.progress(l.opts.progress).done(l.opts.done,l.opts.complete).fail(l.opts.fail).always(l.opts.always),S.fx.timer(S.extend(u,{elem:o,anim:l,queue:l.opts.queue})),l}S.Animation=S.extend(ft,{tweeners:{"*":[function(e,t){var n=this.createTween(e,t);return se(n.elem,e,te.exec(t),n),n}]},tweener:function(e,t){m(e)?(t=e,e=["*"]):e=e.match(P);for(var n,r=0,i=e.length;r<i;r++)n=e[r],ft.tweeners[n]=ft.tweeners[n]||[],ft.tweeners[n].unshift(t)},prefilters:[function(e,t,n){var r,i,o,a,s,u,l,c,f="width"in t||"height"in t,p=this,d={},h=e.style,g=e.nodeType&&ae(e),v=Y.get(e,"fxshow");for(r in n.queue||(null==(a=S._queueHooks(e,"fx")).unqueued&&(a.unqueued=0,s=a.empty.fire,a.empty.fire=function(){a.unqueued||s()}),a.unqueued++,p.always(function(){p.always(function(){a.unqueued--,S.queue(e,"fx").length||a.empty.fire()})})),t)if(i=t[r],ot.test(i)){if(delete t[r],o=o||"toggle"===i,i===(g?"hide":"show")){if("show"!==i||!v||void 0===v[r])continue;g=!0}d[r]=v&&v[r]||S.style(e,r)}if((u=!S.isEmptyObject(t))||!S.isEmptyObject(d))for(r in f&&1===e.nodeType&&(n.overflow=[h.overflow,h.overflowX,h.overflowY],null==(l=v&&v.display)&&(l=Y.get(e,"display")),"none"===(c=S.css(e,"display"))&&(l?c=l:(le([e],!0),l=e.style.display||l,c=S.css(e,"display"),le([e]))),("inline"===c||"inline-block"===c&&null!=l)&&"none"===S.css(e,"float")&&(u||(p.done(function(){h.display=l}),null==l&&(c=h.display,l="none"===c?"":c)),h.display="inline-block")),n.overflow&&(h.overflow="hidden",p.always(function(){h.overflow=n.overflow[0],h.overflowX=n.overflow[1],h.overflowY=n.overflow[2]})),u=!1,d)u||(v?"hidden"in v&&(g=v.hidden):v=Y.access(e,"fxshow",{display:l}),o&&(v.hidden=!g),g&&le([e],!0),p.done(function(){for(r in g||le([e]),Y.remove(e,"fxshow"),d)S.style(e,r,d[r])})),u=ct(g?v[r]:0,r,p),r in v||(v[r]=u.start,g&&(u.end=u.start,u.start=0))}],prefilter:function(e,t){t?ft.prefilters.unshift(e):ft.prefilters.push(e)}}),S.speed=function(e,t,n){var r=e&&"object"==typeof e?S.extend({},e):{complete:n||!n&&t||m(e)&&e,duration:e,easing:n&&t||t&&!m(t)&&t};return S.fx.off?r.duration=0:"number"!=typeof r.duration&&(r.duration in S.fx.speeds?r.duration=S.fx.speeds[r.duration]:r.duration=S.fx.speeds._default),null!=r.queue&&!0!==r.queue||(r.queue="fx"),r.old=r.complete,r.complete=function(){m(r.old)&&r.old.call(this),r.queue&&S.dequeue(this,r.queue)},r},S.fn.extend({fadeTo:function(e,t,n,r){return this.filter(ae).css("opacity",0).show().end().animate({opacity:t},e,n,r)},animate:function(t,e,n,r){var i=S.isEmptyObject(t),o=S.speed(e,n,r),a=function(){var e=ft(this,S.extend({},t),o);(i||Y.get(this,"finish"))&&e.stop(!0)};return a.finish=a,i||!1===o.queue?this.each(a):this.queue(o.queue,a)},stop:function(i,e,o){var a=function(e){var t=e.stop;delete e.stop,t(o)};return"string"!=typeof i&&(o=e,e=i,i=void 0),e&&this.queue(i||"fx",[]),this.each(function(){var e=!0,t=null!=i&&i+"queueHooks",n=S.timers,r=Y.get(this);if(t)r[t]&&r[t].stop&&a(r[t]);else for(t in r)r[t]&&r[t].stop&&at.test(t)&&a(r[t]);for(t=n.length;t--;)n[t].elem!==this||null!=i&&n[t].queue!==i||(n[t].anim.stop(o),e=!1,n.splice(t,1));!e&&o||S.dequeue(this,i)})},finish:function(a){return!1!==a&&(a=a||"fx"),this.each(function(){var e,t=Y.get(this),n=t[a+"queue"],r=t[a+"queueHooks"],i=S.timers,o=n?n.length:0;for(t.finish=!0,S.queue(this,a,[]),r&&r.stop&&r.stop.call(this,!0),e=i.length;e--;)i[e].elem===this&&i[e].queue===a&&(i[e].anim.stop(!0),i.splice(e,1));for(e=0;e<o;e++)n[e]&&n[e].finish&&n[e].finish.call(this);delete t.finish})}}),S.each(["toggle","show","hide"],function(e,r){var i=S.fn[r];S.fn[r]=function(e,t,n){return null==e||"boolean"==typeof e?i.apply(this,arguments):this.animate(lt(r,!0),e,t,n)}}),S.each({slideDown:lt("show"),slideUp:lt("hide"),slideToggle:lt("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(e,r){S.fn[e]=function(e,t,n){return this.animate(r,e,t,n)}}),S.timers=[],S.fx.tick=function(){var e,t=0,n=S.timers;for(tt=Date.now();t<n.length;t++)(e=n[t])()||n[t]!==e||n.splice(t--,1);n.length||S.fx.stop(),tt=void 0},S.fx.timer=function(e){S.timers.push(e),S.fx.start()},S.fx.interval=13,S.fx.start=function(){nt||(nt=!0,st())},S.fx.stop=function(){nt=null},S.fx.speeds={slow:600,fast:200,_default:400},S.fn.delay=function(r,e){return r=S.fx&&S.fx.speeds[r]||r,e=e||"fx",this.queue(e,function(e,t){var n=C.setTimeout(e,r);t.stop=function(){C.clearTimeout(n)}})},rt=E.createElement("input"),it=E.createElement("select").appendChild(E.createElement("option")),rt.type="checkbox",y.checkOn=""!==rt.value,y.optSelected=it.selected,(rt=E.createElement("input")).value="t",rt.type="radio",y.radioValue="t"===rt.value;var pt,dt=S.expr.attrHandle;S.fn.extend({attr:function(e,t){return $(this,S.attr,e,t,1<arguments.length)},removeAttr:function(e){return this.each(function(){S.removeAttr(this,e)})}}),S.extend({attr:function(e,t,n){var r,i,o=e.nodeType;if(3!==o&&8!==o&&2!==o)return"undefined"==typeof e.getAttribute?S.prop(e,t,n):(1===o&&S.isXMLDoc(e)||(i=S.attrHooks[t.toLowerCase()]||(S.expr.match.bool.test(t)?pt:void 0)),void 0!==n?null===n?void S.removeAttr(e,t):i&&"set"in i&&void 0!==(r=i.set(e,n,t))?r:(e.setAttribute(t,n+""),n):i&&"get"in i&&null!==(r=i.get(e,t))?r:null==(r=S.find.attr(e,t))?void 0:r)},attrHooks:{type:{set:function(e,t){if(!y.radioValue&&"radio"===t&&A(e,"input")){var n=e.value;return e.setAttribute("type",t),n&&(e.value=n),t}}}},removeAttr:function(e,t){var n,r=0,i=t&&t.match(P);if(i&&1===e.nodeType)while(n=i[r++])e.removeAttribute(n)}}),pt={set:function(e,t,n){return!1===t?S.removeAttr(e,n):e.setAttribute(n,n),n}},S.each(S.expr.match.bool.source.match(/\w+/g),function(e,t){var a=dt[t]||S.find.attr;dt[t]=function(e,t,n){var r,i,o=t.toLowerCase();return n||(i=dt[o],dt[o]=r,r=null!=a(e,t,n)?o:null,dt[o]=i),r}});var ht=/^(?:input|select|textarea|button)$/i,gt=/^(?:a|area)$/i;function vt(e){return(e.match(P)||[]).join(" ")}function yt(e){return e.getAttribute&&e.getAttribute("class")||""}function mt(e){return Array.isArray(e)?e:"string"==typeof e&&e.match(P)||[]}S.fn.extend({prop:function(e,t){return $(this,S.prop,e,t,1<arguments.length)},removeProp:function(e){return this.each(function(){delete this[S.propFix[e]||e]})}}),S.extend({prop:function(e,t,n){var r,i,o=e.nodeType;if(3!==o&&8!==o&&2!==o)return 1===o&&S.isXMLDoc(e)||(t=S.propFix[t]||t,i=S.propHooks[t]),void 0!==n?i&&"set"in i&&void 0!==(r=i.set(e,n,t))?r:e[t]=n:i&&"get"in i&&null!==(r=i.get(e,t))?r:e[t]},propHooks:{tabIndex:{get:function(e){var t=S.find.attr(e,"tabindex");return t?parseInt(t,10):ht.test(e.nodeName)||gt.test(e.nodeName)&&e.href?0:-1}}},propFix:{"for":"htmlFor","class":"className"}}),y.optSelected||(S.propHooks.selected={get:function(e){var t=e.parentNode;return t&&t.parentNode&&t.parentNode.selectedIndex,null},set:function(e){var t=e.parentNode;t&&(t.selectedIndex,t.parentNode&&t.parentNode.selectedIndex)}}),S.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){S.propFix[this.toLowerCase()]=this}),S.fn.extend({addClass:function(t){var e,n,r,i,o,a,s,u=0;if(m(t))return this.each(function(e){S(this).addClass(t.call(this,e,yt(this)))});if((e=mt(t)).length)while(n=this[u++])if(i=yt(n),r=1===n.nodeType&&" "+vt(i)+" "){a=0;while(o=e[a++])r.indexOf(" "+o+" ")<0&&(r+=o+" ");i!==(s=vt(r))&&n.setAttribute("class",s)}return this},removeClass:function(t){var e,n,r,i,o,a,s,u=0;if(m(t))return this.each(function(e){S(this).removeClass(t.call(this,e,yt(this)))});if(!arguments.length)return this.attr("class","");if((e=mt(t)).length)while(n=this[u++])if(i=yt(n),r=1===n.nodeType&&" "+vt(i)+" "){a=0;while(o=e[a++])while(-1<r.indexOf(" "+o+" "))r=r.replace(" "+o+" "," ");i!==(s=vt(r))&&n.setAttribute("class",s)}return this},toggleClass:function(i,t){var o=typeof i,a="string"===o||Array.isArray(i);return"boolean"==typeof t&&a?t?this.addClass(i):this.removeClass(i):m(i)?this.each(function(e){S(this).toggleClass(i.call(this,e,yt(this),t),t)}):this.each(function(){var e,t,n,r;if(a){t=0,n=S(this),r=mt(i);while(e=r[t++])n.hasClass(e)?n.removeClass(e):n.addClass(e)}else void 0!==i&&"boolean"!==o||((e=yt(this))&&Y.set(this,"__className__",e),this.setAttribute&&this.setAttribute("class",e||!1===i?"":Y.get(this,"__className__")||""))})},hasClass:function(e){var t,n,r=0;t=" "+e+" ";while(n=this[r++])if(1===n.nodeType&&-1<(" "+vt(yt(n))+" ").indexOf(t))return!0;return!1}});var xt=/\r/g;S.fn.extend({val:function(n){var r,e,i,t=this[0];return arguments.length?(i=m(n),this.each(function(e){var t;1===this.nodeType&&(null==(t=i?n.call(this,e,S(this).val()):n)?t="":"number"==typeof t?t+="":Array.isArray(t)&&(t=S.map(t,function(e){return null==e?"":e+""})),(r=S.valHooks[this.type]||S.valHooks[this.nodeName.toLowerCase()])&&"set"in r&&void 0!==r.set(this,t,"value")||(this.value=t))})):t?(r=S.valHooks[t.type]||S.valHooks[t.nodeName.toLowerCase()])&&"get"in r&&void 0!==(e=r.get(t,"value"))?e:"string"==typeof(e=t.value)?e.replace(xt,""):null==e?"":e:void 0}}),S.extend({valHooks:{option:{get:function(e){var t=S.find.attr(e,"value");return null!=t?t:vt(S.text(e))}},select:{get:function(e){var t,n,r,i=e.options,o=e.selectedIndex,a="select-one"===e.type,s=a?null:[],u=a?o+1:i.length;for(r=o<0?u:a?o:0;r<u;r++)if(((n=i[r]).selected||r===o)&&!n.disabled&&(!n.parentNode.disabled||!A(n.parentNode,"optgroup"))){if(t=S(n).val(),a)return t;s.push(t)}return s},set:function(e,t){var n,r,i=e.options,o=S.makeArray(t),a=i.length;while(a--)((r=i[a]).selected=-1<S.inArray(S.valHooks.option.get(r),o))&&(n=!0);return n||(e.selectedIndex=-1),o}}}}),S.each(["radio","checkbox"],function(){S.valHooks[this]={set:function(e,t){if(Array.isArray(t))return e.checked=-1<S.inArray(S(e).val(),t)}},y.checkOn||(S.valHooks[this].get=function(e){return null===e.getAttribute("value")?"on":e.value})}),y.focusin="onfocusin"in C;var bt=/^(?:focusinfocus|focusoutblur)$/,wt=function(e){e.stopPropagation()};S.extend(S.event,{trigger:function(e,t,n,r){var i,o,a,s,u,l,c,f,p=[n||E],d=v.call(e,"type")?e.type:e,h=v.call(e,"namespace")?e.namespace.split("."):[];if(o=f=a=n=n||E,3!==n.nodeType&&8!==n.nodeType&&!bt.test(d+S.event.triggered)&&(-1<d.indexOf(".")&&(d=(h=d.split(".")).shift(),h.sort()),u=d.indexOf(":")<0&&"on"+d,(e=e[S.expando]?e:new S.Event(d,"object"==typeof e&&e)).isTrigger=r?2:3,e.namespace=h.join("."),e.rnamespace=e.namespace?new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,e.result=void 0,e.target||(e.target=n),t=null==t?[e]:S.makeArray(t,[e]),c=S.event.special[d]||{},r||!c.trigger||!1!==c.trigger.apply(n,t))){if(!r&&!c.noBubble&&!x(n)){for(s=c.delegateType||d,bt.test(s+d)||(o=o.parentNode);o;o=o.parentNode)p.push(o),a=o;a===(n.ownerDocument||E)&&p.push(a.defaultView||a.parentWindow||C)}i=0;while((o=p[i++])&&!e.isPropagationStopped())f=o,e.type=1<i?s:c.bindType||d,(l=(Y.get(o,"events")||Object.create(null))[e.type]&&Y.get(o,"handle"))&&l.apply(o,t),(l=u&&o[u])&&l.apply&&V(o)&&(e.result=l.apply(o,t),!1===e.result&&e.preventDefault());return e.type=d,r||e.isDefaultPrevented()||c._default&&!1!==c._default.apply(p.pop(),t)||!V(n)||u&&m(n[d])&&!x(n)&&((a=n[u])&&(n[u]=null),S.event.triggered=d,e.isPropagationStopped()&&f.addEventListener(d,wt),n[d](),e.isPropagationStopped()&&f.removeEventListener(d,wt),S.event.triggered=void 0,a&&(n[u]=a)),e.result}},simulate:function(e,t,n){var r=S.extend(new S.Event,n,{type:e,isSimulated:!0});S.event.trigger(r,null,t)}}),S.fn.extend({trigger:function(e,t){return this.each(function(){S.event.trigger(e,t,this)})},triggerHandler:function(e,t){var n=this[0];if(n)return S.event.trigger(e,t,n,!0)}}),y.focusin||S.each({focus:"focusin",blur:"focusout"},function(n,r){var i=function(e){S.event.simulate(r,e.target,S.event.fix(e))};S.event.special[r]={setup:function(){var e=this.ownerDocument||this.document||this,t=Y.access(e,r);t||e.addEventListener(n,i,!0),Y.access(e,r,(t||0)+1)},teardown:function(){var e=this.ownerDocument||this.document||this,t=Y.access(e,r)-1;t?Y.access(e,r,t):(e.removeEventListener(n,i,!0),Y.remove(e,r))}}});var Tt=C.location,Ct={guid:Date.now()},Et=/\?/;S.parseXML=function(e){var t;if(!e||"string"!=typeof e)return null;try{t=(new C.DOMParser).parseFromString(e,"text/xml")}catch(e){t=void 0}return t&&!t.getElementsByTagName("parsererror").length||S.error("Invalid XML: "+e),t};var St=/\[\]$/,kt=/\r?\n/g,At=/^(?:submit|button|image|reset|file)$/i,Nt=/^(?:input|select|textarea|keygen)/i;function Dt(n,e,r,i){var t;if(Array.isArray(e))S.each(e,function(e,t){r||St.test(n)?i(n,t):Dt(n+"["+("object"==typeof t&&null!=t?e:"")+"]",t,r,i)});else if(r||"object"!==w(e))i(n,e);else for(t in e)Dt(n+"["+t+"]",e[t],r,i)}S.param=function(e,t){var n,r=[],i=function(e,t){var n=m(t)?t():t;r[r.length]=encodeURIComponent(e)+"="+encodeURIComponent(null==n?"":n)};if(null==e)return"";if(Array.isArray(e)||e.jquery&&!S.isPlainObject(e))S.each(e,function(){i(this.name,this.value)});else for(n in e)Dt(n,e[n],t,i);return r.join("&")},S.fn.extend({serialize:function(){return S.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var e=S.prop(this,"elements");return e?S.makeArray(e):this}).filter(function(){var e=this.type;return this.name&&!S(this).is(":disabled")&&Nt.test(this.nodeName)&&!At.test(e)&&(this.checked||!pe.test(e))}).map(function(e,t){var n=S(this).val();return null==n?null:Array.isArray(n)?S.map(n,function(e){return{name:t.name,value:e.replace(kt,"\r\n")}}):{name:t.name,value:n.replace(kt,"\r\n")}}).get()}});var jt=/%20/g,qt=/#.*$/,Lt=/([?&])_=[^&]*/,Ht=/^(.*?):[ \t]*([^\r\n]*)$/gm,Ot=/^(?:GET|HEAD)$/,Pt=/^\/\//,Rt={},Mt={},It="*/".concat("*"),Wt=E.createElement("a");function Ft(o){return function(e,t){"string"!=typeof e&&(t=e,e="*");var n,r=0,i=e.toLowerCase().match(P)||[];if(m(t))while(n=i[r++])"+"===n[0]?(n=n.slice(1)||"*",(o[n]=o[n]||[]).unshift(t)):(o[n]=o[n]||[]).push(t)}}function Bt(t,i,o,a){var s={},u=t===Mt;function l(e){var r;return s[e]=!0,S.each(t[e]||[],function(e,t){var n=t(i,o,a);return"string"!=typeof n||u||s[n]?u?!(r=n):void 0:(i.dataTypes.unshift(n),l(n),!1)}),r}return l(i.dataTypes[0])||!s["*"]&&l("*")}function $t(e,t){var n,r,i=S.ajaxSettings.flatOptions||{};for(n in t)void 0!==t[n]&&((i[n]?e:r||(r={}))[n]=t[n]);return r&&S.extend(!0,e,r),e}Wt.href=Tt.href,S.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:Tt.href,type:"GET",isLocal:/^(?:about|app|app-storage|.+-extension|file|res|widget):$/.test(Tt.protocol),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":It,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/\bxml\b/,html:/\bhtml/,json:/\bjson\b/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":JSON.parse,"text xml":S.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(e,t){return t?$t($t(e,S.ajaxSettings),t):$t(S.ajaxSettings,e)},ajaxPrefilter:Ft(Rt),ajaxTransport:Ft(Mt),ajax:function(e,t){"object"==typeof e&&(t=e,e=void 0),t=t||{};var c,f,p,n,d,r,h,g,i,o,v=S.ajaxSetup({},t),y=v.context||v,m=v.context&&(y.nodeType||y.jquery)?S(y):S.event,x=S.Deferred(),b=S.Callbacks("once memory"),w=v.statusCode||{},a={},s={},u="canceled",T={readyState:0,getResponseHeader:function(e){var t;if(h){if(!n){n={};while(t=Ht.exec(p))n[t[1].toLowerCase()+" "]=(n[t[1].toLowerCase()+" "]||[]).concat(t[2])}t=n[e.toLowerCase()+" "]}return null==t?null:t.join(", ")},getAllResponseHeaders:function(){return h?p:null},setRequestHeader:function(e,t){return null==h&&(e=s[e.toLowerCase()]=s[e.toLowerCase()]||e,a[e]=t),this},overrideMimeType:function(e){return null==h&&(v.mimeType=e),this},statusCode:function(e){var t;if(e)if(h)T.always(e[T.status]);else for(t in e)w[t]=[w[t],e[t]];return this},abort:function(e){var t=e||u;return c&&c.abort(t),l(0,t),this}};if(x.promise(T),v.url=((e||v.url||Tt.href)+"").replace(Pt,Tt.protocol+"//"),v.type=t.method||t.type||v.method||v.type,v.dataTypes=(v.dataType||"*").toLowerCase().match(P)||[""],null==v.crossDomain){r=E.createElement("a");try{r.href=v.url,r.href=r.href,v.crossDomain=Wt.protocol+"//"+Wt.host!=r.protocol+"//"+r.host}catch(e){v.crossDomain=!0}}if(v.data&&v.processData&&"string"!=typeof v.data&&(v.data=S.param(v.data,v.traditional)),Bt(Rt,v,t,T),h)return T;for(i in(g=S.event&&v.global)&&0==S.active++&&S.event.trigger("ajaxStart"),v.type=v.type.toUpperCase(),v.hasContent=!Ot.test(v.type),f=v.url.replace(qt,""),v.hasContent?v.data&&v.processData&&0===(v.contentType||"").indexOf("application/x-www-form-urlencoded")&&(v.data=v.data.replace(jt,"+")):(o=v.url.slice(f.length),v.data&&(v.processData||"string"==typeof v.data)&&(f+=(Et.test(f)?"&":"?")+v.data,delete v.data),!1===v.cache&&(f=f.replace(Lt,"$1"),o=(Et.test(f)?"&":"?")+"_="+Ct.guid+++o),v.url=f+o),v.ifModified&&(S.lastModified[f]&&T.setRequestHeader("If-Modified-Since",S.lastModified[f]),S.etag[f]&&T.setRequestHeader("If-None-Match",S.etag[f])),(v.data&&v.hasContent&&!1!==v.contentType||t.contentType)&&T.setRequestHeader("Content-Type",v.contentType),T.setRequestHeader("Accept",v.dataTypes[0]&&v.accepts[v.dataTypes[0]]?v.accepts[v.dataTypes[0]]+("*"!==v.dataTypes[0]?", "+It+"; q=0.01":""):v.accepts["*"]),v.headers)T.setRequestHeader(i,v.headers[i]);if(v.beforeSend&&(!1===v.beforeSend.call(y,T,v)||h))return T.abort();if(u="abort",b.add(v.complete),T.done(v.success),T.fail(v.error),c=Bt(Mt,v,t,T)){if(T.readyState=1,g&&m.trigger("ajaxSend",[T,v]),h)return T;v.async&&0<v.timeout&&(d=C.setTimeout(function(){T.abort("timeout")},v.timeout));try{h=!1,c.send(a,l)}catch(e){if(h)throw e;l(-1,e)}}else l(-1,"No Transport");function l(e,t,n,r){var i,o,a,s,u,l=t;h||(h=!0,d&&C.clearTimeout(d),c=void 0,p=r||"",T.readyState=0<e?4:0,i=200<=e&&e<300||304===e,n&&(s=function(e,t,n){var r,i,o,a,s=e.contents,u=e.dataTypes;while("*"===u[0])u.shift(),void 0===r&&(r=e.mimeType||t.getResponseHeader("Content-Type"));if(r)for(i in s)if(s[i]&&s[i].test(r)){u.unshift(i);break}if(u[0]in n)o=u[0];else{for(i in n){if(!u[0]||e.converters[i+" "+u[0]]){o=i;break}a||(a=i)}o=o||a}if(o)return o!==u[0]&&u.unshift(o),n[o]}(v,T,n)),!i&&-1<S.inArray("script",v.dataTypes)&&(v.converters["text script"]=function(){}),s=function(e,t,n,r){var i,o,a,s,u,l={},c=e.dataTypes.slice();if(c[1])for(a in e.converters)l[a.toLowerCase()]=e.converters[a];o=c.shift();while(o)if(e.responseFields[o]&&(n[e.responseFields[o]]=t),!u&&r&&e.dataFilter&&(t=e.dataFilter(t,e.dataType)),u=o,o=c.shift())if("*"===o)o=u;else if("*"!==u&&u!==o){if(!(a=l[u+" "+o]||l["* "+o]))for(i in l)if((s=i.split(" "))[1]===o&&(a=l[u+" "+s[0]]||l["* "+s[0]])){!0===a?a=l[i]:!0!==l[i]&&(o=s[0],c.unshift(s[1]));break}if(!0!==a)if(a&&e["throws"])t=a(t);else try{t=a(t)}catch(e){return{state:"parsererror",error:a?e:"No conversion from "+u+" to "+o}}}return{state:"success",data:t}}(v,s,T,i),i?(v.ifModified&&((u=T.getResponseHeader("Last-Modified"))&&(S.lastModified[f]=u),(u=T.getResponseHeader("etag"))&&(S.etag[f]=u)),204===e||"HEAD"===v.type?l="nocontent":304===e?l="notmodified":(l=s.state,o=s.data,i=!(a=s.error))):(a=l,!e&&l||(l="error",e<0&&(e=0))),T.status=e,T.statusText=(t||l)+"",i?x.resolveWith(y,[o,l,T]):x.rejectWith(y,[T,l,a]),T.statusCode(w),w=void 0,g&&m.trigger(i?"ajaxSuccess":"ajaxError",[T,v,i?o:a]),b.fireWith(y,[T,l]),g&&(m.trigger("ajaxComplete",[T,v]),--S.active||S.event.trigger("ajaxStop")))}return T},getJSON:function(e,t,n){return S.get(e,t,n,"json")},getScript:function(e,t){return S.get(e,void 0,t,"script")}}),S.each(["get","post"],function(e,i){S[i]=function(e,t,n,r){return m(t)&&(r=r||n,n=t,t=void 0),S.ajax(S.extend({url:e,type:i,dataType:r,data:t,success:n},S.isPlainObject(e)&&e))}}),S.ajaxPrefilter(function(e){var t;for(t in e.headers)"content-type"===t.toLowerCase()&&(e.contentType=e.headers[t]||"")}),S._evalUrl=function(e,t,n){return S.ajax({url:e,type:"GET",dataType:"script",cache:!0,async:!1,global:!1,converters:{"text script":function(){}},dataFilter:function(e){S.globalEval(e,t,n)}})},S.fn.extend({wrapAll:function(e){var t;return this[0]&&(m(e)&&(e=e.call(this[0])),t=S(e,this[0].ownerDocument).eq(0).clone(!0),this[0].parentNode&&t.insertBefore(this[0]),t.map(function(){var e=this;while(e.firstElementChild)e=e.firstElementChild;return e}).append(this)),this},wrapInner:function(n){return m(n)?this.each(function(e){S(this).wrapInner(n.call(this,e))}):this.each(function(){var e=S(this),t=e.contents();t.length?t.wrapAll(n):e.append(n)})},wrap:function(t){var n=m(t);return this.each(function(e){S(this).wrapAll(n?t.call(this,e):t)})},unwrap:function(e){return this.parent(e).not("body").each(function(){S(this).replaceWith(this.childNodes)}),this}}),S.expr.pseudos.hidden=function(e){return!S.expr.pseudos.visible(e)},S.expr.pseudos.visible=function(e){return!!(e.offsetWidth||e.offsetHeight||e.getClientRects().length)},S.ajaxSettings.xhr=function(){try{return new C.XMLHttpRequest}catch(e){}};var _t={0:200,1223:204},zt=S.ajaxSettings.xhr();y.cors=!!zt&&"withCredentials"in zt,y.ajax=zt=!!zt,S.ajaxTransport(function(i){var o,a;if(y.cors||zt&&!i.crossDomain)return{send:function(e,t){var n,r=i.xhr();if(r.open(i.type,i.url,i.async,i.username,i.password),i.xhrFields)for(n in i.xhrFields)r[n]=i.xhrFields[n];for(n in i.mimeType&&r.overrideMimeType&&r.overrideMimeType(i.mimeType),i.crossDomain||e["X-Requested-With"]||(e["X-Requested-With"]="XMLHttpRequest"),e)r.setRequestHeader(n,e[n]);o=function(e){return function(){o&&(o=a=r.onload=r.onerror=r.onabort=r.ontimeout=r.onreadystatechange=null,"abort"===e?r.abort():"error"===e?"number"!=typeof r.status?t(0,"error"):t(r.status,r.statusText):t(_t[r.status]||r.status,r.statusText,"text"!==(r.responseType||"text")||"string"!=typeof r.responseText?{binary:r.response}:{text:r.responseText},r.getAllResponseHeaders()))}},r.onload=o(),a=r.onerror=r.ontimeout=o("error"),void 0!==r.onabort?r.onabort=a:r.onreadystatechange=function(){4===r.readyState&&C.setTimeout(function(){o&&a()})},o=o("abort");try{r.send(i.hasContent&&i.data||null)}catch(e){if(o)throw e}},abort:function(){o&&o()}}}),S.ajaxPrefilter(function(e){e.crossDomain&&(e.contents.script=!1)}),S.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/\b(?:java|ecma)script\b/},converters:{"text script":function(e){return S.globalEval(e),e}}}),S.ajaxPrefilter("script",function(e){void 0===e.cache&&(e.cache=!1),e.crossDomain&&(e.type="GET")}),S.ajaxTransport("script",function(n){var r,i;if(n.crossDomain||n.scriptAttrs)return{send:function(e,t){r=S("<script>").attr(n.scriptAttrs||{}).prop({charset:n.scriptCharset,src:n.url}).on("load error",i=function(e){r.remove(),i=null,e&&t("error"===e.type?404:200,e.type)}),E.head.appendChild(r[0])},abort:function(){i&&i()}}});var Ut,Xt=[],Vt=/(=)\?(?=&|$)|\?\?/;S.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var e=Xt.pop()||S.expando+"_"+Ct.guid++;return this[e]=!0,e}}),S.ajaxPrefilter("json jsonp",function(e,t,n){var r,i,o,a=!1!==e.jsonp&&(Vt.test(e.url)?"url":"string"==typeof e.data&&0===(e.contentType||"").indexOf("application/x-www-form-urlencoded")&&Vt.test(e.data)&&"data");if(a||"jsonp"===e.dataTypes[0])return r=e.jsonpCallback=m(e.jsonpCallback)?e.jsonpCallback():e.jsonpCallback,a?e[a]=e[a].replace(Vt,"$1"+r):!1!==e.jsonp&&(e.url+=(Et.test(e.url)?"&":"?")+e.jsonp+"="+r),e.converters["script json"]=function(){return o||S.error(r+" was not called"),o[0]},e.dataTypes[0]="json",i=C[r],C[r]=function(){o=arguments},n.always(function(){void 0===i?S(C).removeProp(r):C[r]=i,e[r]&&(e.jsonpCallback=t.jsonpCallback,Xt.push(r)),o&&m(i)&&i(o[0]),o=i=void 0}),"script"}),y.createHTMLDocument=((Ut=E.implementation.createHTMLDocument("").body).innerHTML="<form></form><form></form>",2===Ut.childNodes.length),S.parseHTML=function(e,t,n){return"string"!=typeof e?[]:("boolean"==typeof t&&(n=t,t=!1),t||(y.createHTMLDocument?((r=(t=E.implementation.createHTMLDocument("")).createElement("base")).href=E.location.href,t.head.appendChild(r)):t=E),o=!n&&[],(i=N.exec(e))?[t.createElement(i[1])]:(i=xe([e],t,o),o&&o.length&&S(o).remove(),S.merge([],i.childNodes)));var r,i,o},S.fn.load=function(e,t,n){var r,i,o,a=this,s=e.indexOf(" ");return-1<s&&(r=vt(e.slice(s)),e=e.slice(0,s)),m(t)?(n=t,t=void 0):t&&"object"==typeof t&&(i="POST"),0<a.length&&S.ajax({url:e,type:i||"GET",dataType:"html",data:t}).done(function(e){o=arguments,a.html(r?S("<div>").append(S.parseHTML(e)).find(r):e)}).always(n&&function(e,t){a.each(function(){n.apply(this,o||[e.responseText,t,e])})}),this},S.expr.pseudos.animated=function(t){return S.grep(S.timers,function(e){return t===e.elem}).length},S.offset={setOffset:function(e,t,n){var r,i,o,a,s,u,l=S.css(e,"position"),c=S(e),f={};"static"===l&&(e.style.position="relative"),s=c.offset(),o=S.css(e,"top"),u=S.css(e,"left"),("absolute"===l||"fixed"===l)&&-1<(o+u).indexOf("auto")?(a=(r=c.position()).top,i=r.left):(a=parseFloat(o)||0,i=parseFloat(u)||0),m(t)&&(t=t.call(e,n,S.extend({},s))),null!=t.top&&(f.top=t.top-s.top+a),null!=t.left&&(f.left=t.left-s.left+i),"using"in t?t.using.call(e,f):("number"==typeof f.top&&(f.top+="px"),"number"==typeof f.left&&(f.left+="px"),c.css(f))}},S.fn.extend({offset:function(t){if(arguments.length)return void 0===t?this:this.each(function(e){S.offset.setOffset(this,t,e)});var e,n,r=this[0];return r?r.getClientRects().length?(e=r.getBoundingClientRect(),n=r.ownerDocument.defaultView,{top:e.top+n.pageYOffset,left:e.left+n.pageXOffset}):{top:0,left:0}:void 0},position:function(){if(this[0]){var e,t,n,r=this[0],i={top:0,left:0};if("fixed"===S.css(r,"position"))t=r.getBoundingClientRect();else{t=this.offset(),n=r.ownerDocument,e=r.offsetParent||n.documentElement;while(e&&(e===n.body||e===n.documentElement)&&"static"===S.css(e,"position"))e=e.parentNode;e&&e!==r&&1===e.nodeType&&((i=S(e).offset()).top+=S.css(e,"borderTopWidth",!0),i.left+=S.css(e,"borderLeftWidth",!0))}return{top:t.top-i.top-S.css(r,"marginTop",!0),left:t.left-i.left-S.css(r,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var e=this.offsetParent;while(e&&"static"===S.css(e,"position"))e=e.offsetParent;return e||re})}}),S.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(t,i){var o="pageYOffset"===i;S.fn[t]=function(e){return $(this,function(e,t,n){var r;if(x(e)?r=e:9===e.nodeType&&(r=e.defaultView),void 0===n)return r?r[i]:e[t];r?r.scrollTo(o?r.pageXOffset:n,o?n:r.pageYOffset):e[t]=n},t,e,arguments.length)}}),S.each(["top","left"],function(e,n){S.cssHooks[n]=$e(y.pixelPosition,function(e,t){if(t)return t=Be(e,n),Me.test(t)?S(e).position()[n]+"px":t})}),S.each({Height:"height",Width:"width"},function(a,s){S.each({padding:"inner"+a,content:s,"":"outer"+a},function(r,o){S.fn[o]=function(e,t){var n=arguments.length&&(r||"boolean"!=typeof e),i=r||(!0===e||!0===t?"margin":"border");return $(this,function(e,t,n){var r;return x(e)?0===o.indexOf("outer")?e["inner"+a]:e.document.documentElement["client"+a]:9===e.nodeType?(r=e.documentElement,Math.max(e.body["scroll"+a],r["scroll"+a],e.body["offset"+a],r["offset"+a],r["client"+a])):void 0===n?S.css(e,t,i):S.style(e,t,n,i)},s,n?e:void 0,n)}})}),S.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(e,t){S.fn[t]=function(e){return this.on(t,e)}}),S.fn.extend({bind:function(e,t,n){return this.on(e,null,t,n)},unbind:function(e,t){return this.off(e,null,t)},delegate:function(e,t,n,r){return this.on(t,e,n,r)},undelegate:function(e,t,n){return 1===arguments.length?this.off(e,"**"):this.off(t,e||"**",n)},hover:function(e,t){return this.mouseenter(e).mouseleave(t||e)}}),S.each("blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu".split(" "),function(e,n){S.fn[n]=function(e,t){return 0<arguments.length?this.on(n,null,e,t):this.trigger(n)}});var Gt=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;S.proxy=function(e,t){var n,r,i;if("string"==typeof t&&(n=e[t],t=e,e=n),m(e))return r=s.call(arguments,2),(i=function(){return e.apply(t||this,r.concat(s.call(arguments)))}).guid=e.guid=e.guid||S.guid++,i},S.holdReady=function(e){e?S.readyWait++:S.ready(!0)},S.isArray=Array.isArray,S.parseJSON=JSON.parse,S.nodeName=A,S.isFunction=m,S.isWindow=x,S.camelCase=X,S.type=w,S.now=Date.now,S.isNumeric=function(e){var t=S.type(e);return("number"===t||"string"===t)&&!isNaN(e-parseFloat(e))},S.trim=function(e){return null==e?"":(e+"").replace(Gt,"")},"function"==typeof define&&define.amd&&define("jquery",[],function(){return S});var Yt=C.jQuery,Qt=C.$;return S.noConflict=function(e){return C.$===S&&(C.$=Qt),e&&C.jQuery===S&&(C.jQuery=Yt),S},"undefined"==typeof e&&(C.jQuery=C.$=S),S});
;{"version":3,"sources":["jquery.js"],"names":["global","factory","module","exports","document","w","Error","window","this","noGlobal","arr","getProto","Object","getPrototypeOf","slice","flat","array","call","concat","apply","push","indexOf","class2type","toString","hasOwn","hasOwnProperty","fnToString","ObjectFunctionString","support","isFunction","obj","nodeType","isWindow","preservedScriptAttributes","type","src","nonce","noModule","DOMEval","code","node","doc","i","val","script","createElement","text","getAttribute","setAttribute","head","appendChild","parentNode","removeChild","toType","version","jQuery","selector","context","fn","init","isArrayLike","length","prototype","jquery","constructor","toArray","get","num","pushStack","elems","ret","merge","prevObject","each","callback","map","elem","arguments","first","eq","last","even","grep","_elem","odd","len","j","end","sort","splice","extend","options","name","copy","copyIsArray","clone","target","deep","isPlainObject","Array","isArray","undefined","expando","Math","random","replace","isReady","error","msg","noop","proto","Ctor","isEmptyObject","globalEval","makeArray","results","inArray","second","invert","matches","callbackExpect","arg","value","guid","Symbol","iterator","split","_i","toLowerCase","Sizzle","Expr","getText","isXML","tokenize","compile","select","outermostContext","sortInput","hasDuplicate","setDocument","docElem","documentIsHTML","rbuggyQSA","rbuggyMatches","contains","Date","preferredDoc","dirruns","done","classCache","createCache","tokenCache","compilerCache","nonnativeSelectorCache","sortOrder","a","b","pop","pushNative","list","booleans","whitespace","identifier","attributes","pseudos","rwhitespace","RegExp","rtrim","rcomma","rcombinators","rdescend","rpseudo","ridentifier","matchExpr","ID","CLASS","TAG","ATTR","PSEUDO","CHILD","bool","needsContext","rhtml","rinputs","rheader","rnative","rquickExpr","rsibling","runescape","funescape","escape","nonHex","high","String","fromCharCode","rcssescape","fcssescape","ch","asCodePoint","charCodeAt","unloadHandler","inDisabledFieldset","addCombinator","disabled","nodeName","dir","next","childNodes","e","els","seed","m","nid","match","groups","newSelector","newContext","ownerDocument","exec","getElementById","id","getElementsByTagName","getElementsByClassName","qsa","test","testContext","scope","toSelector","join","querySelectorAll","qsaError","removeAttribute","keys","cache","key","cacheLength","shift","markFunction","assert","el","addHandle","attrs","handler","attrHandle","siblingCheck","cur","diff","sourceIndex","nextSibling","createInputPseudo","createButtonPseudo","createDisabledPseudo","isDisabled","createPositionalPseudo","argument","matchIndexes","namespace","namespaceURI","documentElement","hasCompare","subWindow","defaultView","top","addEventListener","attachEvent","className","createComment","getById","getElementsByName","filter","attrId","find","getAttributeNode","tag","tmp","input","innerHTML","matchesSelector","webkitMatchesSelector","mozMatchesSelector","oMatchesSelector","msMatchesSelector","disconnectedMatch","compareDocumentPosition","adown","bup","compare","sortDetached","aup","ap","bp","unshift","expr","elements","attr","specified","sel","uniqueSort","duplicates","detectDuplicates","sortStable","textContent","firstChild","nodeValue","selectors","createPseudo","relative",">"," ","+","~","preFilter","excess","unquoted","nodeNameSelector","pattern","operator","check","result","what","_argument","simple","forward","ofType","_context","xml","uniqueCache","outerCache","nodeIndex","start","parent","useCache","lastChild","uniqueID","pseudo","args","setFilters","idx","matched","not","matcher","unmatched","has","lang","elemLang","hash","location","root","focus","activeElement","hasFocus","href","tabIndex","enabled","checked","selected","selectedIndex","empty","header","button","_matchIndexes","lt","gt","radio","checkbox","file","password","image","submit","reset","tokens","combinator","base","skip","checkNonElements","doneName","oldCache","newCache","elementMatcher","matchers","condense","newUnmatched","mapped","setMatcher","postFilter","postFinder","postSelector","temp","preMap","postMap","preexisting","contexts","multipleContexts","matcherIn","matcherOut","matcherFromTokens","checkContext","leadingRelative","implicitRelative","matchContext","matchAnyContext","filters","parseOnly","soFar","preFilters","cached","elementMatchers","setMatchers","bySet","byElement","superMatcher","outermost","matchedCount","setMatched","contextBackup","dirrunsUnique","token","compiled","_name","defaultValue","unique","isXMLDoc","escapeSelector","until","truncate","is","siblings","n","rneedsContext","rsingleTag","winnow","qualifier","self","rootjQuery","parseHTML","ready","rparentsprev","guaranteedUnique","children","contents","prev","sibling","targets","l","closest","index","prevAll","add","addBack","parents","parentsUntil","nextAll","nextUntil","prevUntil","contentDocument","content","reverse","rnothtmlwhite","Identity","v","Thrower","ex","adoptValue","resolve","reject","noValue","method","promise","fail","then","Callbacks","object","_","flag","firing","memory","fired","locked","queue","firingIndex","fire","once","stopOnFalse","remove","disable","lock","fireWith","Deferred","func","tuples","state","always","deferred","catch","pipe","fns","newDefer","tuple","returned","progress","notify","onFulfilled","onRejected","onProgress","maxDepth","depth","special","that","mightThrow","TypeError","notifyWith","resolveWith","process","exceptionHook","stackTrace","rejectWith","getStackHook","setTimeout","stateString","when","singleValue","remaining","resolveContexts","resolveValues","master","updateFunc","rerrorNames","stack","console","warn","message","readyException","readyList","completed","removeEventListener","readyWait","wait","readyState","doScroll","access","chainable","emptyGet","raw","bulk","_key","rmsPrefix","rdashAlpha","fcamelCase","_all","letter","toUpperCase","camelCase","string","acceptData","owner","Data","uid","defineProperty","configurable","set","data","prop","hasData","dataPriv","dataUser","rbrace","rmultiDash","dataAttr","JSON","parse","removeData","_data","_removeData","dequeue","startLength","hooks","_queueHooks","stop","setter","clearQueue","count","defer","pnum","source","rcssNum","cssExpand","isAttached","composed","getRootNode","isHiddenWithinTree","style","display","css","adjustCSS","valueParts","tween","adjusted","scale","maxIterations","currentValue","initial","unit","cssNumber","initialInUnit","defaultDisplayMap","showHide","show","values","body","hide","toggle","div","rcheckableType","rtagName","rscriptType","createDocumentFragment","checkClone","cloneNode","noCloneChecked","option","wrapMap","thead","col","tr","td","_default","getAll","setGlobalEval","refElements","tbody","tfoot","colgroup","caption","th","optgroup","buildFragment","scripts","selection","ignored","wrap","attached","fragment","nodes","htmlPrefilter","createTextNode","rkeyEvent","rmouseEvent","rtypenamespace","returnTrue","returnFalse","expectSync","err","safeActiveElement","on","types","one","origFn","event","off","leverageNative","notAsync","saved","isTrigger","delegateType","stopPropagation","stopImmediatePropagation","preventDefault","trigger","Event","handleObjIn","eventHandle","events","t","handleObj","handlers","namespaces","origType","elemData","create","handle","triggered","dispatch","bindType","delegateCount","setup","mappedTypes","origCount","teardown","removeEvent","nativeEvent","handlerQueue","fix","delegateTarget","preDispatch","isPropagationStopped","currentTarget","isImmediatePropagationStopped","rnamespace","postDispatch","matchedHandlers","matchedSelectors","addProp","hook","enumerable","originalEvent","writable","load","noBubble","click","beforeunload","returnValue","props","isDefaultPrevented","defaultPrevented","relatedTarget","timeStamp","now","isSimulated","altKey","bubbles","cancelable","changedTouches","ctrlKey","detail","eventPhase","metaKey","pageX","pageY","shiftKey","view","char","charCode","keyCode","buttons","clientX","clientY","offsetX","offsetY","pointerId","pointerType","screenX","screenY","targetTouches","toElement","touches","which","blur","mouseenter","mouseleave","pointerenter","pointerleave","orig","related","rnoInnerhtml","rchecked","rcleanScript","manipulationTarget","disableScript","restoreScript","cloneCopyEvent","dest","udataOld","udataCur","domManip","collection","hasScripts","iNoClone","valueIsFunction","html","_evalUrl","keepData","cleanData","dataAndEvents","deepDataAndEvents","srcElements","destElements","inPage","detach","append","prepend","insertBefore","before","after","replaceWith","replaceChild","appendTo","prependTo","insertAfter","replaceAll","original","insert","rnumnonpx","getStyles","opener","getComputedStyle","swap","old","rboxStyle","curCSS","computed","width","minWidth","maxWidth","getPropertyValue","pixelBoxStyles","addGetHookIf","conditionFn","hookFn","computeStyleTests","container","cssText","divStyle","pixelPositionVal","reliableMarginLeftVal","roundPixelMeasures","marginLeft","right","pixelBoxStylesVal","boxSizingReliableVal","position","scrollboxSizeVal","offsetWidth","measure","round","parseFloat","reliableTrDimensionsVal","backgroundClip","clearCloneStyle","boxSizingReliable","pixelPosition","reliableMarginLeft","scrollboxSize","reliableTrDimensions","table","trChild","trStyle","height","parseInt","cssPrefixes","emptyStyle","vendorProps","finalPropName","final","cssProps","capName","vendorPropName","rdisplayswap","rcustomProp","cssShow","visibility","cssNormalTransform","letterSpacing","fontWeight","setPositiveNumber","subtract","max","boxModelAdjustment","dimension","box","isBorderBox","styles","computedVal","extra","delta","ceil","getWidthOrHeight","valueIsBorderBox","offsetProp","getClientRects","Tween","easing","cssHooks","opacity","animationIterationCount","columnCount","fillOpacity","flexGrow","flexShrink","gridArea","gridColumn","gridColumnEnd","gridColumnStart","gridRow","gridRowEnd","gridRowStart","lineHeight","order","orphans","widows","zIndex","zoom","origName","isCustomProp","setProperty","isFinite","getBoundingClientRect","scrollboxSizeBuggy","left","margin","padding","border","prefix","suffix","expand","expanded","parts","propHooks","run","percent","eased","duration","pos","step","fx","scrollTop","scrollLeft","linear","p","swing","cos","PI","fxNow","inProgress","opt","rfxtypes","rrun","schedule","hidden","requestAnimationFrame","interval","tick","createFxNow","genFx","includeWidth","createTween","animation","Animation","tweeners","properties","stopped","prefilters","currentTime","startTime","tweens","opts","specialEasing","originalProperties","originalOptions","gotoEnd","propFilter","bind","complete","timer","anim","*","tweener","oldfire","propTween","restoreDisplay","isBox","dataShow","unqueued","overflow","overflowX","overflowY","prefilter","speed","speeds","fadeTo","to","animate","optall","doAnimation","finish","stopQueue","timers","cssFn","slideDown","slideUp","slideToggle","fadeIn","fadeOut","fadeToggle","slow","fast","delay","time","timeout","clearTimeout","checkOn","optSelected","radioValue","boolHook","removeAttr","nType","attrHooks","attrNames","getter","lowercaseName","rfocusable","rclickable","stripAndCollapse","getClass","classesToArray","removeProp","propFix","tabindex","for","class","addClass","classes","curValue","clazz","finalValue","removeClass","toggleClass","stateVal","isValidValue","classNames","hasClass","rreturn","valHooks","optionSet","focusin","rfocusMorph","stopPropagationCallback","onlyHandlers","bubbleType","ontype","lastElement","eventPath","parentWindow","simulate","triggerHandler","attaches","rquery","parseXML","DOMParser","parseFromString","rbracket","rCRLF","rsubmitterTypes","rsubmittable","buildParams","traditional","param","s","valueOrFunction","encodeURIComponent","serialize","serializeArray","r20","rhash","rantiCache","rheaders","rnoContent","rprotocol","transports","allTypes","originAnchor","addToPrefiltersOrTransports","structure","dataTypeExpression","dataType","dataTypes","inspectPrefiltersOrTransports","jqXHR","inspected","seekingTransport","inspect","prefilterOrFactory","dataTypeOrTransport","ajaxExtend","flatOptions","ajaxSettings","active","lastModified","etag","url","isLocal","protocol","processData","async","contentType","accepts","json","responseFields","converters","* text","text html","text json","text xml","ajaxSetup","settings","ajaxPrefilter","ajaxTransport","ajax","transport","cacheURL","responseHeadersString","responseHeaders","timeoutTimer","urlAnchor","fireGlobals","uncached","callbackContext","globalEventContext","completeDeferred","statusCode","requestHeaders","requestHeadersNames","strAbort","getResponseHeader","getAllResponseHeaders","setRequestHeader","overrideMimeType","mimeType","status","abort","statusText","finalText","crossDomain","host","hasContent","ifModified","headers","beforeSend","success","send","nativeStatusText","responses","isSuccess","response","modified","ct","finalDataType","firstDataType","ajaxHandleResponses","conv2","current","conv","dataFilter","throws","ajaxConvert","getJSON","getScript","text script","wrapAll","firstElementChild","wrapInner","htmlIsFunction","unwrap","visible","offsetHeight","xhr","XMLHttpRequest","xhrSuccessStatus","0","1223","xhrSupported","cors","errorCallback","open","username","xhrFields","onload","onerror","onabort","ontimeout","onreadystatechange","responseType","responseText","binary","scriptAttrs","charset","scriptCharset","evt","oldCallbacks","rjsonp","jsonp","jsonpCallback","originalSettings","callbackName","overwritten","responseContainer","jsonProp","createHTMLDocument","implementation","keepScripts","parsed","params","animated","offset","setOffset","curPosition","curLeft","curCSSTop","curTop","curOffset","curCSSLeft","curElem","using","rect","win","pageYOffset","pageXOffset","offsetParent","parentOffset","scrollTo","Height","Width","","defaultExtra","funcName","unbind","delegate","undelegate","hover","fnOver","fnOut","proxy","holdReady","hold","parseJSON","isNumeric","isNaN","trim","define","amd","_jQuery","_$","$","noConflict"],"mappings":"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","file":"jquery.min.js"};