exports.buildHeader = () => {
    const fields = ['ParticipantID', 'TestTime'];

    const additionalFields =
        [
            'AvgTimeSwitch',
            'AvgTimeNotswitch',
            'SwitchCost',
            'AvgSeq1Time',
            'AvgSeq2Time',
            'AvgSeq3Time',
            'AvgSeq4Time'
        ];

    for (let i = 0; i < 6; i++) {
        fields.push(`PT${i + 1}_type`);
        fields.push(`PT${i + 1}_switch`);
        fields.push(`PT${i + 1}_stimulus`);
        fields.push(`PT${i + 1}_correct`);
        fields.push(`PT${i + 1}_cost`);
        fields.push(`PT${i + 1}_exceedThresh`);
        fields.push(`PT${i + 1}_sequence`);
        fields.push(`PT${i + 1}_testsSinceSwitch`);
    }

    for (let i = 0; i < 80; i++) {
        fields.push(`T${i + 1}_type`);
        fields.push(`T${i + 1}_switch`);
        fields.push(`T${i + 1}_stimulus`);
        fields.push(`T${i + 1}_correct`);
        fields.push(`T${i + 1}_cost`);
        fields.push(`T${i + 1}_exceedThresh`);
        fields.push(`T${i + 1}_sequence`);
        fields.push(`T${i + 1}_testsSinceSwitch`);
    }

    let totalArr = fields.concat(additionalFields);
    let header = "";
    for (let i = 0; i < totalArr.length; i++) {
        header += totalArr[i] + ",";
    }
    header += "\n";
    return header;
}


exports.buildData = (input) => {
    let str = "";

    input.forEach(e => {
        let TotalTimeSwitch = [];
        let TotalTimeNotSwitch = [];

        let FreqSeq1 = false;
        let TotalSeq1Time = [];

        let FreqSeq2 = false;
        let TotalSeq2Time = [];

        let FreqSeq3 = false;
        let TotalSeq3Time = [];

        let FreqSeq4 = false;
        let TotalSeq4Time = [];

        str += e.id + ",";
        str += e.test_time + ",";

        e.practice_res.forEach(subRes => {
            str += subRes.type + ",";
            str += subRes.isSwitchedTask + ",";
            str += subRes.stimulus + ",";
            str += subRes.isCorrect + ",";
            str += subRes.switchingCost + ",";
            str += subRes.exceedThresh + ",";
            str += subRes.partition + ",";
            str += subRes.testsSinceSwitch + ",";
        });

        e.res.forEach(subRes => {
            str += subRes.type + ",";
            str += subRes.isSwitchedTask + ",";
            str += subRes.stimulus + ",";
            str += subRes.isCorrect + ",";
            str += subRes.switchingCost + ",";
            str += subRes.exceedThresh + ",";
            str += subRes.partition + ",";
            str += subRes.testsSinceSwitch + ",";

            if (isFrequency1(subRes.partition)) {
                TotalSeq1Time.push(subRes.switchingCost);
            }

            if (isFrequency2(subRes.partition)) {
                TotalSeq2Time.push(subRes.switchingCost);
            }

            if (isFrequency3(subRes.partition)) {
                TotalSeq3Time.push(subRes.switchingCost);
            }

            if (isFrequency4(subRes.partition)) {
                TotalSeq4Time.push(subRes.switchingCost);
            }

            if (subRes.isSwitchedTask) {
                TotalTimeSwitch.push(subRes.switchingCost);
            }

            if (!subRes.isSwitchedTask) {
                TotalTimeNotSwitch.push(subRes.switchingCost);
            }
        });

        let AvgTimeSwitch = calculateAvg(TotalTimeSwitch);
        let AvgTimeNotSwitch = calculateAvg(TotalTimeNotSwitch);
        let SwitchCost = Math.abs(AvgTimeNotSwitch - AvgTimeSwitch);
        let AvgSeq1Time = calculateAvg(TotalSeq1Time);
        let AvgSeq2Time = calculateAvg(TotalSeq2Time);
        let AvgSeq3Time = calculateAvg(TotalSeq3Time);
        let AvgSeq4Time = calculateAvg(TotalSeq4Time);

        str += AvgTimeSwitch + ",";
        str += AvgTimeNotSwitch + ",";
        str += SwitchCost + ",";
        str += AvgSeq1Time + ",";
        str += AvgSeq2Time + ",";
        str += AvgSeq3Time + ",";
        str += AvgSeq4Time + ",";

        str += "\n";
    });

    return str;
}

const calculateAvg = (input) => {
    var total = 0;
    for (var i = 0; i < input.length; i++) {
        total += input[i];
    }
    var avg = total / input.length;
    return avg;
}

const isFrequency1 = (partition) => {
    return partition === 1;
}

const isFrequency2 = (partition) => {
    return partition === 2;
}

const isFrequency3 = (partition) => {
    return partition === 3;
}

const isFrequency4 = (partition) => {
    return partition === 4;
}