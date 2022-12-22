<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
a, a:focus, a:hover {
	color: #fff;
}

/* Custom default button */
.btn-secondary, .btn-secondary:hover, .btn-secondary:focus {
	color: #333;
	text-shadow: none; 
	background-color: #fff;
	border: .05rem solid #fff;
}

/*
 * Base structure
 */
html, body {
	height: 100%;
	background-color: #333;
}

body {
	display: -ms-flexbox;
	display: flex;
	color: #fff;
	text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
	box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
}

/*
 * Header
 */
.nav-masthead .nav-link {
	font-weight: 700;
	color: rgba(255, 255, 255, .5);
	background-color: transparent;
	border-bottom: 1px solid white;
}

.nav-masthead .nav-link:hover, .nav-masthead .nav-link:focus {
	border-bottom-color: rgba(255, 255, 255, .25);
}

.nav-masthead .nav-link+.nav-link {
	margin-left: 1rem;
}

.nav-masthead .active {
	color: #fff;
	border-bottom-color: #fff;
}

@media ( min-width : 48em) {
	.masthead-brand {
		float: left;
	}
	.nav-masthead {
		float: right;
	}
}

#title:hover {
	text-decoration: none;
}

/*
 * Cover
 */
.cover {
	padding: 0 1.5rem;
}

.cover .btn-lg {
	padding: .75rem 1.25rem;
	font-weight: 700;
}

/*
 * Footer
 */
.mastfoot {
	color: rgba(255, 255, 255, .5);
	height: 300px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.jb-box {
	width: 100%;
	height: 1000px;
	margin: 0px auto;
	position: relative;
}

video {
	width: 100%
}

.jb-text {
	position: absolute;
	top: 50%;
	width: 100%;
	font-size: 2em;
}
</style>