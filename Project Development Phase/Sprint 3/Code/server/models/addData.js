const mongoose = require('mongoose');
const orderid = require('order-id')('key');


const userDetails = mongoose.Schema({
    id: {
        type: String,
        required: true,
        unique: true,
    },
    userid: {
        type: String, required: true,
    },

    dateandtime: {
        type: Date, default: Date.now,
    }


});

module.exports = mongoose.model("userdb", userDetails);
