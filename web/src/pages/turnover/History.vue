<script setup lang="ts">

</script>

<template>
    <!-- <div class="grid grid-auto-rows-40 grid-cols-3 text-center">
        <div>DateTime</div>
        <div>Amount</div>
        <div>Amount</div>

        <template v-for="item in 100">
            <div>DateTime</div>
            <div>Amount</div>
            <div>Amount</div>
        </template>
</div> -->

    <table cellspacing="0" cellpadding="0" class="table-fixed w-full text-center">
        
        <thead class="sticky h-36 top-46 bg-white font-medium">
            <th class="w-160">{{ $t("app.dateTime") }}</th>
            <th>{{ $t("app.amount") }}</th>
            <th>{{ $t("app.amount") }}</th>
        </thead>
        <tbody class="c-#666">
            <tr v-for="item in 100" class="h-40">
                <td class="fs-12">2020-05-22 12:00:00</td>
                <td>200.00</td>
                <td>30000.00</td>
            </tr>
        </tbody>
    </table>

</template>

<style lang="scss" scoped></style>