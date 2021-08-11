<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>

    <div class="OverTwentyOne">
      <p class="question">Hey YOU!...Are you over the age of 21?</p>
      <div id="buttons">
        <a href="#" class="btn blue">YES! LEMME IN!</a>
        <a href="#" class="btn red">No. I'm too young:(</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style >
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

.OverTwentyOne {
  border: solid rgb(250, 146, 60) 10px;
  font-family: 'Open Sans', 'sans-serif';
  border-radius: 50px;
  margin-top: 100px;
  font-size: 33px;
  height: 275px;
  width: auto;
  margin-left: 200px;
  margin-right: 200px;
  justify-content: center;
  text-align: center;
  background-color: rgb(201, 225, 247);
}

.question {
  font-weight: bold;
  font-family: 'Open Sans', 'sans-serif';
  padding-top: 3%;
  color: rgb(72, 88, 102);
}

.enjoy {
}

#buttons {
  padding-top: 25px;
  text-align: center;
}

.btn {
  border-radius: 5px;
  padding: 15px 25px;
  font-size: 22px;
  text-decoration: none;
  margin: 20px;
  color: #fff;
  position: relative;
  display: inline-block;
  cursor: url(http://cur.cursors-4u.net/symbols/sym-1/sym46.cur), auto;
}

.blue {
  background-color: #55acee;
  box-shadow: 0px 5px 0px 0px #3c93d5;
}

.blue:hover {
  background-color: #6fc6ff;
}

.red {
  background-color: #e74c3c;
  box-shadow: 0px 5px 0px 0px #ce3323;
}

.red:hover {
  background-color: #ff6656;
}
</style>
