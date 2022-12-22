<style>
invalid-feedback{
	display: none;
	width: 100%;
	margin-top: .25rem;
	font-size: 80%;
	color: #dc3545;
}

form {
	width: 60%;
	margin: 60px auto;
	background: #222;
	padding: 60px 120px 80px 120px;
	text-align: center;
	-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	position: relative;
	margin: 40px 0px;
}

.label-txt {
	position: absolute;
	top: -1.6em;
	padding: 10px;
	font-family: sans-serif;
	font-size: .8em;
	letter-spacing: 1px;
	color: rgb(120, 120, 120);
	transition: ease .3s;
}

.input {
	width: 100%;
	padding: 10px;
	background: transparent;
	border: none;
	outline: none;
	color: white;
}

.line-box {
	position: relative;
	width: 100%;
	height: 2px;
	background: #BCBCBC;
	margin: 0px auto;
}

.line {
	position: absolute;
	width: 0%;
	height: 2px;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	background: #8BC34A;
	transition: ease .6s;
}

.input:focus+.line-box .line {
	width: 100%;
}

.label-active {
	top: -3em;
}

button {
	display: inline-block;
	padding: 12px 24px;
	background: rgb(220, 220, 220);
	font-weight: bold;
	color: rgb(120, 120, 120);
	border: none;
	outline: none;
	border-radius: 3px;
	cursor: pointer;
	transition: ease .3s;
}

button:hover {
	background: #8BC34A;
	color: #ffffff;
}

@media ( max-width : 768px) and (min-width: 410px) {
	body {
		height: 100%;
		background: #333;
	}
	form {
		width: 80%;
		margin: 0px auto;
		background: #222;
		padding: 40px 90px 40px 0px;
		text-align: center;
		-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
		box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	}
	label {
		display: block;
		position: relative;
		margin-left: 60px;
	}
	.label-txt {
		position: absolute;
		top: -1.6em;
		padding: 10px;
		font-family: sans-serif;
		font-size: .8em;
		letter-spacing: 1px;
		color: rgb(120, 120, 120);
		transition: ease .3s;
	}
	.input {
		width: 100%;
		padding: 10px;
		background: transparent;
		border: none;
		outline: none;
	}
	.line-box {
		position: relative;
		width: 100%;
		height: 2px;
		background: #BCBCBC;
	}
	.line {
		position: absolute;
		width: 0%;
		height: 2px;
		top: 0px;
		left: 50%;
		transform: translateX(-50%);
		background: #8BC34A;
		transition: ease .6s;
	}
	.input:focus+.line-box .line {
		width: 100%;
	}
	.label-active {
		top: -3em;
	}
	button {
		display: inline-block;
		padding: 12px 24px;
		background: rgb(220, 220, 220);
		font-weight: bold;
		color: rgb(120, 120, 120);
		border: none;
		outline: none;
		border-radius: 3px;
		cursor: pointer;
		transition: ease .3s;
	}
	button:hover {
		background: #8BC34A;
		color: #ffffff;
	}
}

@media ( max-width : 409px) {
	body {
		background: #333;
		margin: 0px auto;
		height: 100%;
	}
	form {
		width: 60%;
		margin: 60px auto;
		background: #222;
		padding: 40px 90px 40px 0px;
		text-align: center;
		-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
		box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	}
	label {
		display: block;
		position: relative;
		margin: 60px auto;
	}
	.label-txt {
		position: absolute;
		top: -1.6em;
		padding: 10px;
		font-family: sans-serif;
		font-size: .8em;
		letter-spacing: 1px;
		color: rgb(120, 120, 120);
		transition: ease .3s;
	}
	.input {
		width: 100%;
		padding: 10px;
		background: transparent;
		border: none;
		outline: none;
	}
	.line-box {
		position: relative;
		width: 100%;
		height: 2px;
		background: #BCBCBC;
	}
	.line {
		position: absolute;
		width: 0%;
		height: 2px;
		top: 0px;
		left: 50%;
		transform: translateX(-50%);
		background: #8BC34A;
		transition: ease .6s;
	}
	.input:focus+.line-box .line {
		width: 100%;
	}
	.label-active {
		top: -3em;
	}
	button {
		display: inline-block;
		padding: 12px 24px;
		background: rgb(220, 220, 220);
		font-weight: bold;
		color: rgb(120, 120, 120);
		border: none;
		outline: none;
		border-radius: 3px;
		cursor: pointer;
		transition: ease .3s;
	}
	button:hover {
		background: #8BC34A;
		color: #ffffff;
	}
}
</style>