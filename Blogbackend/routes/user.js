const express = require("express")
const User = require("../models/userModel");
const config = require("../config")
const jwt = require("jsonwebtoken")
const checkToken = require("../middleware");
const middleware = require("../middleware");
const router = express.Router();

router.route("/:username").get(middleware.checkToken, (req, res) => {
    User.findOne({ username: req.params.username }, (err, result) => {
        if (err)
            return res.status(500).json({ msg: err })
        res.json({
            data: result,
            username: req.params.username
        })
    })
})
router.route("/checkuser:username").get((req, res) => {
    User.findOne({ username: req.params.username }, (err, result) => {
        if (err)
            return res.status(500).json({ msg: err })
        if (result !== null) {
            return res.json({ status: true })
        } else {
            return res.json({ status: false })
        }
        res.json({
            data: result,
            username: req.params.username
        })
    })
})


router.route("/login").post((req, res) => {
    User.findOne({ username: req.body.username }, (err, result) => {
        if (err)
            return res.status(500).json({ msg: err })
        if (result == null) {
            return res.status(403).json("username incorrect")
        }
        if (result.password == req.body.password) {
            let token = jwt.sign({ username: req.body.username }, config.key, {
                expiresIn: "24h"
            })
            res.status(201).json({ token: token, msg: "success" })
        } else {
            return res.status(403).json({ msg: "password is incorrect", result: result })
        }
    })
})

router.route("/register").post((req, res) => {
    console.log("inside the register");
    const user = new User({
        username: req.body.username,
        password: req.body.password,
        email: req.body.password
    });

    user.save()
        .then(() => {
            console.log("user registered");
            res.status(200).json("ok")
        })
        .catch((err) => {
            res.status(403).json({ msg: err })
        });

});

router.route("/update/:username").patch(middleware.checkToken, (req, res) => {
    User.findOneAndUpdate(
        { username: req.params.username },
        { $set: { password: req.body.password } },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "password successfully updated",
                username: req.params.username,
                result: result
            }
            return res.json(msg)
        }
    )
})

router.route("/delete/:username").delete(middleware.checkToken, (req, res) => {
    User.findOneAndDelete({
        username: req.params.username
    }, (err, result) => {
        if (err) return res.status(500).json({ msg: err });
        const msg = {
            msg: "User deleted",
            username: req.params.username
        }
        return res.json(msg)
    })
})

module.exports = router;