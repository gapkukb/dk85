<script setup lang="ts"></script>

<template>
    <table
        cellspacing="0"
        cellpadding="0"
        class="table-fixed w-full text-center bg-white"
    >
        <thead class="sticky h-72 top-92 bg-white font-medium">
            <th class="w-320">{{ $t('app.dateTime') }}</th>
            <th>{{ $t('app.amount') }}</th>
            <th>{{ $t('app.amount') }}</th>
        </thead>
        <tbody class="c-#666">
            <tr
                v-for="item in 100"
                class="h-80"
            >
                <td class="fs-24">2020-05-22 12:00:00</td>
                <td>200.00</td>
                <td>30000.00</td>
            </tr>
        </tbody>
    </table>
</template>

<style lang="scss">
.page-turnover-history{
    padding: 0;
}
</style>
