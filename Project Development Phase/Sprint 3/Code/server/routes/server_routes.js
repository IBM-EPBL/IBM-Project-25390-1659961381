const express = require('express');
const router = express.Router();

const addData = require('./../models/addData')


//to list specific user
router.post("/list/:userid", async function (req, res) {
    var account = await addData.find({ userid: req.params.userid });
    res.json(account);
});

//to list all accounts
router.get("/list", async function (req, res) {
    var account = await addData.find();
    res.json(account);
});

//to add a new account
router.post("/add", async function (req, res) {
    const insertData = new addData({
        id: req.body.id,
        userid: req.body.userid
    });
    await insertData.save();
    const response = { message: 'data insertion success' };
    res.json(response);
});

//to delete record
router.post("/delete", async function (req, res) {
    await addData.deleteMany({ id: req.body.id })
    const response = { message: 'data deletion success' };
    res.json(response);
});

module.exports = router;